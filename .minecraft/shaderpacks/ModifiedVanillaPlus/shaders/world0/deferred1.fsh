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
#include "/lib/util/srgb.glsl"

const int shadowMapResolution   = 2048;     //[512 1024 1536 2048 2560 3072 3584 4096 6144 8192 16384]
const float shadowDistance      = 128.0;

const bool shadowHardwareFiltering = true;

in vec2 coord;

flat in float light_flip;

flat in mat4x3 light_color;

uniform sampler2D colortex0;
uniform sampler2D colortex1;
uniform sampler2D colortex2;
uniform sampler2D colortex3;

uniform sampler2D noisetex;

uniform sampler2D depthtex1;

uniform sampler2DShadow shadowtex0;
uniform sampler2DShadow shadowtex1;
uniform sampler2D shadowcolor0;

uniform int frameCounter;

uniform float aspectRatio;
uniform float far, near;
uniform float sunAngle;
uniform float viewHeight, viewWidth;

uniform vec2 taaOffset;
uniform vec2 viewSize;

uniform vec3 lightvec, lightvecView;

uniform mat4 gbufferModelView, gbufferModelViewInverse;
uniform mat4 gbufferProjection, gbufferProjectionInverse;
uniform mat4 shadowModelView, shadowModelViewInverse;
uniform mat4 shadowProjection, shadowProjectionInverse;

vec3 screen_viewspace(vec3 screenpos, mat4 projInv) {
    screenpos   = screenpos*2.0-1.0;

    #ifdef taa_enabled
        screenpos.xy -= taaOffset;
    #endif

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

#include "/lib/light/diffuse.glsl"

#include "/lib/light/warp.glsl"

#include "/lib/frag/bluenoise.glsl"

#define g_solid

#include "/lib/light/shadow.glsl"

vec3 get_lblock(vec3 lcol, float lmap) {
    return pow5(lmap)*lcol;
}

float get_specGGX(vec3 normal, vec3 svec, vec2 material) {
    float f0  = material.y;
    float roughness = pow2(material.x);

    vec3 h      = lightvec - svec;
    float hn    = inversesqrt(dot(h, h));
    float hDotL = saturate(dot(h, lightvec)*hn);
    float hDotN = saturate(dot(h, normal)*hn);
    float nDotL = saturate(dot(normal, lightvec));
    float denom = (hDotN * roughness - hDotN) * hDotN + 1.0;
    float D     = roughness / (pi * denom * denom);
    float F     = f0 + (1.0-f0) * exp2((-5.55473*hDotL-6.98316)*hDotL);
    float k2    = 0.25 * roughness;

    return nDotL * D * F / (hDotL * hDotL * (1.0-k2) + k2);
}

vec3 get_light(vec3 scenecol, vec3 normal, vec3 viewpos, vec2 lmap, float ao, int matID, vec4 mat_data, bool is_metal) {
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

    float diff      = get_diffLambert(normal);

    #if color_preset > 1
        diff        = sqrt(diff);
    #endif

        diff        = matID != 2 ? diff : diff*0.3+0.7;

    get_ldirect(shadow, shadowcol, diff>0.0, viewpos);

    float diff_lit  = min(diff, shadow);
    vec3 direct_col     = sunAngle<0.5 ? light_color[0] : light_color[3];
    vec3 direct_light   = diff_lit*shadowcol*direct_col*light_flip;

    #if color_preset <= 1
        direct_light   *= ao * 0.6 + 0.4;
    #else
        direct_light   *= ao * 0.9 + 0.1;
    #endif

    #ifdef lightleakWorkaroundToggle
        direct_light   *= sstep(lmap.y, 0.03, 0.31);
    #endif

    vec3 indirect_light = (lmap.y + fake_gi) * light_color[1] + fake_gi*direct_col*0.5;
        indirect_light += vec3(0.5, 0.7, 1.0)*0.01*minlight_luma;
        indirect_light *= ao;

    vec3 result     = direct_light + indirect_light;
        result     += get_lblock(light_color[2], lmap.x)*ao;

    #ifdef labpbr_enabled
    vec3 specular   = direct_col * get_specGGX(normal, normalize(mat3(gbufferModelViewInverse) * viewpos), mat_data.xy);
        specular   *= diff_lit * light_flip;
    if (is_metal) {
        specular   *= scenecol.rgb;
        scenecol.rgb *= scenecol.rgb;
    }

    return scenecol * result + specular;
    
    #else

    return scenecol * result;

    #endif
}

int decodeMatID16(float x) {
    return int(x*65535.0);
}

vec4 textureBilateral(sampler2D tex, sampler2D depth, const int lod, float fdepth) {
    vec4 data   = vec4(0.0);
    float sum   = 0.0;
    ivec2 posD  = ivec2(coord*viewSize);
    ivec2 posT  = ivec2(coord*viewSize*rcp(float(lod)));
    vec3 zmult  = vec3((far*near)*2.0, far+near, far-near);
        fdepth  = depth_lin(fdepth);
    
    for (int i = -1; i<2; i++) {
        for (int j = -1; j<2; j++) {
            ivec2 tcDepth = posD + ivec2(i, j)*lod;
            float dsample = depth_lin(texelFetch(depth, tcDepth, 0).x);
            float w     = abs(dsample-fdepth)*zmult.x<1.0 ? 1.0 : 1e-5;
            ivec2 ct    = posT + ivec2(i, j);
            data       += texelFetch(tex, ct, 0)*w;
            sum        += w;
        }
    }
    data *= rcp(sum);

    return data;
}

#include "/lib/frag/labPBR.glsl"

void main() {
    vec4 scenecol   = stex(colortex0);
    float scenedepth = stex(depthtex1).x;

    if (landMask(scenedepth)) {
        vec4 tex1       = stex(colortex1);
        vec2 scenelmap  = decode2x8(tex1.y);
        vec3 scenenormal = decodeNormal(decode2x8(tex1.x));

        vec4 tex2       = stex(colortex2);
        int matID       = decodeMatID16(tex2.x);

        #if DEBUG_VIEW==1
        scenecol.rgb    = vec3(1.0);
        #endif

        vec3 viewpos    = screen_viewspace(vec3(coord, scenedepth));

        #if color_preset == 0
        float ao        = pow2(scenecol.a)*0.9 + 0.1;
        #else
        float ao        = pow3(scenecol.a)*0.95 + 0.05;
        #endif

        #ifdef ambientOcclusion_enabled
            vec4 tex3   = textureBilateral(colortex3, depthtex1, 2, scenedepth);
                ao     *= tex3.r;
        #endif

        vec4 spectex    = vec4(decode2x8(tex1.z), decode2x8(tex1.w));
        vec4 mat_data   = vec4(1.0, 0.02, 0.0, 0.0);
        float emission  = 0.0;
        bool is_metal   = false;

        #ifdef labpbr_enabled
        decode_lab(spectex, mat_data, emission, is_metal);
        #endif

        scenecol.rgb    = get_light(scenecol.rgb, scenenormal, viewpos, scenelmap, ao, matID, mat_data, is_metal);

        #if DEBUG_VIEW==2
        scenecol.rgb    = ao * (sunAngle<0.5 ? light_color[0] : light_color[3]);
        #endif
    }

    /*DRAWBUFFERS:03*/
    gl_FragData[0]  = makeDrawbuffer(scenecol);
    gl_FragData[1]  = vec4(0.0);
}