/*
Copyright (C) 2019 RRe36

All Rights Reserved unless otherwise explicitly stated.


By downloading this you have agreed to the license and terms of use.
These can be found inside the included license-file or here: https://rre36.github.io/license/

Violating these terms may be penalized with actions according to the Digital Millennium Copyright Act (DMCA), the Information Society Directive and/or similar laws depending on your country.
*/

float rcp(float x) {
    return ircp(x);
}
vec2 rcp(vec2 x) {
    return ircp(x);
}
vec3 rcp(vec3 x) {
    return ircp(x);
}

float pow2(float x) {
    return x*x;
}
float pow3(float x) {
    return pow2(x)*x;
}
float pow4(float x) {
    return pow2(x)*pow2(x);
}
float pow5(float x) {
    return pow4(x)*x;
}
float pow6(float x) {
    return pow5(x)*x;
}
float pow8(float x) {
    return pow4(x)*pow4(x);
}

float cube_smooth(in float x) {
    return icube_smooth(x);
}
float v3avg(vec3 x) {
    return (x.x+x.y+x.z)/3.0;
}

vec2 pow2(vec2 x) {
    return x*x;
}

vec3 pow2(vec3 x) {
    return x*x;
}

float saturate(in float x) {
    return isaturate(x);
}

vec2 saturate(in vec2 x) {
    return isaturate(x);
}

vec3 saturate(in vec3 x) {
    return isaturate(x);
}

float linStep(float x, float low, float high) {
    float t = saturate((x-low)/(high-low));
    return t;
}

vec3 linStep(vec3 x, float low, float high) {
    vec3 t = saturate((x-low)/(high-low));
    return t;
}

float getLuma(vec3 x) {
    return dot(x, lumacoeff_rec709);
}

vec3 color_saturation(vec3 x, const float y) {
    return mix(vec3(getLuma(x)), x, y);
}

vec4 makeDrawbuffer(in vec3 scenecol, in float alpha) {
    #ifdef MC_GL_RENDERER_GEFORCE
        vec3 temp   = clamp(scenecol, 1.0/65530.0, 65535.0);   //NaN fix on nvidia
    #else
        vec3 temp   = clamp(scenecol, 0.0, 65535.0);
    #endif

    return vec4(temp, alpha);
}
vec4 makeDrawbuffer(in vec3 scenecol) {
    #ifdef MC_GL_RENDERER_GEFORCE
        vec3 temp   = clamp(scenecol, 1.0/65530.0, 65535.0);   //NaN fix on nvidia
    #else
        vec3 temp   = clamp(scenecol, 0.0, 65535.0);
    #endif

    return vec4(temp, 1.0);
}
vec4 makeDrawbuffer(in vec4 scenecol) {
    #ifdef MC_GL_RENDERER_GEFORCE
        vec3 temp   = clamp(scenecol.rgb, 1.0/65530.0, 65535.0);
    #else
        vec3 temp   = clamp(scenecol.rgb, 0.0, 65535.0);
    #endif

    return vec4(temp, max(scenecol.a, 0.0));
}

//these are for non-scenecolor stuffs
vec4 clampDrawbuffer(in vec3 scenecol) {
    vec3 temp   = clamp(scenecol, 0.0, 65535.0);

    return vec4(temp, 1.0);
}
vec4 clampDrawbuffer(in vec4 scenecol) {
    vec3 temp   = clamp(scenecol.rgb, 0.0, 65535.0);

    return vec4(temp, max(scenecol.a, 0.0));
}