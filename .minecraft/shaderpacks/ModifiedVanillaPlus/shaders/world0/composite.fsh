#version 400 compatibility

/*
Copyright (C) 2019 RRe36

All Rights Reserved unless otherwise explicitly stated.


By downloading this you have agreed to the license and terms of use.
These can be found inside the included license-file or here: https://rre36.github.io/license/

Violating these terms may be penalized with actions according to the Digital Millennium Copyright Act (DMCA), the Information Society Directive and/or similar laws depending on your country.
*/

#include "/lib/common.glsl"
#include "/lib/util/encoders.glsl"

in vec2 coord;

flat in mat4x3 light_color;
flat in mat2x3 sky_color;

uniform sampler2D colortex0;
uniform sampler2D colortex1;
uniform sampler2D colortex2;
uniform sampler2D colortex3;
uniform sampler2D colortex5;

uniform sampler2D depthtex0;
uniform sampler2D depthtex1;

uniform sampler2D depthtex2;

uniform sampler2D noisetex;

uniform int isEyeInWater;
uniform int frameCounter;
uniform int worldTime;

uniform float eyeAltitude;
uniform float far;
uniform float near;
uniform float frameTimeCounter;
uniform float cloud_bsfade;
uniform float rainStrength;

uniform ivec2 eyeBrightness;
uniform ivec2 eyeBrightnessSmooth;

uniform vec2 viewSize;

uniform vec3 cloud_lvec, cloud_lvecView;
uniform vec3 cameraPosition;

uniform vec4 daytime;

uniform mat4 gbufferModelView, gbufferModelViewInverse;
uniform mat4 gbufferProjection, gbufferProjectionInverse;

vec3 decode3x8(float a){
    int bf = int(a*65535.);
    return vec3(bf%32, (bf>>5)%64, bf>>11) / vec3(31,63,31);
}

vec3 blend_translucencies(vec3 scenecol, vec4 translucents, vec3 albedo) {
    vec3 color  = scenecol;
        color  *= mix(vec3(1.0), albedo, translucents.a);
        color   = mix(color, translucents.rgb, translucents.a);

    return color;
}

float depth_lin(float depth) {
    return (2.0*near) / (far+near-depth * (far-near));
}

vec3 view_screenspace(vec3 viewpos) {
    return ((projMAD(gbufferProjection, viewpos) / -viewpos.z)) *0.5 + 0.5;
}

vec3 screen_viewspace(vec3 screenpos, mat4 projInv) {
    screenpos   = screenpos*2.0-1.0;

    vec3 viewpos    = vec3(vec2(projInv[0].x, projInv[1].y)*screenpos.xy + projInv[3].xy, projInv[3].z);
        viewpos    /= projInv[2].w*screenpos.z + projInv[3].w;
    
    return viewpos;
}

vec3 screen_viewspace(vec3 screenpos) {
    return screen_viewspace(screenpos, gbufferProjectionInverse);
}

float screen_viewspace(float depth, mat4 projInv) {
    depth   = depth * 2.0 - 1.0;
    return projInv[3].z / (projInv[2].w * depth + projInv[3].w);
}

vec3 view_scenespace(vec3 viewpos, mat4 mvInv) {
    return viewMAD(mvInv, viewpos);
}

vec3 view_scenespace(vec3 viewpos) {
    return view_scenespace(viewpos, gbufferModelViewInverse);
}

int decodeMatID16(float x) {
    return int(x*65535.0);
}

vec3 simple_fog(vec3 scenecolor, float d, vec3 color) {
    float start     = mix(fog_start, 0.1, rainStrength);
    float dist      = max(0.0, d-(far*start));
    float density   = 1.0-expf(-dist * 1.3e-3 * fog_density * (1.0 + rainStrength * 2.0));

    return mix(scenecolor, color, density);
}
vec3 water_fog(vec3 scenecolor, float d, vec3 color) {
    float dist      = max(0.0, d);
    float density   = dist*6.5e-1;
    
    #if color_preset >= 2
        vec3 scatter   = 1.0-expf(-min(density*0.8, 64e-1)*vec3(0.02, 0.34, 1.0));
        vec3 transmittance = expf(-density*vec3(1.0, 0.21, 0.09)*1.2);
    #else
        vec3 scatter   = 1.0-expf(-min(density*0.8, 64e-1)*vec3(0.02, 0.24, 1.0));
        vec3 transmittance = expf(-density*vec3(1.0, 0.28, 0.06)*1.2);
    #endif

    return scenecolor*transmittance + color*scatter*0.3;
}

#include "/lib/frag/bluenoise.glsl"

