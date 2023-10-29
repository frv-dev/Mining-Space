class_name AsteroidHitBox
extends Area2D


func get_custom_class() -> String:
	return 'AsteroidHitBox'


func _on_area_entered(laserHitBox: Area2D):
	if not is_instance_of(laserHitBox, LaserHitBox):
		return
	
	(owner as Asteroid).take_damage(
		(laserHitBox as LaserHitBox).damage_points
	)
