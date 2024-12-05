extends RigidBody3D

var lifespan := 0.0

const MAX_LIFE = 20.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	lifespan += delta
	if (lifespan <= 1.5):
		var tween = create_tween()
		self.freeze = true
		tween.tween_property($CollisionShape3D, "scale", Vector3.ONE, 1.0)
		await tween.finished
		self.freeze = false
	if (lifespan > MAX_LIFE):
		var tween = create_tween()
		tween.tween_property($CollisionShape3D, "scale", Vector3.ZERO, 1.0)
		await tween.finished
		queue_free()
	pass