#ifdef vcloud_enabled
    #include "/lib/atmos/clouds.glsl"

    vec4 compute_vc(in vec3 vvec, in vec3 wvec, bool terrain, vec3 wpos) {
        float within    = sstep(eyeAltitude, vcloud_alt-10.0, vcloud_alt) * (1.0-sstep(eyeAltitude, vc_highedge, vc_highedge+10.0));
        bool visible    = eyeAltitude<vcloud_alt ? wvec.y>0.0 : wvec.y<=0.0;

        if (visible || within>0.0) {
            const float vc_midalt = vcloud_alt+vcloud_depth*0.5;

            bool is_below   = eyeAltitude<vc_midalt;

            vec3 bs     = wvec*((vcloud_alt-eyeAltitude)/wvec.y);
            vec3 ts     = wvec*((vc_highedge-eyeAltitude)/wvec.y);

            if (wvec.y<0.0 && is_below || wvec.y>0.0 && !is_below){
                bs = vec3(0.0);
                ts = vec3(0.0);
            }

            vec3 spos   = is_below ? bs : ts;
            vec3 epos   = is_below ? ts : bs;

                spos    = mix(spos, gbufferModelViewInverse[3].xyz, within);
                epos    = mix(epos, wvec*vcloud_clip*0.9, within);

            if (terrain) {
                spos    = gbufferModelViewInverse[3].xyz;
                epos    = wpos;
            }

            float dither = dither_bluenoise();

            #ifdef vcloud_adaptive_samples
            const float bl  = vcloud_depth/vcloud_samples;
            float stepl     = length((epos-spos)/vcloud_samples);
            float stepcoeff = stepl/bl;
                stepcoeff   = 0.45+clamp(stepcoeff-1.1, 0.0, 4.0)*0.5;
                stepcoeff   = mix(stepcoeff, 4.0, pow2(within));
            int steps       = int(vcloud_samples*stepcoeff);
            #else
            float stepcoeff = 1.0 + pow2(within) * 4.0;
            int steps       = int(vcloud_samples*stepcoeff);
            #endif

            vec3 rstep  = (epos-spos)/steps;
            vec3 rpos   = rstep*dither + spos + cameraPosition;
            float rlength = length(rstep);

            vec3 scatter    = vec3(0.0);
            float transmittance = 1.0;
            float fade      = 0.0;
            float fdist     = vcloud_clip+1.0;

            vec3 sunlight   = (worldTime>23000 || worldTime<12900) ? light_color[0] : light_color[3]*0.3;
                sunlight   *= 1.0 - rainStrength * 0.5;
            vec3 skylight   = (worldTime>23000 || worldTime<12900) ? light_color[1] : light_color[1]*0.03;

            float vdotl     = dot(vvec, cloud_lvecView);

            float pfade     = saturate(cloud_mie(vdotl, 0.65));

            const float sigma_a = 0.125;         //absorption coeff
            const float sigma_s = 1.0;         //scattering coeff, can technically be assumed to be sigma_t since the albedo is close to 1.0
            const float sigma_t = 1.0;         //extinction coeff, 0.05-0.12 for cumulus, 0.04-0.06 for stratus

            for (int i = 0; i<steps; ++i, rpos += rstep) {
                if (transmittance < 0.05) break;
                if (rpos.y < vcloud_alt || rpos.y > vc_highedge) continue;

                float dist  = distance(rpos, cameraPosition);
                float dfade = saturate(dist/vcloud_clip);
                if ((1.0-dfade)<0.01) continue;

                float density   = vcloud_density(rpos);
                if (density<=0.0) continue;

                if (fdist>vcloud_clip) fdist = dist;
                else fdist = mix(fdist, dist, transmittance);

                fade    = linStep(dfade, 0.75, 0.99);

                float extinction = density * sigma_t;
                float stept     = expf(-extinction*rlength);
                float integral  = (1.0 - stept) / sigma_t;

                vec3 result_s   = vec3(0.0);

                #ifdef vcloud_light
                float directod  = vc_directOD(rpos, 6)*sigma_a;
                #else
                float directod  = (1.0-pow2(linStep(rpos.y, vcloud_alt, vc_highedge)))*vcloud_depth*sigma_a;
                #endif

                float skyod     = (1.0-linStep(rpos.y, vcloud_alt, vc_highedge))*vcloud_depth*sigma_a;

                float powder    = 1.0 - expf(-density * 40.0);
                float dpowder   = mix(powder, 1.0, pfade);

                for (int j = 0; j<4; ++j) {
                    float n     = float(j);

                    float s_d   = sigma_s * pow(0.5, n);    //scatter derivate
                    float t_d   = sigma_t * pow(0.5, n);    //transmittance/attentuation derivate
                    float phase = cloud_phase(vdotl, pow(0.5, n));  //phase derivate

                    result_s.x += expf(-directod*t_d) * phase * dpowder * s_d;
                    result_s.y += expf(-skyod*t_d) * powder * s_d;
                }

                scatter    += result_s * integral * transmittance;

                transmittance *= stept;
            }

            fdist   = max(fdist, 0.0);
            transmittance = linStep(transmittance, 0.05, 1.0);
            scatter.x *= 1.1;

            vec3 color  = (sunlight*scatter.x) + (skylight*scatter.y);

            fade        = saturate(1.0-fade);

            float skyfade = expf(-fdist*cloud_atmos_density);
            
            transmittance = mix(1.0, transmittance, skyfade*fade);

            return vec4(color*skyfade*fade, transmittance);
        } else {
            return vec4(0.0, 0.0, 0.0, 1.0);
        }
    }
