/*
====================================================================================================

    Copyright (C) 2020 RRe36

    All Rights Reserved unless otherwise explicitly stated.


    By downloading this you have agreed to the license and terms of use.
    These can be found inside the included license-file
    or here: https://rre36.github.io/license/

    Violating these terms may be penalized with actions according to the Digital Millennium
    Copyright Act (DMCA), the Information Society Directive and/or similar laws
    depending on your country.

====================================================================================================
*/

#include "/lib/common.glsl"
#include "/lib/util/srgb.glsl"

#define INFO 0  //[0]

/* ------ color grading related settings ------ */
//#define do_colorgrading

#define vibrance_int 1.00       //[0.00 0.05 0.10 0.15 0.20 0.25 0.30 0.35 0.40 0.45 0.50 0.55 0.60 0.65 0.70 0.75 0.80 0.85 0.90 0.95 1.00 1.05 1.10 1.15 1.20 1.25 1.30 1.35 1.40 1.45 1.50 1.55 1.60 1.65 1.70 1.75 1.80 1.85 1.90 1.95 2.00]
#define saturation_int 1.00     //[0.00 0.05 0.10 0.15 0.20 0.25 0.30 0.35 0.40 0.45 0.50 0.55 0.60 0.65 0.70 0.75 0.80 0.85 0.90 0.95 1.00 1.05 1.10 1.15 1.20 1.25 1.30 1.35 1.40 1.45 1.50 1.55 1.60 1.65 1.70 1.75 1.80 1.85 1.90 1.95 2.00]
#define gamma_curve 1.00        //[0.00 0.05 0.10 0.15 0.20 0.25 0.30 0.35 0.40 0.45 0.50 0.55 0.60 0.65 0.70 0.75 0.80 0.85 0.90 0.95 1.00 1.05 1.10 1.15 1.20 1.25 1.30 1.35 1.40 1.45 1.50 1.55 1.60 1.65 1.70 1.75 1.80 1.85 1.90 1.95 2.00]
#define brightness_int 0.00     //[-0.50 -0.45 -0.40 -0.35 -0.30 -0.25 -0.20 -0.15 -0.10 -0.05 0.00 0.05 0.10 0.15 0.20 0.25 0.30 0.35 0.40 0.45 0.5]
#define constrast_int 1.00      //[0.00 0.05 0.10 0.15 0.20 0.25 0.30 0.35 0.40 0.45 0.50 0.55 0.60 0.65 0.70 0.75 0.80 0.85 0.90 0.95 1.00 1.05 1.10 1.15 1.20 1.25 1.30 1.35 1.40 1.45 1.50 1.55 1.60 1.65 1.70 1.75 1.80 1.85 1.90 1.95 2.00]

#define colorlum_r 1.00         //[0.00 0.05 0.10 0.15 0.20 0.25 0.30 0.35 0.40 0.45 0.50 0.55 0.60 0.65 0.70 0.75 0.80 0.85 0.90 0.95 1.00 1.05 1.10 1.15 1.20 1.25 1.30 1.35 1.40 1.45 1.50 1.55 1.60 1.65 1.70 1.75 1.80 1.85 1.90 1.95 2.00]
#define colorlum_g 1.00         //[0.00 0.05 0.10 0.15 0.20 0.25 0.30 0.35 0.40 0.45 0.50 0.55 0.60 0.65 0.70 0.75 0.80 0.85 0.90 0.95 1.00 1.05 1.10 1.15 1.20 1.25 1.30 1.35 1.40 1.45 1.50 1.55 1.60 1.65 1.70 1.75 1.80 1.85 1.90 1.95 2.00]
#define colorlum_b 1.00         //[0.00 0.05 0.10 0.15 0.20 0.25 0.30 0.35 0.40 0.45 0.50 0.55 0.60 0.65 0.70 0.75 0.80 0.85 0.90 0.95 1.00 1.05 1.10 1.15 1.20 1.25 1.30 1.35 1.40 1.45 1.50 1.55 1.60 1.65 1.70 1.75 1.80 1.85 1.90 1.95 2.00]

