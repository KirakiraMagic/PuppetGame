extends RigidBody3D

var lifespan := 0

const MAX_LIFE = 10.0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	lifespan += delta
	if (lifespan > MAX_LIFE):
		var tween = create_tween()
		tween.tween_property($Capsule/CollisionShape3D, "scale", Vector3.ZERO, 0.5).set_trans(Tween.TRANS_ELASTIC)
		await tween.finished
		queue_free()
	pass
