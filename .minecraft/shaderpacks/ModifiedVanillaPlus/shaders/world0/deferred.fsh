#version 400 compatibility

/*
Copyright (C) 2019 RRe36

All Rights Reserved unless otherwise explicitly stated.


By downloading this you have agreed to the license and terms of use.
These can be found inside the included license-file or here: https://rre36.github.io/license/

Violating these terms may be penalized with actions according to the Digital Millennium Copyright Act (DMCA), the Information Society Directive and/or similar laws depending on your country.
*/

#include "/lib/common.glsl"

/*
stand in for sky pass
*/

/*
const int colortex0Format   = RGBA16F;
const int colortex1Format   = RGBA16;
const int colortex2Format   = RG16;
const int colortex3Format   = RGBA16F;
const int colortex4Format   = RGBA16F;
const int colortex5Format   = RGB16F;

const vec4 colortex0ClearColor = vec4(0.0, 0.0, 0.0, 1.0);
const vec4 colortex3ClearColor = vec4(0.0, 0.0, 0.0, 0.0);

c0  - 4x16 scene color (full)
c1  - 1x16 encoded normals, 1x16 lightmaps, 2x16 specular texture (gbuffer -> composite2)
c2  - 1x16 matID, 1x16 translucency albedo hue  (gbuffer -> composite2)
c3  - 4x16 translucencies  (water -> composite0), bloom (composite7 -> final)
c4  - temporals (full)
c5  - sky for reflection
*/

const int noiseTextureResolution = 256;

in vec2 coord;

flat in mat4x3 light_color;
flat in mat2x3 sky_color;

uniform sampler2D colortex0;
uniform sampler2D depthtex1;
uniform sampler2D noisetex;

uniform sampler2D depthtex2;

uniform int worldTime;

uniform float aspectRatio;
uniform float far, near;
uniform float cloud_bsfade;
uniform float frameTimeCounter;
uniform float rainStrength;

uniform vec3 upvec, upvecView;
uniform vec3 sunvec, sunvecView;
uniform vec3 moonvec, moonvecView;

uniform vec3 cloud_lvec, cloud_lvecView;
uniform vec3 cameraPosition;

uniform vec4 daytime;

uniform mat4 gbufferModelView, gbufferModelViewInverse;
uniform mat4 gbufferProjection, gbufferProjectionInverse;

vec3 screen_viewspace(vec3 screenpos, mat4 projInv) {
    screenpos   = screenpos*2.0-1.0;

    vec3 viewpos    = vec3(vec2(projInv[0].x, projInv[1].y)*screenpos.xy + projInv[3].xy, projInv[3].z);
        viewpos    /= projInv[2].w*screenpos.z + projInv[3].w;
    
    return viewpos;
}

vec3 screen_viewspace(vec3 screenpos) {
    return screen_viewspace(screenpos, gbufferProjectionInverse);
}

vec3 view_scenespace(vec3 viewpos, mat4 mvInv) {
    return viewMAD(mvInv, viewpos);
}

vec3 view_scenespace(vec3 viewpos) {
    return view_scenespace(viewpos, gbufferModelViewInverse);
}

float depth_lin(float depth) {
    return (2.0*near) / (far+near-depth * (far-near));
}

float get_mie(float x, float g) {
    float temp  = 1.0 + pow2(g) - 2.0*g*x;
    return (1.0 - pow2(g)) / ((4.0*pi) * temp*(temp*0.5+0.5));
}

