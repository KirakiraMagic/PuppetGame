extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body:Node3D):
	if body.has_method("reset_fall"):
		body.reset_fall()
	pass # Replace with function body.
