/*
Copyright (C) 2019 RRe36

All Rights Reserved unless otherwise explicitly stated.


By downloading this you have agreed to the license and terms of use.
These can be found inside the included license-file or here: https://rre36.github.io/license/

Violating these terms may be penalized with actions according to the Digital Millennium Copyright Act (DMCA), the Information Society Directive and/or similar laws depending on your country.
*/


#include "/lib/common.glsl"
#include "/lib/frag/dither.glsl"

in vec2 coord;

uniform sampler2D colortex0;
uniform sampler2D depthtex1;
uniform sampler2D depthtex2;

uniform float frameTime;
uniform float viewWidth, viewHeight;

uniform vec3 cameraPosition, previousCameraPosition;

uniform mat4 gbufferModelViewInverse, gbufferProjectionInverse;
uniform mat4 gbufferModelView, gbufferProjection;
uniform mat4 gbufferPreviousModelView, gbufferPreviousProjection;

vec3 get_motionblur(float depth, bool hand) {
    const float blur_size   = 0.16*motionblur_size;

    float dither    = bayer16(gl_FragCoord.xy);
    vec2 viewport   = 2.0/vec2(viewWidth, viewHeight);

    vec4 cpos       = vec4(coord.x, coord.y, depth, 1.0)*2.0-1.0;

    vec4 fpos       = cpos;
        fpos        = gbufferProjectionInverse*fpos;
        fpos        = gbufferModelViewInverse*fpos;
        fpos       /= fpos.w;
        if (!hand) fpos.xyz   += cameraPosition;

    vec4 ppos       = fpos;
        if (!hand) ppos.xyz   -= previousCameraPosition;
        ppos        = gbufferPreviousModelView*ppos;
        ppos        = gbufferPreviousProjection*ppos;
        ppos       /= ppos.w;

    float scale     = blur_size;
        scale      *= min(rcp(float(frameTime)*30.0), 2.0);

    vec2 vel        = (cpos-ppos).xy;
        if (hand) vel *= 0.15;  //the hand is a hack
        vel         = clamp(vel, -2.8, 2.8);
        vel        *= scale*rcp(float(motionblur_samples));
        vel         = vel - vel*0.5;

    vec2 motionc    = coord;
        motionc    += vel*dither;
    vec3 color      = vec3(0.0);

    int weight      = 0;

    for (int i = 0; i<motionblur_samples; i++, motionc += vel) {
        if (motionc.x > 1.0 || motionc.x < 0.0 || motionc.y > 1.0 || motionc.y < 0.0) {
            color  += texture(colortex0, coord).rgb;
            weight++;
            break;
        } else {
            vec2 coord = clamp(motionc, viewport, 1.0-viewport);
            color  += texture(colortex0, coord).rgb;
            weight++;
        }
    }

    color  *= rcp(float(weight));

    return color;
}

void main() {
    vec4 scenecol   = stex(colortex0);

    #ifdef motionblur_enabled
    float scenedepth = stex(depthtex1).x;
    float depth2    = stex(depthtex2).x;

    bool hand       = depth2>scenedepth;

    scenecol.rgb    = get_motionblur(scenedepth, hand);
    #endif

    /*DRAWBUFFERS:0*/
    gl_FragData[0]  = makeDrawbuffer(scenecol);
}