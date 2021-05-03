/*
Copyright (C) 2019 RRe36

All Rights Reserved unless otherwise explicitly stated.


By downloading this you have agreed to the license and terms of use.
These can be found inside the included license-file or here: https://rre36.github.io/license/

Violating these terms may be penalized with actions according to the Digital Millennium Copyright Act (DMCA), the Information Society Directive and/or similar laws depending on your country.
*/


vec4 textureBilinear(sampler2D tex, vec2 coord, const int res) {
    ivec2 texSize = textureSize(tex, 0)*res;
    vec2 texelSize = rcp(vec2(texSize));
    vec4 p0q0 = texture(tex, coord);
    vec4 p1q0 = texture(tex, coord + vec2(texelSize.x, 0));

    vec4 p0q1 = texture(tex, coord + vec2(0, texelSize.y));
    vec4 p1q1 = texture(tex, coord + vec2(texelSize.x , texelSize.y));

    float a = fract(coord.x * texSize.x);

    vec4 pInterp_q0 = mix(p0q0, p1q0, a);
    vec4 pInterp_q1 = mix(p0q1, p1q1, a);

    float b = fract(coord.y*texSize.y);
    return mix(pInterp_q0, pInterp_q1, b);
}

float cloud_mie_dumb(float cos_theta, float g) {
    float sqG   = pow2(g);
    float a     = (1.0-sqG) / (2.0 + sqG);
    float b     = (1.0 + pow2(cos_theta)) / (1.0 + sqG - 2.0*g*cos_theta);

    return max(1.5 * a*b + g*cos_theta, 0.0)*rcp(pi);
}
float cloud_mie(float x, float g) {
    float mie   = 1.0 + pow2(g) - 2.0*g*x;
        mie     = (1.0 - pow2(g)) / ((4.0*pi) * mie*(mie*0.5+0.5));
    return mie;
}

float cloud_phase(float cos_theta, float g) {
    float a     = cloud_mie_dumb(cos_theta, 0.89*g);
    float b     = cloud_mie(cos_theta, -0.25*g)*cloud_bsfade;

    return mix(a, b, 0.38) + 0.24;
}

float vcloud_tick   = frameTimeCounter;

const float vc_size         = 0.16 / 1024.0;
const float vc_highedge     = vcloud_alt + vcloud_depth;

float vcloud_density(vec3 pos) {
    float lfade     = sstep(pos.y, vcloud_alt, vcloud_alt + vcloud_depth * 0.2);
    float hfade     = 1.0 - sstep(pos.y, vc_highedge - vcloud_depth * 0.2, vc_highedge);

        pos.x      += vcloud_tick;
        pos        *= vc_size;

    float shape     = textureBilinear(depthtex2, pos.xz, vcloud_edge).a;
        shape      *= lfade;
        shape      *= hfade;
        shape      -= 0.01;

    return max(shape * 2.0, 0.0);
}


float vc_directOD(in vec3 pos, const int steps) {
    vec3 dir    = cloud_lvec;

    float stepsize = (vcloud_depth / steps);
        stepsize  *= (1.0-linStep(pos.y, vcloud_alt, vc_highedge))*0.9+0.1;

    float od = 0.0;
    for(int i = 0; i < steps; ++i, pos += dir * stepsize) {
        if(pos.y > vc_highedge || pos.y < vcloud_alt) continue;

        float density = vcloud_density(pos);
        od += density*stepsize;
    } 

    return od;
}
float vc_skyOD(in vec3 pos, const int steps) {
    vec3 dir    = vec3(0.0, 1.0, 0.0);

    float stepsize = (vcloud_depth / steps);
        stepsize  *= (1.0-linStep(pos.y, vcloud_alt, vc_highedge))*0.9+0.1;

    float od = 0.0;
    for(int i = 0; i < steps; ++i, pos += dir * stepsize) {
        if(pos.y > vc_highedge || pos.y < vcloud_alt) break;

        float density   = vcloud_density(pos);
        od += density*stepsize;
    } 

    return od;
}