#define vignette_enabled
#define vignette_start 0.15     //[0.00 0.05 0.10 0.15 0.20 0.25 0.30 0.35 0.40 0.45 0.50 0.55 0.60 0.65 0.70 0.75 0.80 0.85 0.90 0.95 1.00]
#define vignette_end 0.85       //[0.00 0.05 0.10 0.15 0.20 0.25 0.30 0.35 0.40 0.45 0.50 0.55 0.60 0.65 0.70 0.75 0.80 0.85 0.90 0.95 1.00]
#define vignette_intensity 0.75 //[0.00 0.05 0.10 0.15 0.20 0.25 0.30 0.35 0.40 0.45 0.50 0.55 0.60 0.65 0.70 0.75 0.80 0.85 0.90 0.95 1.00]
#define vignette_exponent 1.50  //[0.50 0.75 1.0 1.25 1.50 1.75 2.00 2.25 2.50 2.75 3.00 3.25 3.50 3.75 4.00 4.25 4.50 4.75 5.00]

in vec2 coord;

uniform sampler2D colortex0;
uniform sampler2D colortex1;
uniform sampler2D colortex3;
uniform sampler2D colortex4;

uniform int frameCounter;

uniform float aspectRatio;
uniform float frameTimeCounter;
uniform float nightVision;
uniform float rainStrength;

uniform vec2 pixelSize;
uniform vec2 viewSize;

uniform vec3 sunPosition;
uniform vec3 sunvec;

uniform mat4 gbufferProjection;

/* ------ tonemapping operators ------ */

vec3 tonemapReinhard(vec3 hdr) {
    float luma      = getLuma(hdr);

    #if color_preset == 0
        float coeff     = 0.83 - nightVision*0.6;
    #elif color_preset == 1
        float coeff     = 0.5 - nightVision*0.3;
        hdr    *= 1.3;
    #elif color_preset == 2
        float coeff     = 0.65 - nightVision*0.3;
    #elif color_preset >= 3
        float coeff     = 0.75 - nightVision*0.4;
        hdr    *= 1.1;
    #endif

    vec3 col        = hdr/(hdr + coeff);
        col         = mix(hdr/(luma + coeff), col, col);

    return toSRGB(col);
}

/* ------ color grading utilities ------ */

vec3 rgbLuma(vec3 x) {

    #if color_preset == 1
    x.b *= 0.8;
    #elif color_preset == 2
    x.g *= 1.03;
    #endif

    return x * vec3(colorlum_r, colorlum_g, colorlum_b);
}

vec3 gammaCurve(vec3 x) {
    #if color_preset == 1
    const float gint    = gamma_curve + 0.1;
    #else
    const float gint    = gamma_curve;
    #endif

    return pow(x, vec3(gint));
}

vec3 vibranceSaturation(vec3 color) {
    #if color_preset == 0
    const float vint    = vibrance_int;
    const float sint    = saturation_int;
    #elif color_preset == 1
    const float vint    = vibrance_int - 0.05;
    const float sint    = saturation_int + 0.1;
    #elif color_preset == 2
    const float vint    = vibrance_int;
    const float sint    = saturation_int + 0.02;
    #elif color_preset == 3
    const float vint    = vibrance_int - 0.1;
    const float sint    = saturation_int + 0.1;
    #elif color_preset == 4
    const float vint    = vibrance_int;
    const float sint    = saturation_int + 0.05;
    #elif color_preset == 5
    const float vint    = vibrance_int;
    const float sint    = saturation_int + 0.2;
    #endif

    float lum   = dot(color, lumacoeff_rec709);
    float mn    = min(min(color.r, color.g), color.b);
    float mx    = max(max(color.r, color.g), color.b);
    float sat   = (1.0 - saturate(mx-mn)) * saturate(1.0-mx) * lum * 5.0;
    vec3 light  = vec3((mn + mx) / 2.0);

    color   = mix(color, mix(light, color, vint), saturate(sat));

    color   = mix(color, light, saturate(1.0-light) * (1.0-vint) / 2.0 * abs(vint));

    color   = mix(vec3(lum), color, sint);

    return color;
}