vec3 get_sky(vec3 viewvec) {
    vec3 v      = -viewvec;
    vec3 hvt    = normalize(-upvecView+v);
    vec3 hvb    = normalize(upvecView+v);
    vec3 sv     = normalize(sunvecView+v);
    vec3 mv     = normalize(moonvecView+v);

    float hor_t = dot(hvt, v);
    float hor_b = dot(hvb, v);
    float sun   = 1.0-dot(sv, v);
    float hor   = linStep(1.0-hor_t, 0.0, 0.2958);

    float horizon   = pow5(hor);

    //float hfade     = linStep(hor_b, 0.3, 0.8);
        //hfade       = pow4(hfade)*0.75;
    float zenith    = 1.0-linStep(1.0-hor_t, 0.0, 0.2958);
        zenith      = exp(-zenith*1.5);

    float vdots     = dot(viewvec, sunvecView);

    float sunscatter = get_mie(vdots, 0.74)*rcp(pi)*(1.0-daytime.w);

    float sun_hint  = saturate(get_mie(vdots, 0.2)*rcp(0.2)*1.35);
        horizon     = mix(horizon, horizon*sun_hint, pow2(daytime.x + daytime.z)*0.8);

    vec3 sky    = sky_color[0];
        sky     = mix(sky, sky_color[1], horizon);
        sky    += light_color[0]*sunscatter*1.2 * (1.0 - rainStrength * 0.8);
        //sky     = hor > 0.99 ? vec3(horizon) : vec3( 0.0);

    return sky;
}

vec3 get_sun(vec3 viewvec) {
    vec3 v      = -viewvec;
    vec3 sv     = normalize(sunvecView+v);
    float sun   = dot(sv, v);

    float s   = 1.0-linStep(sun, 0.0055, 0.0059);
        //s    *= 1.0-sstep(sun, 0.004, 0.0059)*0.5;

    return s*light_color[0]*400.0;
}
vec3 get_sun(vec3 viewvec, vec3 albedo) {
    albedo      = mix(albedo, vec3(v3avg(albedo)), daytime.y*0.8);
    vec3 v      = -viewvec;
    vec3 sv     = normalize(sunvecView+v);
    float sun   = dot(sv, v);

    float s     = pow2(1.0-linStep(sun, 0.03, 0.25));

    return albedo*s*light_color[0]*40.0;
}

vec3 get_moon(vec3 viewvec, vec3 albedo) {
    vec3 v      = -viewvec;
    vec3 sv     = normalize(moonvecView+v);
    float sun   = dot(sv, v);

    float s     = pow2(1.0-linStep(sun, 0.04, 0.2));

    return albedo*s*light_color[3]*8.0;
}

vec3 noise_2d(vec2 pos) {
    return texture(noisetex, pos).xyz;
}

vec2 rotate_coord(vec2 pos, const float angle) {
    return vec2(cos(angle)*pos.x + sin(angle)*pos.y, 
                cos(angle)*pos.y - sin(angle)*pos.x);
}

vec3 get_stars(vec3 spos, vec3 svec) {
    vec3 plane  = svec/(svec.y+length(svec.xz)*0.66);
    float rot   = worldTime*rcp(2400.0);
    plane.x    += rot*0.6;
    plane.yz    = rotate_coord(plane.yz, (25.0/180.0)*pi);
    vec2 uv1    = floor((plane.xz)*768)/768;
    vec2 uv2    = (plane.xz)*0.04;

    vec3 starcol = vec3(0.5, 0.68, 1.0);
        starcol  = mix(starcol, vec3(1.0, 0.7, 0.6), noise_2d(uv2).x);
        starcol  = normalize(starcol)*(noise_2d(uv2*1.5).x+1.0);

    float star  = 1.0;
        star   *= noise_2d(uv1).x;
        star   *= noise_2d(uv1+0.1).x;
        star   *= noise_2d(uv1+0.26).x;

    star        = max(star-0.25, 0.0);
    star        = saturate(star*4.0);

    return star*starcol*0.1*sqrt(daytime.w);
}

/* ------ ambient occlusion and gi ------ */

#include "/lib/light/ao.glsl"

vec2 sincos(float x) {
    return vec2(sin(x), cos(x));
}

/* ------ cloud reflections ------ */

vec3 project_sphere(vec2 coord) {
    coord  *= vec2(tau, pi);
    vec2 lon = sincos(coord.x) * sin(coord.y);
    return vec3(lon.x, cos(coord.y), lon.y);
}

