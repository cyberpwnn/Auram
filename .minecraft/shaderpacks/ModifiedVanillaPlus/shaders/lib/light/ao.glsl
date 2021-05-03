/*
Copyright (C) 2019 RRe36

All Rights Reserved unless otherwise explicitly stated.


By downloading this you have agreed to the license and terms of use.
These can be found inside the included license-file or here: https://rre36.github.io/license/

Violating these terms may be penalized with actions according to the Digital Millennium Copyright Act (DMCA), the Information Society Directive and/or similar laws depending on your country.
*/


float bayer2  (vec2 c) { c = 0.5 * floor(c); return fract(1.5 * fract(c.y) + c.x); }
float bayer4  (vec2 c) { return 0.25 * bayer2 (0.5 * c) + bayer2(c); }
float bayer8  (vec2 c) { return 0.25 * bayer4 (0.5 * c) + bayer2(c); }
float bayer16 (vec2 c) { return 0.25 * bayer8 (0.5 * c) + bayer2(c); }

float calculate_dbao(sampler2D depthtex, float depth, vec2 coord) {
    const int steps     = 3;
    const int ao_area   = 4;
    float dither    = bayer16(gl_FragCoord.xy);
    bool hand       = depth<0.56;
    depth           = depth_lin(depth);
    //ivec2 res       = ivec2(viewWidth, viewHeight);
    //ivec2 coord     = ivec2(coord*res);

    const float pi_angle = 22.0/(7.0*180.0);
    float rot           = 180.0/ao_area*(dither+0.5);
    float radius        = 0.9/steps;

    float ao        = 0.0;
    float size      = 3.0 * rcp(float(steps));
        size       *= dither;
    float angle     = 0.0;
    float sdepth    = 0.0;
    float dist      = 0.0;
    vec2 scale      = size * vec2(rcp(aspectRatio), 1.0) * gbufferProjection[1][1] / (2.74747742 * max(far*depth,6.0));

    for (int i = 0; i < steps; i++) {
        //ivec2 offset = ivec2(offset_dist(i + dither, steps)*scale*res);

        for (int j = 0; j < ao_area; j++) {
            vec2 offset = vec2(cos(rot*pi_angle), sin(rot*pi_angle))*scale;
            sdepth      = depth_lin(texture(depthtex, coord + offset).x);
            float samp  = far*(depth-sdepth)*rcp(size);
            if (hand) samp *= 1024.0;
            angle       = saturate(0.5-samp);
            dist        = saturate(0.0625*samp);

            sdepth      = depth_lin(texture(depthtex, coord - offset, 0).x);
            samp        = far*(depth-sdepth)*rcp(size);
            if (hand) samp *= 1024.0;
            angle      += saturate(0.5-samp);
            dist       += saturate(0.0625*samp);

            ao         += saturate(angle+dist);
            rot        += 180.0 * rcp(float(ao_area));
        }
        rot        += 180.0 * rcp(float(ao_area));
        size       += radius;
        angle       = 0.0;
        dist        = 0.0;
    }
    ao *= rcp(float(steps+ao_area));
    ao  = (ao*sqrt(ao))*0.5;
    ao  = sqrt(ao);

    return saturate(ao);
}