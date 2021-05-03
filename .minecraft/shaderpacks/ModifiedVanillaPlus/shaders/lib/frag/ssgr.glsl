/*
Copyright (C) 2019 RRe36

All Rights Reserved unless otherwise explicitly stated.


By downloading this you have agreed to the license and terms of use.
These can be found inside the included license-file or here: https://rre36.github.io/license/

Violating these terms may be penalized with actions according to the Digital Millennium Copyright Act (DMCA), the Information Society Directive and/or similar laws depending on your country.
*/


vec3 compute_ssgr(sampler2D tex, vec3 svec, vec3 vvec, vec3 lpos) {
    float visibility    = sstep(lightvec.y, 0.0, 0.1);
    float mie           = get_mie(dot(svec, lightvec), 0.74);

    vec3 nFrag      = -vvec;
    vec3 sgVec      = normalize(lightvecView+nFrag);
    float sunGrad   = 1.0-dot(sgVec, nFrag);
    float sunGlow   = linStep(sunGrad, 0.35, 0.98);
        sunGlow     = pow2(sunGlow) * mie * 0.35;

    if (sunGlow > 0.0) {
        vec4 tpos   = vec4(lpos, 1.0) * gbufferProjection;
            tpos.xyz /= tpos.w;
            tpos.xy = tpos.xy/tpos.z;
        vec2 lightpos   = tpos.xy * 0.5 + 0.5;
        float truepos   = shadowLightPosition.z/abs(shadowLightPosition.z);

        float sunpos    = abs(dot(vvec, lightvecView));
        float decay     = pow(sunpos, 30.0)+pow(sunpos, 16.0)*0.8+pow2(sunpos)*0.125;

        float dither    = dither_bluenoise();

        vec2 dcoord     = (lightpos - coord) * 0.6 * ssgr_length;
            dcoord     *= rcp(float(ssgr_samples));
        vec2 tcoord     = coord - dcoord*dither;

        vec3 godrays    = vec3(0.0);

        float visible   = 1.0-linStep(length(tpos.xy), 0.85, 1.25);
            decay      *= visible;

        //if (clamp(lightpos, -0.05, 1.05) != lightpos) decay = 0.0;

        if (visible > 0.0 && truepos < 1.0) {
            for (int i = 0; i<ssgr_samples; i++) {
                tcoord += dcoord;
                vec3 temp   = textureLod(tex, saturate(tcoord), 0).rgb;
                godrays    += temp * (1.0 - pow2(float(i)/ssgr_samples));
            }
            godrays *= rcp(float(ssgr_samples));
            godrays *= sunGlow * visible;
        }
        return godrays*visibility;
    } else {
        return vec3(0.0);
    }
}