#ifdef cloud_reflections_enabled
    float dither_bluenoise_s() {
        ivec2 coord = ivec2(fract(gl_FragCoord.xy/256.0)*256.0);
        float noise = texelFetch(noisetex, coord, 0).a;

        return noise;
    }

    #include "/lib/atmos/clouds.glsl"

    void compute_vc(inout vec3 scenecol, in vec3 wvec) {
        bool visible    = wvec.y>0.0;

        if (visible) {
            const float vc_midalt = vcloud_alt+vcloud_depth*0.5;

            vec3 bs     = wvec*((vcloud_alt-64.0)/wvec.y);
            vec3 ts     = wvec*((vc_highedge-64.0)/wvec.y);

            vec3 spos   = bs;
            vec3 epos   = ts;

            float dither = dither_bluenoise_s();

            const int steps = 16;

            vec3 rstep  = (epos-spos)/steps;
            vec3 rpos   = rstep*dither + spos + vec3(cameraPosition.x, 64.0, cameraPosition.z);
            float rlength = length(rstep);

            vec3 scatter    = vec3(0.0);
            float transmittance = 1.0;
            float fade      = 0.0;
            float fdist     = vcloud_clip+1.0;

            vec3 sunlight   = (worldTime>23000 || worldTime<12900) ? light_color[0] : light_color[3]*0.3;
            sunlight   *= 1.0 - rainStrength * 0.5;
            vec3 skylight   = (worldTime>23000 || worldTime<12900) ? light_color[1] : light_color[1]*0.03;

            float vdotl     = dot(wvec, cloud_lvec);

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
                float directod  = vc_directOD(rpos, 4)*sigma_a;
                #else
                float directod  = (1.0-pow2(linStep(rpos.y, vcloud_alt, vc_highedge)))*vcloud_depth*sigma_a;
                #endif

                float skyod     = (1.0-linStep(rpos.y, vcloud_alt, vc_highedge))*vcloud_depth*sigma_a;

                float powder    = 1.0 - expf(-density * 40.0);
                float dpowder   = mix(powder, 1.0, pfade);

                for (int j = 0; j<3; ++j) {
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

            color      *= skyfade*fade;

            scenecol = scenecol * transmittance + color;
        }
    }
#endif

void main() {
    vec4 scenecol   = stex(colortex0);
    float scenedepth = stex(depthtex1).x;

    vec3 viewpos    = screen_viewspace(vec3(coord, scenedepth));
    vec3 viewvec    = normalize(viewpos);
    vec3 scenepos   = view_scenespace(viewpos);
    vec3 svec       = normalize(scenepos);

    if (!landMask(scenedepth)) {
        vec3 skycol = get_sky(viewvec);

        vec3 sun    = get_sun(viewvec, scenecol.rgb);
        vec3 moonstars = get_moon(viewvec, scenecol.rgb) + get_stars(scenepos, svec);

        scenecol.rgb = skycol + (sun+moonstars)*sstep(svec.y, -0.04, 0.01)*(1.0 - rainStrength);
    }

    vec4 return3    = vec4(0.0);

    #ifdef ambientOcclusion_enabled
        vec2 ao_coord   = (coord)*2.0;

        if (clamp(ao_coord, -0.003, 1.003) == ao_coord) {
            vec2 coord  = ao_coord;
            float scenedepth = stex(depthtex1).x;
            float ao    = calculate_dbao(depthtex1, scenedepth, coord);
            return3.x   = ao;
        }
    #endif

    /* ------ sky reflection ------ */

    vec4 return5    = vec4(0.0, 0.0, 0.0, 1.0);

    #ifdef reflections_enabled
    vec2 skyref_coord = (coord-vec2(0.55))*SKYREF_LOD;

    if (clamp(skyref_coord, -0.003, 1.003) == skyref_coord) {
        vec2 coord  = saturate(skyref_coord);
        vec3 svec   = project_sphere(coord)*vec3(1.0, 1.0, -1.0);
        vec3 vvec   = mat3(gbufferModelView)*svec;

        return5.rgb = get_sky(vvec);

        #ifdef cloud_reflections_enabled
        compute_vc(return5.rgb, svec);
        #endif
    }
    #endif

    /*DRAWBUFFERS:035*/
    gl_FragData[0]  = makeDrawbuffer(scenecol);
    gl_FragData[1]  = clampDrawbuffer(return3);
    gl_FragData[2]  = clampDrawbuffer(return5);
}