/*
Copyright (C) 2019 RRe36

All Rights Reserved unless otherwise explicitly stated.


By downloading this you have agreed to the license and terms of use.
These can be found inside the included license-file or here: https://rre36.github.io/license/

Violating these terms may be penalized with actions according to the Digital Millennium Copyright Act (DMCA), the Information Society Directive and/or similar laws depending on your country.
*/

#define sunlight_luma 1.0 //[0.2 0.4 0.6 0.8 1.0 1.2 1.4 1.6 1.8 2.0]
#define moonlight_luma 1.0 //[0.2 0.4 0.6 0.8 1.0 1.2 1.4 1.6 1.8 2.0]
#define skylight_luma 1.0 //[0.2 0.4 0.6 0.8 1.0 1.2 1.4 1.6 1.8 2.0]
#define blocklight_luma 1.0 //[0.2 0.4 0.6 0.8 1.0 1.2 1.4 1.6 1.8 2.0]
#define blocklight_color_preset 1   //[0 1 2 3]

#if blocklight_color_preset == 0
    #define blocklight_col vec3(1.0, 0.28, 0.0)
#elif blocklight_color_preset == 1
    #define blocklight_col vec3(1.0, 0.36, 0.08)
#elif blocklight_color_preset == 2
    #define blocklight_col vec3(1.0, 0.55, 0.23)
#elif blocklight_color_preset == 3
    #define blocklight_col vec3(1.0, 0.78, 0.53)
#endif
/* add preset with a vanilla like falloff */

uniform vec3 sunvec;

uniform vec4 daytime;

flat out float light_flip;

flat out mat4x3 light_color;

uniform vec3 skyColor;
uniform vec3 fogColor;

#ifdef skypass
flat out mat2x3 sky_color;
#endif

#include "/lib/util/srgb.glsl"

#if color_preset <= 1
    #include "preset/vanilla.glsl"
#elif color_preset == 2
    #include "preset/soos8.glsl"
#elif color_preset == 3
    #include "preset/choc3.glsl"
#elif color_preset == 4
    #include "preset/choc3_pp.glsl"
#elif color_preset == 5
    #include "preset/choc3_rp.glsl"
#endif