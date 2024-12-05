extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _on_body_entered(body):
	if body.is_in_group("projectile"):
		var tween = create_tween()
		tween.tween_property(self, "scale",self.scale * 0.9, 0.1)
		if self.scale <= Vector3(0.5,0.5,0.5):
			print("Nom") #Add scoring event here.
