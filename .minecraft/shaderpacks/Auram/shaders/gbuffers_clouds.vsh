#version 130
/* MakeUp - gbuffers_clouds.vsh
Render: sky, clouds

Javier Garduño - GNU Lesser General Public License v3.0
*/

#define NO_SHADOWS

#include "/lib/config.glsl"
#include "/lib/color_utils.glsl"

// Varyings (per thread shared variables)
out vec2 texcoord;
out vec4 tint_color;
out float frog_adjust;
flat out vec3 current_fog_color;

uniform int current_hour_floor;
uniform int current_hour_ceil;
uniform float current_hour_fract;
uniform float rainStrength;

#if AA_TYPE > 0
  #include "/src/taa_offset.glsl"
#endif

#include "/lib/luma.glsl"

void main() {
  texcoord = (gl_TextureMatrix[0] * gl_MultiTexCoord0).xy;
  tint_color = gl_Color;
  #include "/src/position_vertex.glsl"
  #include "/src/cloudfog_vertex.glsl"
}