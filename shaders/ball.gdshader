shader_type canvas_item;


float circle(vec2 position, float radius, float feather) {
	return smoothstep(radius, radius + feather, length(position - vec2(0.5)));
}


void fragment() {
	float feather = fwidth(UV).x;
	COLOR.a *= 1.0 - circle(UV, .5 - feather, feather);
}