vec3 brightnessContrast(vec3 color) {
    #if color_preset == 0
    const float bint    = brightness_int;
    const float cint    = constrast_int;
    #elif color_preset == 1
    const float bint    = brightness_int + 0.02;
    const float cint    = constrast_int;
    #elif color_preset == 2
    const float bint    = brightness_int + 0.02;
    const float cint    = constrast_int - 0.02;
    #elif color_preset == 3
    const float bint    = brightness_int;
    const float cint    = constrast_int;
    #elif color_preset == 4
    const float bint    = brightness_int;
    const float cint    = constrast_int + 0.06;
    #elif color_preset == 5
    const float bint    = brightness_int;
    const float cint    = constrast_int;
    #endif

    return (color - 0.5) * cint + 0.5 + bint;
}

vec3 vignette(vec3 color) {
    float fade      = length(coord*2.0-1.0);
        fade        = linStep(abs(fade) * 0.5, vignette_start, vignette_end);
        fade        = 1.0 - pow(fade, vignette_exponent) * vignette_intensity;

    return color * fade;
}

#ifndef dim
#include "/lib/frag/bslflare.glsl"

vec3 get_lensflare(){
	vec4 tpos = vec4(sunPosition,1.0)*gbufferProjection;
        tpos.xyz /= tpos.w;
        tpos.xy = tpos.xy/tpos.z;

	vec2 lightPos = tpos.xy * 0.5;
	float truepos = sunPosition.z/abs(sunPosition.z);
	vec3 visible = texture(colortex1, lightPos.xy + 0.5).rgb;
        visible *= sstep(sunvec.y, 0.0, 0.1);

        visible *= 1.0-linStep(length(tpos.xy), 0.85, 1.25);

    if(min(visible.x, min(visible.y, visible.z))>0.01 && truepos < 1.0) {
        return genLensFlare(lightPos, truepos, lens_intensity);
    } else {
        return vec3(0.0);
    }
}
#endif

void main() {
    vec3 sceneHDR   = stex(colortex0).rgb;

    #ifdef bloomEnabled
        vec2 cres       = max(viewSize, vec2(1920.0, 1080.0));

        float bloom_int = 0.012 + max(stex(colortex4).a, 1.0)*0.0015;

        #ifndef dim
            bloom_int  *= 1.0 + rainStrength * 4.0;
        #endif

        #if dim == -1
            bloom_int  *= 1.3;
        #elif dim == 1
            bloom_int  *= 1.5;
        #endif

        #if color_preset == 2
            bloom_int  *= 1.6;
        #elif color_preset >= 3
            bloom_int  *= 1.7;
        #endif

        sceneHDR   += texture(colortex3, coord/cres*vec2(1920.0, 1080.0)*0.5).rgb*bloom_int*bloom_intensity;
    #endif

        //sceneHDR   += stex(colortex3).rgb * 0.5;

    #ifndef dim
        #ifdef lens_flare
        sceneHDR   += get_lensflare();
        #endif
    #endif

    #ifdef manualExposureEnabled
        sceneHDR   *= rcp(manualExposureValue);
    #else
        sceneHDR   *= stex(colortex4).a;
    #endif

    //sceneHDR *= exp(-length(coord * 2.0 - 1.0) * 1.5);

    #if (defined do_colorgrading || color_preset != 0)
        sceneHDR    = rgbLuma(sceneHDR);
    #endif

    #ifdef vignette_enabled
        sceneHDR    = vignette(sceneHDR);
    #endif

    vec3 sceneLDR   = tonemapReinhard(sceneHDR);

    #if (defined do_colorgrading || color_preset != 0)
        sceneLDR    = brightnessContrast(sceneLDR);
        sceneLDR    = gammaCurve(sceneLDR);
        sceneLDR    = vibranceSaturation(saturate(sceneLDR));
    #endif

    /*DRAWBUFFERS:0*/
    gl_FragData[0]  = makeDrawbuffer(sceneLDR);
}