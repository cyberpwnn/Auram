/*
Copyright (C) 2019 RRe36

All Rights Reserved unless otherwise explicitly stated.


By downloading this you have agreed to the license and terms of use.
These can be found inside the included license-file or here: https://rre36.github.io/license/

Violating these terms may be penalized with actions according to the Digital Millennium Copyright Act (DMCA), the Information Society Directive and/or similar laws depending on your country.
*/

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

flat out mat3x3 light_color;

void make_colors() {
    light_color[0]  = vec3(0.5, 0.3, 1.0);
    light_color[0] *= 0.1;

    light_color[1]  = vec3(0.4, 0.2, 1.0);
    light_color[1] *= 0.3;

    light_color[2]  = blocklight_col*blocklight_luma;
}