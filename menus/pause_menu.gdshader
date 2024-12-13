shader_type canvas_item;

uniform sampler2D screentexture : hint_screen_texture, filter_linear_mipmap;
uniform float amount : hint_range(0.0, 5.0);


void fragment() {
	vec4 color = textureLod(screentexture, SCREEN_UV, amount);
	COLOR = color;
}