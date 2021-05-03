/*
Copyright (C) 2019 RRe36

All Rights Reserved unless otherwise explicitly stated.


By downloading this you have agreed to the license and terms of use.
These can be found inside the included license-file or here: https://rre36.github.io/license/

Violating these terms may be penalized with actions according to the Digital Millennium Copyright Act (DMCA), the Information Society Directive and/or similar laws depending on your country.
*/

void decode_lab(in vec4 unpacked_tex, out vec4 mat_data, out float emission, out bool is_metal) {
    mat_data.x  = pow2(1.0 - unpacked_tex.x);   //roughness
    mat_data.y  = (unpacked_tex.y);         //f0

    unpacked_tex.z = round(unpacked_tex.z * 255.0);
    
    mat_data.z  = unpacked_tex.z < 64.5 ? linStep(unpacked_tex.z, 0.0, 64.0) : 0.0;    //porosity
    mat_data.w  = linStep(unpacked_tex.z, 64.0, 255.0);        //subsurface

    unpacked_tex.w = unpacked_tex.w * 255.0;

    emission    = unpacked_tex.w < 254.5 ? linStep(unpacked_tex.w, 0.0, 254.0) : 0.0;

    is_metal    = (unpacked_tex.y * 255.0) > 229.5;
}

vec3 compute_porosity(vec3 scenecol, vec3 data) {   //x-rough y-por z-wet
    vec3 wetcol    = color_saturation(pow2(scenecol), 0.85) * 0.95;

    return mix(scenecol, wetcol, data.y * (1.0 - pow2(data.x)) * data.z);
}