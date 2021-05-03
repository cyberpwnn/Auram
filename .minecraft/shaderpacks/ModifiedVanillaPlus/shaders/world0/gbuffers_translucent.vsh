/*
Copyright (C) 2019 RRe36

All Rights Reserved unless otherwise explicitly stated.


By downloading this you have agreed to the license and terms of use.
These can be found inside the included license-file or here: https://rre36.github.io/license/

Violating these terms may be penalized with actions according to the Digital Millennium Copyright Act (DMCA), the Information Society Directive and/or similar laws depending on your country.
*/

#include "/lib/common.glsl"

const int shadowMapResolution   = 2048;     //[512 1024 1536 2048 2560 3072 3584 4096 6144 8192 16384]

out mat2x2 coord;

out float warp;

out vec3 pos_shadow;
out vec3 world_pos;

out vec4 tint;

flat out int mat_id;

flat out vec3 normal;

#ifdef g_terrain
    #ifdef custom_water_normal
        out float view_dist;
        flat out mat3x3 tbn;
    #endif
#endif

uniform sampler2D noisetex;

uniform float frameTimeCounter;
uniform float rainStrength;

uniform vec2 taaOffset;

uniform vec3 lightvec, lightvecView;
uniform vec3 cameraPosition;

uniform mat4 gbufferModelView, gbufferModelViewInverse;
uniform mat4 gbufferProjection, gbufferProjectionInverse;
uniform mat4 shadowModelView, shadowModelViewInverse;
uniform mat4 shadowProjection, shadowProjectionInverse;

attribute vec4 at_tangent;
attribute vec4 mc_Entity;

const float bias    = 0.08*(2048.0/shadowMapResolution);

#include "/lib/light/warp.glsl"

vec3 get_shadowcoord(vec3 viewpos, const float bias, out float warp) {  //shadow 2d
    vec3 pos    = viewpos;
        pos    += vec3(bias)*lightvecView;
        pos     = viewMAD(gbufferModelViewInverse, pos);
        pos     = viewMAD(shadowModelView, pos);
        pos     = projMAD(shadowProjection, pos);
        pos.z  *= 0.2;

        warp    = 1.0;
        pos.xy  = warp_shadowmap(pos.xy, warp);

    return pos*0.5+0.5;
}

#include "/lib/atmos/colors.glsl"

#ifdef g_terrain
    float value_3d(vec3 pos) {
        vec3 p  = floor(pos); 
        vec3 b  = fract(pos);

        vec2 uv = (p.xy+vec2(-97.0)*p.z)+b.xy;
        vec2 rg = texture(noisetex, (uv)/256.0).xy;

        return cube_smooth(mix(rg.x, rg.y, b.z));
    }

    vec2 rotate_coord(vec2 pos, const float angle) {
        return vec2(cos(angle)*pos.x + sin(angle)*pos.y, 
                    cos(angle)*pos.y - sin(angle)*pos.x);
    }

    float water_wave(vec3 pos, const float size) {
        vec3 p  = pos * size;

        float t = frameTimeCounter * pi * 0.5;
        vec3 w  = vec3(t*0.9, t*0.2, t*0.3);

        float wave  = value_3d(p + w);
            p.xz    = rotate_coord(p.xz, 0.4 * pi);
            wave   += value_3d(p * 2.0 + w) * 0.5;
            wave   -= 0.75;

        return wave*0.2;
    }
#endif

void main() {
    coord[0]    = (gl_TextureMatrix[0]*gl_MultiTexCoord0).xy;
    coord[1]    = (gl_TextureMatrix[1]*gl_MultiTexCoord1).xy;
    coord[1].x  = linStep(coord[1].x, rcp(24.0), 1.0);
    coord[1].y  = linStep(coord[1].y, rcp(16.0), 1.0);

    normal      = mat3(gbufferModelViewInverse)*normalize(gl_NormalMatrix*gl_Normal);

    #ifdef g_terrain
        #ifdef custom_water_normal
        vec3 tangent = mat3(gbufferModelViewInverse) * normalize(gl_NormalMatrix*at_tangent.xyz);
        vec3 binormal = mat3(gbufferModelViewInverse) * normalize(gl_NormalMatrix*cross(at_tangent.xyz, gl_Normal.xyz) * at_tangent.w);

        tbn     = mat3(tangent.x, binormal.x, normal.x,
                    tangent.y, binormal.y, normal.y,
                    tangent.z, binormal.z, normal.z);

        view_dist   = length(gl_ModelViewMatrix*gl_Vertex);
        #endif
    #endif

    tint        = gl_Color;

    vec4 pos    = gl_Vertex;
        pos     = viewMAD(gl_ModelViewMatrix, pos.xyz).xyzz;

        pos.xyz = viewMAD(gbufferModelViewInverse, pos.xyz);

    world_pos   = pos.xyz+cameraPosition;

    #ifdef g_terrain
    if (mc_Entity.x == 10001) pos.y += water_wave(world_pos, 0.55);
    #endif

        pos.xyz = viewMAD(gbufferModelView, pos.xyz);

    pos_shadow  = get_shadowcoord(pos.xyz, bias, warp);
        pos     = pos.xyzz * diag4(gl_ProjectionMatrix) + vec4(0.0, 0.0, gl_ProjectionMatrix[3].z, 0.0);

    #ifdef taa_enabled
        pos.xy += taaOffset*pos.w;
    #endif
        
    gl_Position = pos;

    make_colors();

        light_color[0]  = mix(light_color[0], vec3(v3avg(light_color[0]) * 0.4), rainStrength * 0.9);
        light_color[1]  = mix(light_color[1], vec3(v3avg(light_color[1]) * 1.3), rainStrength * 0.9);
        light_color[3]  = mix(light_color[3], vec3(v3avg(light_color[3]) * 1.3), rainStrength * 0.9);

    #ifdef g_terrain
        //mat ids
        if (mc_Entity.x == 10001) mat_id = 102;
        else mat_id = 101;
    #else
        mat_id = 101;
    #endif
}