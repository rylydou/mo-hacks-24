shader_type canvas_item;


uniform float texture_scale = 8.0;

void fragment() {
	COLOR = texture(TEXTURE, vec2(SCREEN_UV.x * (SCREEN_PIXEL_SIZE.y / SCREEN_PIXEL_SIZE.x), SCREEN_UV.y) * texture_scale);
}