#version 400 compatibility

/*
Copyright (C) 2019 RRe36

All Rights Reserved unless otherwise explicitly stated.


By downloading this you have agreed to the license and terms of use.
These can be found inside the included license-file or here: https://rre36.github.io/license/

Violating these terms may be penalized with actions according to the Digital Millennium Copyright Act (DMCA), the Information Society Directive and/or similar laws depending on your country.
*/

#include "/lib/common.glsl"

in vec2 coord;

flat in mat2x3 light_color;
flat in vec3 sky_color;

uniform sampler2D colortex0;
uniform sampler2D colortex2;
uniform sampler2D colortex3;

uniform sampler2D depthtex0;
uniform sampler2D depthtex1;

uniform float far;

uniform vec3 cameraPosition;

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
    float dist      = max(0.0, d);
    float density   = 1.0-exp(-dist * 2e-3 * fog_density);

    return mix(scenecolor, color, density);
}

void main() {
    vec4 scenecol   = stex(colortex0);  //that macro certainly makes it neater
    //vec4 tex1       = stex(colortex1);
    vec4 tex2       = stex(colortex2);
    vec4 tex3       = stex(colortex3);

    vec3 translucent_albedo = pow2(decode3x8(tex2.g));

    int mat_id      = decodeMatID16(tex2.x);

    float scenedepth0 = stex(depthtex0).x;
    vec3 viewpos0     = screen_viewspace(vec3(coord, scenedepth0));
    vec3 spos0        = view_scenespace(viewpos0);

    float scenedepth1 = stex(depthtex1).x;
    vec3 viewpos1     = screen_viewspace(vec3(coord, scenedepth1));
    vec3 spos1        = view_scenespace(viewpos1);

    bool translucent = (scenedepth0<scenedepth1);

    bool water      = mat_id == 102;

    vec3 fogcol     = sky_color + light_color[0];

    #ifdef fog_enabled
    if (translucent){
        scenecol.rgb = simple_fog(scenecol.rgb, length(spos1)-length(spos0), fogcol);
    }
    #endif

    scenecol.rgb    = blend_translucencies(scenecol.rgb, tex3, translucent_albedo);

    #ifdef fog_enabled
    if (landMask(scenedepth0)) scenecol.rgb = simple_fog(scenecol.rgb, length(spos0), fogcol);
    #endif

    /*DRAWBUFFERS:0*/
    gl_FragData[0]  = makeDrawbuffer(scenecol);
}