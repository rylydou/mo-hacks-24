shader_type canvas_item;


float circle(vec2 position, float radius, float feather) {
	return smoothstep(radius, radius + feather, length(position - vec2(0.5)));
}


void fragment() {
	COLOR.rgb=vec3(1.0);
	COLOR.a *= circle(vec2(.5, .5), 1., .1);
}