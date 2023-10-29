class_name LaserHitBox
extends Area2D

@export var damage_points := 1


func get_custom_class() -> String:
	return 'LaserHitBox'


func _on_area_entered(asteroid: Area2D):
	if not is_instance_of(asteroid, AsteroidHitBox):
		return
	
	(owner as Laser).hit()
