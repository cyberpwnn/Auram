/*
Copyright (C) 2019 RRe36

All Rights Reserved unless otherwise explicitly stated.


By downloading this you have agreed to the license and terms of use.
These can be found inside the included license-file or here: https://rre36.github.io/license/

Violating these terms may be penalized with actions according to the Digital Millennium Copyright Act (DMCA), the Information Society Directive and/or similar laws depending on your country.
*/


void make_colors() {
    vec3 sunlightSunrise;
        sunlightSunrise.r   = 1.0;
        sunlightSunrise.g   = 0.63;
        sunlightSunrise.b   = 0.16;
        sunlightSunrise    *= 0.8;

    vec3 sunlightNoon;
        sunlightNoon.r      = 1.0;
        sunlightNoon.g      = 0.90;
        sunlightNoon.b      = 0.61;
        sunlightNoon       *= 1.2;

    vec3 sunlightSunset;
        sunlightSunset.r    = 1.0;
        sunlightSunset.g    = 0.63;
        sunlightSunset.b    = 0.16;
        sunlightSunset     *= 0.8;

    vec3 sunlightNight;
        sunlightNight.r     = 1.00;
        sunlightNight.g     = 0.2;
        sunlightNight.b     = 0.0;
        sunlightNight      *= 0.4;

    light_color[0]  = sunlightSunrise*daytime.x + sunlightNoon*daytime.y + sunlightSunset*daytime.z + sunlightNight*daytime.w;
    #ifndef skypass
    light_color[0] *= sunlight_luma;
    #endif

    vec3 linear_sky = to_linear(skyColor);

    vec3 skylightSunrise;
        skylightSunrise.r   = 1.0;
        skylightSunrise.g   = 1.0;
        skylightSunrise.b   = 1.0;
        skylightSunrise    *= 0.4;

    vec3 skylightNoon;
        skylightNoon.r      = 0.37;
        skylightNoon.g      = 0.72;
        skylightNoon.b      = 1.00;
        skylightNoon       *= 0.7;

    vec3 skylightSunset;
        skylightSunset.r    = 1.0;
        skylightSunset.g    = 1.0;
        skylightSunset.b    = 1.0;
        skylightSunset     *= 0.4;

    vec3 skylightNight;
        skylightNight.r     = 0.3;
        skylightNight.g     = 0.6;
        skylightNight.b     = 1.00;
        skylightNight      *= 0.012;

    light_color[1]  = skylightSunrise*daytime.x + skylightNoon*daytime.y + skylightSunset*daytime.z + skylightNight*daytime.w;
    //light_color[1]  = mix(linear_sky, light_color[0], 0.3);
    //light_color[1] *= 0.8*daytime.x + 1.0*daytime.y + 0.8*daytime.z + 1.0*daytime.w;
    //light_color[1]  = mix(light_color[1], skylightNight, daytime.w);

    light_color[1] *= skylight_luma*0.4;

    light_color[0] *= 2.5;

    light_color[2]  = vec3(1.0, 0.36, 0.08)*blocklight_luma;

    light_color[3]  = vec3(0.35, 0.55, 1.0)*0.05*moonlight_luma;

    float lf    = dot(sunvec, vec3(0.0, 1.0, 0.0))*0.5+0.5;
        lf      = linStep(lf, 0.48, 0.499)*(1.0-linStep(lf, 0.501, 0.52));

    light_flip  = saturate(1.0-lf);

    #ifdef skypass
        /*
        vec3 skySunrise;
            skySunrise.r = 0.24;
            skySunrise.g = 0.52;
            skySunrise.b = 1.00;
            skySunrise  *= 0.5;

        vec3 skyNoon;
            skyNoon.r   = 0.222;
            skyNoon.g   = 0.486;
            skyNoon.b   = 1.00;
            skyNoon    *= 0.81;

        vec3 skySunset;
            skySunset.r = 0.24;
            skySunset.g = 0.52;
            skySunset.b = 1.00;
            skySunset  *= 0.5;

        vec3 skyNight;
            skyNight.r  = 0.22;
            skyNight.g  = 0.49;
            skyNight.b  = 1.00;
            skyNight   *= 0.02;

        sky_color[0]    = skySunrise*daytime.x + skyNoon*daytime.y + skySunset*daytime.z + skyNight*daytime.w;*/
        sky_color[0]    = color_saturation(linear_sky, 1.2) * 1.0 * vec3(1.0, 1.5, 1.1);

        vec3 linear_fog     = to_linear(fogColor);

        vec3 horSunrise;
            horSunrise.r = 1.00;
            horSunrise.g = 0.45;
            horSunrise.b = 0.06;
            horSunrise  *= 3.5;

        vec3 horNoon    = linear_fog * normalize(light_color[0]);
            //horNoon.r   = 0.61;
            //horNoon.g   = 0.80;
            //horNoon.b   = 1.00;
            horNoon    *= 6.5;

        vec3 horSunset;
            horSunset.r = 1.00;
            horSunset.g = 0.45;
            horSunset.b = 0.06;
            horSunset  *= 3.5;

        vec3 horNight   = linear_fog * normalize(light_color[3]);
            //horNight.r  = 0.61;
            //horNight.g  = 0.80;
            //horNight.b  = 1.00;
            horNight   *= 0.6;

        sky_color[1]    = horSunrise*pow2(daytime.x) + horNoon*(1.0-pow2(1.0-daytime.y)) + horSunset*pow2(daytime.z) + horNight*(1.0-pow2(1.0-daytime.w));
    #endif
}