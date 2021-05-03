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

in mat2x2 coord;

in vec4 tint;

flat in vec3 normal;

#ifdef g_textured
    uniform sampler2D gcolor;

    #ifdef labpbr_enabled
        uniform sampler2D specular;
        uniform sampler2D normals;

        flat in mat3x3 tbn;
    #endif
#endif

float encodeMatID16(int x) {
    float id    = float(x)/65535.0;
    return id;
}

#ifdef g_terrain
flat in int foliage;
#endif

#ifdef g_entity
uniform vec4 entityColor;
#endif

#if (defined labpbr_enabled && defined g_textured)
    vec3 decode_lab_nrm(vec3 ntex, inout float ao) {
        vec3 nrm    = ntex * 2.0 - (254.0 * rcp(255.0));

        #if normalmap_format==0
            if(any(greaterThan(ntex, vec3(0.003)))) ao *= ntex.z;
            nrm.z  = sqrt(saturate(1.0 - dot(nrm.xy, nrm.xy)));
        #elif normalmap_format==1
            if(any(greaterThan(ntex, vec3(0.003)))) ao *= pow2(length(nrm));
            nrm    = normalize(nrm);
        #endif

        return normalize(nrm * tbn);
    }
#endif

void main() {
    #ifdef g_textured
        vec4 scenecol   = texture(gcolor, coord[0]);
        if (scenecol.a<0.1) discard;
        vec3 scenenormal = normal;

            scenecol.rgb *= tint.rgb;
        
        #ifdef g_terrain
            scenecol.a  = tint.a;
        #else
            scenecol.a  = 1.0;
        #endif

        #ifdef g_entity
            scenecol.rgb = mix(scenecol.rgb, entityColor.rgb, entityColor.a);
        #endif

        #ifdef labpbr_enabled
            vec4 spectex    = texture(specular, coord[0]);
            vec2 return1_zw = vec2(encode2x8(spectex.xy), encode2x8(spectex.zw));

            vec4 ntex       = texture(normals, coord[0]);

            scenenormal     = decode_lab_nrm(ntex.rgb, scenecol.a);
        #else
            const vec2 return1_zw = vec2(1.0);
        #endif
    #else
        vec4 scenecol   = tint;
        if (scenecol.a<0.01) discard;
        vec3 scenenormal = normal;

            scenecol.a  = 1.0;

        const vec2 return1_zw = vec2(1.0);
    #endif

        scenecol.rgb    = to_linear(scenecol.rgb);

    #ifdef g_terrain
        int matID   = 1;
        if (foliage==1) matID = 2;
    #else
        #ifdef g_nodiff
        const int matID = 2;
        #else
        const int matID = 1;
        #endif
    #endif

    /*DRAWBUFFERS:012*/
    gl_FragData[0]  = makeDrawbuffer(scenecol.rgb, saturate(scenecol.a));
    gl_FragData[1]  = vec4(encode2x8(encodeNormal(scenenormal)), encode2x8(coord[1]), return1_zw);
    gl_FragData[2]  = vec4(encodeMatID16(matID), 0.0, 0.0, 0.0);
}