#endif

#ifdef reflections_enabled
    //based on robobo1221's shaders because my old ssr is shit
    vec4 ssrTrace(vec3 rdir, vec3 vpos, vec3 screenpos, float dither, float nDotV, const int steps, const int refine) {
        //const int steps     = 16;
        //const int refine    = 5;

        float rlength   = ((vpos.z + rdir.z * far * sqrt(3.0)) > -near) ? (-near - vpos.z) / rdir.z : far * sqrt(3.0);
        vec3 dir        = normalize(view_screenspace(rdir * rlength + vpos) - screenpos);
            dir.xy      = normalize(dir.xy);

        float maxlength = rcp(float(steps));
        float minlength = maxlength*0.05;

        float steplength = mix(minlength, maxlength, (max(nDotV, 0.0)));
        float stepweight = 1.0 / abs(dir.z);

        vec3 pos        = screenpos + dir*steplength*(dither + 0.5);

        float depth     = texelFetch(depthtex1, ivec2(pos.xy * viewSize), 0).x;
        bool ray_hit     = false;

        int i       = steps;
        int j       = refine;

        while (--i > 0) {
            steplength = clamp((depth - pos.z) * stepweight, minlength, maxlength);
            pos += dir*steplength;
            depth = texelFetch(depthtex1, ivec2(pos.xy * viewSize), 0).x;

            if (saturate(pos) != pos) return vec4(0.0);

            if (depth <= pos.z) break;
        }
        float mdepth    = depth;

        vec3 refpos     = pos;
        float refdepth  = depth;

        while (--j > 0) {
            refpos      = dir * clamp((depth - pos.z)*stepweight, -steplength, steplength) + pos;
            refdepth    = texelFetch(depthtex1, ivec2(refpos.xy * viewSize), 0).x;
            bool rayhit = refdepth <= refpos.z;
            if (rayhit) ray_hit = true;

            pos         = rayhit ? refpos : pos;
            depth       = rayhit ? refdepth : depth;

            steplength *= 0.5;
        }

        float sdepth    = texture(depthtex1, pos.xy).x;

        if (sdepth >= 1.0) return vec4(0.0);

        bool visible    = abs(pos.z - mdepth) * min(stepweight, 400.0) <= maxlength;

        return visible ? vec4(texture(colortex0, pos.xy).rgb, 1.0) : vec4(0.0);
    }
    vec4 ssrTrace(vec3 rdir, vec3 vpos, vec3 screenpos, float dither, float nDotV) {
        return ssrTrace(rdir, vpos, screenpos, dither, nDotV, 16, 4);
    }

    float fresnel_schlick(vec3 dir, vec3 normal) {
        vec3 halfdir    = normalize(normal + dir);

        float cosine    = dot(halfdir, dir);
        float fresnel   = max(cosine, 0.0);

        return pow3(fresnel);
    }

    vec2 unproject_sphere(vec3 dir) {
        vec2 lonlat     = vec2(atan(-dir.x, dir.z), acos(dir.y));
        return lonlat * vec2(rcp(tau), rcp(pi)) + vec2(0.5, 0.0);
    }

    void reflection(inout vec3 scenecol, in vec3 normal, in vec3 scenenormal, in float depth, vec2 lmap) {
        vec3 viewpos    = screen_viewspace(vec3(coord, depth));
        vec3 viewdir    = normalize(viewpos);
        vec3 scenepos   = view_scenespace(viewpos);
        vec3 scenedir   = normalize(scenepos);
        
        float nDotV     = saturate(dot(normal, viewdir));
        vec3 rdir       = normalize(reflect(viewdir, normal));

        float dither    = dither_bluenoise();

        //vec4 ssr        = ssr(rdir, viewpos);
        #ifdef ssr_enabled
        vec4 ssr        = ssrTrace(rdir, viewpos, vec3(coord, depth), dither, nDotV);
        #else
        const vec4 ssr  = vec4(0.0);
        #endif

        float fresnel   = max(fresnel_schlick(viewdir, normal), 0.02);

        float fmult     = pow2(sstep(lmap.y, 0.15, 0.95));

        vec2 spherecoord = unproject_sphere(normalize(mat3(gbufferModelViewInverse)*rdir));
            spherecoord = spherecoord*rcp(SKYREF_LOD) + vec2(0.55);

        vec3 reflection = texture(colortex5, spherecoord).rgb*fmult;
            reflection  = mix(reflection, ssr.rgb, ssr.a);

        scenecol        = mix(scenecol.rgb, reflection, fresnel*max(fmult, ssr.a));
    }
