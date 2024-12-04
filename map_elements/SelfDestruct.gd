extends Node3D
# Called when the node enters the scene tree for the first time.
var lifespan := 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	lifespan += 1
	if (lifespan > 1500):
		var tween = create_tween()
		tween.tween_property($Capsule/CollisionShape3D, "scale", Vector3.ZERO, 0.5)
		tween.tween_property($Cube/CollisionShape3D, "scale", Vector3.ZERO, 0.5)
		tween.tween_property($Sphere/CollisionShape3D, "scale", Vector3.ZERO, 0.5)
		await tween.finished
		queue_free()
		lifespan = 0
