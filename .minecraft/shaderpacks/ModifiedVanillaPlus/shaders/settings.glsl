/*
Copyright (C) 2019 RRe36

All Rights Reserved unless otherwise explicitly stated.


By downloading this you have agreed to the license and terms of use.
These can be found inside the included license-file or here: https://rre36.github.io/license/

Violating these terms may be penalized with actions according to the Digital Millennium Copyright Act (DMCA), the Information Society Directive and/or similar laws depending on your country.
*/

#define color_preset 0  //[0 1 2 3 4 5]

/* ------ atmosphere settings ------ */
//#define ssgr_enabled
#define ssgr_samples 8  //[2 4 6 8 10 12 14 16]
#define ssgr_length 1.0 //[0.2 0.4 0.6 0.8 1.0 1.2 1.4 1.6 1.8 2.0]

#define fog_enabled
#define fog_start 0.3   //[0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9]
#define fog_density 1.0 //[0.2 0.4 0.6 0.8 1.0 1.2 1.4 1.6 1.8 2.0]

    /* ------ cloud settings ------ */
    #define vcloud_enabled
    #define vcloud_light
    #define vcloud_samples 12 //[6 8 10 12 14 16 18 20]
    //#define vcloud_adaptive_samples
    #define vcloud_alt 140.0    //[80.0 100.0 120.0 140.0 160.0 180.0 200.0]
    #define vcloud_depth 12.0   //[8.0 10.0 12.0 14.0 16.0 18.0 20.0]
    #define vcloud_clip 800.0   //[400.0 600.0 800.0 1000.0 1200.0 1400.0 1600.0 1800.0 2000.0]
    #define vcloud_edge 12      //[1 2 4 6 8 10 12 14 16 18 20 24 28 32]



/* ------- lighting settings ------ */
//#define shadowfilter_hq
//#define ambientOcclusion_enabled
#define lightleakWorkaroundToggle

#define minlight_luma 0.3   //[0.1 0.2 0.3 0.4 0.5 0.75 1.0 1.25 1.5 1.75 2.0 2.5 3.0 3.5 4.0 5.0 6.0 7.0 8.0 9.0 10.0]



/* ------ world settings ------ */
//#define labpbr_enabled
#define normalmap_format 0      //[0 1]0-lab 1.2, 1-lab1.1

    /* ------ reflections settings ------ */
    //#define reflections_enabled

    #ifdef reflections_enabled
        #define ssr_enabled

        #ifdef vcloud_enabled
            #define cloud_reflections_enabled
        #endif
    #endif


    /* ------ water settings ------ */
    //#define custom_water_color
    #define water_normal_octaves 3  //[2 3 4 5 6 7 8]
    #ifdef reflections_enabled
        #define custom_water_normal
    #endif

#define wind_effects_enabled
#define wind_intensity 1.0  //[0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0 1.1 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9 2.0]



/* ------ post processing settings ------ */
#define taa_enabled
#define imageSharpenEnabled

//#define manualExposureEnabled
#define manualExposureValue 5.0     //[0.1 0.3 0.5 1.0 1.5 2.0 3.0 4.0 5.0 6.0 7.0 8.0 9.0 10.0 12.0 14.0 16.0 18.0 20.0 25.0 30.0 40.0 50.0]

    /* ------ camera settings ------ */
    #define bloomEnabled
    #define bloom_intensity 1.0     //[0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9 2.0]

    //#define motionblur_enabled
    #define motionblur_samples 8    //[4 6 8 10 12 14 16]
    #define motionblur_size 1.0     //[0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9 2.0]

    //#define lens_flare
    #define lens_intensity 1.0     //[0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9 2.0]


/* ------ internals ------ */
#define cloud_atmos_density 2.9e-3
#define DEBUG_VIEW 0    //[0 1 2 3 4] 0-off, 1-whiteworld, 2-ao
#define SKYREF_LOD 3.0