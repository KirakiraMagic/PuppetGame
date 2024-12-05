extends RigidBody3D

@onready var poof = preload("res://map_elements/Poof.tscn")
var lifespan := 0.0
const MAX_LIFE = 20.0
signal shrinker
# Called when the node enters the scene tree for the first time.
func _ready():
	shrinker.connect(shrink)
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
	if (lifespan > MAX_LIFE) or $CollisionShape3D.scale <= Vector3(0.5,0.5,0.5):
		$Poof.emitting = true #Do not use, timing is off
		var tween = create_tween()
		tween.tween_property($CollisionShape3D, "scale", Vector3(0.1,0.1,0.1), 0.5)
		await tween.finished
		queue_free()
	pass
	
func shrink(hit:bool):
	if hit:
		print("hit food")
		var tween = create_tween()
		tween.tween_property($CollisionShape3D, "scale", $CollisionShape3D.scale * 0.9, 0.1)