#endif

void main() {
    vec4 scenecol   = stex(colortex0);  //that macro certainly makes it neater
    vec4 tex1       = stex(colortex1);
    vec4 tex2       = stex(colortex2);
    vec4 tex3       = stex(colortex3);

    vec2 scenelmap  = decode2x8(tex1.y);

    vec3 scenenormal = decodeNormal(decode2x8(tex1.x));
    vec3 viewnormal = normalize(mat3(gbufferModelView) * scenenormal);

    int mat_id      = decodeMatID16(tex2.x);

    float scenedepth0 = stex(depthtex0).x;
    vec3 viewpos0     = screen_viewspace(vec3(coord, scenedepth0));
    vec3 spos0        = view_scenespace(viewpos0);

    float scenedepth1 = stex(depthtex1).x;
    vec3 viewpos1     = screen_viewspace(vec3(coord, scenedepth1));
    vec3 spos1        = view_scenespace(viewpos1);

    bool translucent = (scenedepth0<scenedepth1);

    bool water      = mat_id == 102;

    vec3 translucent_albedo = pow2(decode3x8(tex2.g));

    float cave_fix  = linStep(eyeBrightnessSmooth.y/240.0, 0.1, 0.9);

    vec3 fogcol     = mix(sky_color[0], sky_color[1], 0.6 + sqrt(daytime.y)*0.4);

    #ifdef vcloud_enabled
    vec4 vcloud     = compute_vc(normalize(viewpos1), normalize(spos1), landMask(scenedepth1), spos1);
    bool vcloud_tblend = translucent && (eyeAltitude < vcloud_alt ? (spos0.y + cameraPosition.y)<vcloud_alt : (spos0.y + cameraPosition.y) > vc_highedge);
        vcloud_tblend = vcloud_tblend && !(eyeAltitude > vcloud_alt && eyeAltitude < vc_highedge);
    #else
    const vec4 vcloud = vec4(0.0, 0.0, 0.0, 1.0);
    const bool vcloud_tblend = false;
    #endif

    float dist0     = distance(spos0, gbufferModelViewInverse[3].xyz);
    float dist1     = distance(spos1, gbufferModelViewInverse[3].xyz);

    if (translucent && isEyeInWater==0){
        if (water) scenecol.rgb = water_fog(scenecol.rgb, dist1-dist0, light_color[1]*cave_fix);

        #ifdef fog_enabled
        else if (landMask(scenedepth1)) scenecol.rgb = simple_fog(scenecol.rgb, dist1-dist0, fogcol*cave_fix);
        #endif
    }

    #ifdef fog_enabled
    if (landMask(scenedepth1) && isEyeInWater==1 && translucent) scenecol.rgb = simple_fog(scenecol.rgb, dist1-dist0, fogcol*cave_fix);
    #endif

    if (vcloud_tblend) scenecol.rgb = scenecol.rgb*vcloud.a + vcloud.rgb;

    scenecol.rgb    = blend_translucencies(scenecol.rgb, tex3, translucent_albedo);

    #ifdef reflections_enabled
        if (water || mat_id == 103) reflection(scenecol.rgb, viewnormal, scenenormal, scenedepth0, scenelmap);
    #endif

    #ifdef fog_enabled
    if (landMask(scenedepth0) && isEyeInWater==0) scenecol.rgb = simple_fog(scenecol.rgb, dist0, fogcol*cave_fix);
    #endif

    if (isEyeInWater==1) scenecol.rgb = water_fog(scenecol.rgb, dist0, light_color[1]*cave_fix);

    if (!vcloud_tblend) scenecol.rgb = scenecol.rgb*vcloud.a + vcloud.rgb;

    if (mat_id == 3) {
        if (landMask(scenedepth0)) scenecol.rgb = scenecol.rgb*0.7 + vec3(0.8)*v3avg(scenecol.rgb);
        else scenecol.rgb = scenecol.rgb*0.7 + vec3(0.8)*v3avg(scenecol.rgb);
    }

    vec4 return1    = vec4(1.0);

    #ifdef ssgr_enabled 
    /* --- */
    #endif

    #if (defined ssgr_enabled || defined lens_flare)
        if (landMask(scenedepth1)) return1.rgb = vec3(0.0);
        else if (translucent) return1.rgb = translucent_albedo;

        return1.rgb *= vcloud.a;
    #endif

    /*DRAWBUFFERS:01*/
    gl_FragData[0]  = makeDrawbuffer(scenecol);
    gl_FragData[1]  = clampDrawbuffer(return1);
}