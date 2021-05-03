/*
Copyright (C) 2019 RRe36

All Rights Reserved unless otherwise explicitly stated.


By downloading this you have agreed to the license and terms of use.
These can be found inside the included license-file or here: https://rre36.github.io/license/

Violating these terms may be penalized with actions according to the Digital Millennium Copyright Act (DMCA), the Information Society Directive and/or similar laws depending on your country.
*/

#include "/lib/common.glsl"
#include "/lib/util/srgb.glsl"
#include "/lib/util/encoders.glsl"

const int shadowMapResolution   = 2048;     //[512 1024 1536 2048 4560 3072 3584 4096 6144 8192 16384]

in mat2x2 coord;

in float warp;

in vec3 pos_shadow;
in vec3 world_pos;

in vec4 tint;

flat in int mat_id;

flat in vec3 normal;

flat in float light_flip;

flat in mat4x3 light_color;

#ifdef g_terrain
    #ifdef custom_water_normal
        in float view_dist;
        flat in mat3x3 tbn;
    #endif
#endif

uniform sampler2D gcolor;

uniform sampler2D noisetex;

uniform int frameCounter;

uniform float frameTimeCounter;
uniform float sunAngle;

uniform vec2 viewSize;

uniform vec3 lightvec, lightvecView;

uniform sampler2DShadow shadowtex0;
uniform sampler2DShadow shadowtex1;
uniform sampler2D shadowcolor0;

uniform mat4 gbufferModelViewInverse, gbufferProjectionInverse;

float encodeMatID16(int x) {
    float id    = float(x)/65535.0;
    return id;
}

float bayer2e(vec2 a){
    a = floor(a);
    return fract( dot(a, vec2(.5, a.y * .75)) );
}
#define bayer4e(a)   (bayer2e( .5*(a))*.25+bayer2e(a))

#define m vec3(31,63,31)
float encode3x8(vec3 a){
    float dither = bayer4e(gl_FragCoord.xy);
    a += (dither-.5) / m;
    a = saturate(a);
    ivec3 b = ivec3(a*m);
    return float( b.r|(b.g<<5)|(b.b<<11) ) / 65535.;
}
#undef m

#ifdef g_terrain
    #ifdef custom_water_normal
    vec2 rotate_coord(vec2 pos, const float angle) {
        return vec2(cos(angle)*pos.x + sin(angle)*pos.y, 
                    cos(angle)*pos.y - sin(angle)*pos.x);
    }

    vec4 textureBicubic(sampler2D sampler, vec2 coord) {
        vec2 res = textureSize(sampler, 0);

        coord = coord * res - 0.5;

        vec2 f = fract(coord);
        coord -= f;

        vec2 ff = f * f;
        vec4 w0;
        vec4 w1;
        w0.xz = 1 - f; w0.xz *= w0.xz * w0.xz;
        w1.yw = ff * f;
        w1.xz = 3 * w1.yw + 4 - 6 * ff;
        w0.yw = 6 - w1.xz - w1.yw - w0.xz;

        vec4 s = w0 + w1;
        vec4 c = coord.xxyy + vec2(-0.5, 1.5).xyxy + w1 / s;
        c /= res.xxyy;

        vec2 m = s.xz / (s.xz + s.yw);
        return mix(
            mix(texture(sampler, c.yw), texture(sampler, c.xw), m.x),
            mix(texture(sampler, c.yz), texture(sampler, c.xz), m.x),
            m.y);
    }

    float water_noise(vec2 pos) {
        return pow2(1.0-textureBicubic(noisetex, pos/256.0).z);
    }

    float water_height(vec3 pos) {
        float time  = frameTimeCounter*6.0;
        if (mat_id == 103) time = 0.0;

        vec2 p      = pos.xz+pos.y*rcp(pi);
            p      *= 1.0;

        vec2 dir    = vec2(0.4, 0.8);

        float wave  = 0.0;

        float amp   = 0.5;
        float steep = 0.15;
        float wlength = 2.0;
        float a     = tau/2.618;

        p     = rotate_coord(p, a*0.3);
        p    *= 1.5;

        for (int i = 0; i<water_normal_octaves; ++i) {
            float n = water_noise(p+wave + dir*time)*amp;
            wave   += n;
            time   *= 1.2;
            amp    *= 0.4;
            //p     += n;
            p    *= 2.3;
            dir     = rotate_coord(dir.xy, a);
            p     = rotate_coord(p, a*0.1);
        }

        return wave*0.6;
    }

    vec3 water_normal() {
        vec3 offset[4] = vec3[4] ( 
                vec3(-1.0, 0.0, 0.0),
                vec3(1.0, 0.0, 0.0),
                vec3(0.0, 0.0, 1.0),
                vec3(0.0, 0.0, -1.0)
            );

        float delta_step = 0.05 + linStep(view_dist, 16.0, 64.0)*0.4;

        vec3 pos        = world_pos;

        float hL        = water_height(pos+offset[0]*delta_step);
        float hR        = water_height(pos+offset[1]*delta_step);
        float hU        = water_height(pos+offset[2]*delta_step);
        float hD        = water_height(pos+offset[3]*delta_step);

        vec3 delta      = vec3(0.0, 0.0, 1.0);

            delta.x     = (hL-hR)/delta_step;
            delta.y     = (hU-hD)/delta_step;

            delta.z     = sqrt(1.0 - dot(delta.xy, delta.xy));

            //delta       = clamp(delta, -1, 1);

        return normalize(delta*tbn);
    }
    #endif
#endif

