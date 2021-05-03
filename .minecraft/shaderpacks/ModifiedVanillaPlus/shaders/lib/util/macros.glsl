/*
Copyright (C) 2019 RRe36

All Rights Reserved unless otherwise explicitly stated.


By downloading this you have agreed to the license and terms of use.
These can be found inside the included license-file or here: https://rre36.github.io/license/

Violating these terms may be penalized with actions according to the Digital Millennium Copyright Act (DMCA), the Information Society Directive and/or similar laws depending on your country.
*/

#define viewMAD(m, v) (mat3(m) * (v) + (m)[3].xyz)
#define diag3(m) vec3((m)[0].x, (m)[1].y, m[2].z)
#define diag4(mat) vec4(diag3(mat), (mat)[2].w)
#define projMAD(m, v) (diag3(m) * (v) + (m)[3].xyz)

#define isaturate(x) clamp(x, 0.0, 1.0)
#define ircp(x) (1.0 / x)

#define sstep(x, low, high) smoothstep(low, high, x)
#define stex(x) texture(x, coord)
#define stexLod(x, lod) textureLod(x, coord, lod)
#define landMask(x) (x < 1.0)
#define icube_smooth(x) (x * x) * (3.0 - 2.0 * x)

#define expf(x) exp2((x) * rlog2)