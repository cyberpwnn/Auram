/*
Copyright (C) 2019 RRe36

All Rights Reserved unless otherwise explicitly stated.


By downloading this you have agreed to the license and terms of use.
These can be found inside the included license-file or here: https://rre36.github.io/license/

Violating these terms may be penalized with actions according to the Digital Millennium Copyright Act (DMCA), the Information Society Directive and/or similar laws depending on your country.
*/

float bayer2(vec2 c) { 
    c = 0.5 * floor(c);
    return fract(1.5 * fract(c.y) + c.x);
}
float bayer4(vec2 c) {
    return 0.25 * bayer2 (0.5 * c) + bayer2(c);
}
float bayer8(vec2 c) {
    return 0.25 * bayer4 (0.5 * c) + bayer2(c);
}
float bayer16(vec2 c) {
    return 0.25 * bayer8 (0.5 * c) + bayer2(c);
}
float bayer32(vec2 c) {
    return 0.25 * bayer16(0.5 * c) + bayer2(c);
}