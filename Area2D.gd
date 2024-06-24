extends Area2D

@export var Bullet : PackedScene
var bullet_speed 
var speed = 750

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_Bullet_body_entered(body):
	if body.is_in_group("mobs"):
		body.queue_free()
	queue_free()
	
func shoot():
	var b = Bullet.instantiate()
	owner.add_child(b)	
	b.transform = $Muzzle.global_transform
	
	var bullet_instance = Bullet.instantiate()
	bullet_instance.position = get_global_mouse_position()
	bullet_instance.rotation_degrees = get_rotation()
	bullet_instance.apply_impulse(Vector2(bullet_speed, 0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child", bullet_instance)
