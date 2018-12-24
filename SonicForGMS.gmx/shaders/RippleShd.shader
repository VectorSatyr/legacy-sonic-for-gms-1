//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vPosition;
varying vec4 v_vColour;
varying vec2 v_vTexcoord;

void main() {
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;

    v_vPosition = in_Position.xy;
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Ripple distortion fragment shader
//

// Jason Allen Doucette
// http://xona.com/jason/
//
// Quake-style Underwater Distortion
// May 15, 2016
//
varying vec2 v_vPosition;
varying vec4 v_vColour;
varying vec2 v_vTexcoord;

uniform sampler2D u_sTexture;

// viewport resolution (in pixels)
uniform vec2 u_vResolution;

// shader playback time (in seconds)
uniform float u_fTime;

/*  the amount of shearing (shifting of a single column or row)
    1.0 = entire screen height offset (to both sides, meaning it's 2.0 in total) */
uniform vec2 u_vMagnitude;

/*  cycle multiplier for a given screen height
    2 * PI = you see a complete sine wave from top..bottom */
uniform vec2 u_vCycles;

void main() {
    vec2 vCycle = u_fTime + vec2( v_vPosition.yx * u_vCycles.yx );
    vec2 vPosition = v_vPosition.xy / u_vResolution.xy;
    vPosition += sin( vCycle ) * u_vMagnitude.yx;
    gl_FragColor = v_vColour * texture2D( u_sTexture, vPosition );
}
