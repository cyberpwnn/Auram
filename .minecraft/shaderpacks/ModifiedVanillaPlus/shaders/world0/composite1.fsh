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

flat in mat4x3 light_color;

uniform sampler2D colortex0;
uniform sampler2D colortex1;

uniform sampler2D depthtex0;

uniform sampler2D noisetex;

uniform int frameCounter;
uniform int isEyeInWater;

uniform float sunAngle;
uniform float rainStrength;

uniform vec3 shadowLightPosition;
uniform vec3 sunPosition;
uniform vec3 lightvec, lightvecView;
uniform vec3 sunvec, sunvecView;
uniform vec3 moonvec, moonvecView;

uniform vec4 daytime;

uniform mat4 gbufferModelView, gbufferModelViewInverse;
uniform mat4 gbufferProjection, gbufferProjectionInverse;

#include "/lib/frag/bluenoise.glsl"

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

float get_mie(float x, float g) {
    float temp  = 1.0 + pow2(g) - 2.0*g*x;
    return (1.0 - pow2(g)) / ((4.0*pi) * temp*(temp*0.5+0.5));
}

#include "/lib/frag/ssgr.glsl"

void main() {
    vec4 scenecol   = stex(colortex0);  //that macro certainly makes it neater

    float scenedepth = stex(depthtex0).x;

    vec3 viewpos    = screen_viewspace(vec3(coord, scenedepth));

    vec3 spos       = view_scenespace(viewpos);

    vec3 lightcol   = sunAngle < 0.5 ? light_color[0] : light_color[3];

    if (isEyeInWater == 1) lightcol *= vec3(0.1, 0.4, 0.9);

    scenecol.rgb   += compute_ssgr(colortex1, normalize(spos), normalize(viewpos), shadowLightPosition) * lightcol * (1.0 - rainStrength * 0.9);

    /*DRAWBUFFERS:0*/
    gl_FragData[0]  = makeDrawbuffer(scenecol);
}