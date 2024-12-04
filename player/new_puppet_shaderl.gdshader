shader_type spatial;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
    // Encode a specific value into the depth buffer
    DEPTH = 0.5;
}