#include "/lib/light/diffuse.glsl"

float get_specGGX(vec3 normal, vec3 viewvec, vec3 lvec, float roughness) {
    const float f0  = 0.02;
    roughness  *= roughness;

    vec3 h      = lvec - viewvec;
    float hn    = inversesqrt(dot(h, h));
    float hDotL = saturate(dot(h, lvec)*hn);
    float hDotN = saturate(dot(h, normal)*hn);
    float nDotL = saturate(dot(normal, lvec));
    float denom = (hDotN * roughness - hDotN) * hDotN + 1.0;
    float D     = roughness / (pi * denom * denom);
    float F     = f0 + (1.0-f0) * exp2((-5.55473*hDotL-6.98316)*hDotL);
    float k2    = 0.25 * roughness;

    return nDotL * D * F / (hDotL * hDotL * (1.0-k2) + k2);
}

float dither_bluenoise() {
    ivec2 coord = ivec2(fract(gl_FragCoord.xy/256.0)*256.0);
    float noise = texelFetch(noisetex, coord, 0).a;
        noise   = fract(noise+float(frameCounter)/4.0);

    return noise;
}

#include "/lib/light/shadow.glsl"

vec3 screen_viewspace(vec3 screenpos, mat4 projInv) {
    screenpos   = screenpos*2.0-1.0;

    //screenpos.xy -= taaOffset;

    vec3 viewpos    = vec3(vec2(projInv[0].x, projInv[1].y)*screenpos.xy + projInv[3].xy, projInv[3].z);
        viewpos    /= projInv[2].w*screenpos.z + projInv[3].w;
    
    return viewpos;
}

vec3 screen_viewspace(vec3 screenpos) {
    return screen_viewspace(screenpos, gbufferProjectionInverse);
}

vec3 get_lblock(vec3 lcol, float lmap) {
    return pow5(lmap)*lcol;
}

vec3 get_light(vec3 scenecol, vec3 normal, vec2 lmap, float ao) {
    float shadow    = 1.0;
    vec3 shadowcol  = vec3(1.0);

    float fake_gi   = pow6(linStep(lmap.y, 0.33, 1.0)) * light_flip;
    
    #if color_preset <= 1
        fake_gi    *= 0.05;
    #elif color_preset == 2
        fake_gi    *= 0.05;
    #elif color_preset >= 3
        fake_gi    *= 0.1;
    #endif

    lmap.y          = pow3(lmap.y);

    vec2 fragcoord  = gl_FragCoord.xy * rcp(viewSize);
    vec3 svec       = screen_viewspace(vec3(fragcoord, gl_FragCoord.z));
        svec        = normalize(mat3(gbufferModelViewInverse)*normalize(-svec));

    float diff      = get_diffLambert(normal);

    #if color_preset > 1
        diff        = sqrt(diff);
    #endif

    get_ldirect(shadow, shadowcol, diff>0.0);

    float diff_lit  = min(diff, shadow);
    vec3 direct_col     = sunAngle<0.5 ? light_color[0] : light_color[3];

    vec3 specular       = get_specGGX(normal, -lightvec, svec, 0.003)*diff_lit*shadowcol;
    if (sunAngle<0.5) specular *= 2.0;
        specular       *= direct_col*light_flip;

    vec3 direct_light   = diff_lit*shadowcol*direct_col*light_flip;

    #ifdef lightleakWorkaroundToggle
        direct_light   *= sstep(lmap.y, 0.03, 0.31);
    #endif

    vec3 indirect_light = lmap.y*light_color[1] + fake_gi*direct_col;
        indirect_light += vec3(0.5, 0.7, 1.0)*0.01*minlight_luma;
        indirect_light *= ao;

    vec3 result     = direct_light + indirect_light;
        result     += get_lblock(light_color[2], lmap.x)*ao;

    return scenecol * result + specular;
}

void main() {
    vec4 scenecol   = texture(gcolor, coord[0]);
    vec3 scenenormal = normal;
    if (scenecol.a<0.02) discard;
        scenecol.rgb *= tint.rgb;

    scenecol.rgb    = to_linear(scenecol.rgb);

    #ifdef g_terrain
        #if (defined custom_water_normal || defined custom_water_color)
        if (mat_id == 102) {

            #ifdef custom_water_color

                #if color_preset >= 2
                    scenecol.rgb = vec3(0.1, 0.7, 0.9)*0.3;
                    scenecol.a   = 0.66;
                #else
                    scenecol.rgb = vec3(0.07, 0.2, 0.9)*0.28;
                    scenecol.a   = 0.66;
                #endif

            #endif

            #ifdef custom_water_normal
                scenenormal  = water_normal();
            #endif
        }
        #endif
    #endif

    vec3 hue    = normalize(scenecol.rgb);

    scenecol.rgb = get_light(scenecol.rgb, scenenormal, coord[1], tint.a);

    #ifdef g_terrain
        if (mat_id == 102) {
            scenecol.a *= 0.7;
            hue      = vec3(1.0);
        }
    #endif

    scenecol.rgb *= 1.0 + (1.0 - pow2(scenecol.a));

    /*DRAWBUFFERS:312*/
    gl_FragData[0]  = makeDrawbuffer(scenecol.rgb, saturate(scenecol.a));
    gl_FragData[1]  = vec4(encode2x8(encodeNormal(scenenormal)), encode2x8(coord[1]), 1.0, 1.0);
    gl_FragData[2]  = vec4(encodeMatID16(mat_id), encode3x8(hue), 0.0, 1.0);
}