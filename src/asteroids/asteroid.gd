class_name Asteroid
extends Node2D

@export var health_points := 1


func get_custom_class() -> String:
	return 'Asteroid'


func _process(delta: float) -> void:
	_verify_health()


func _verify_health() -> void:
	if health_points <= 0:
		_destroy_animation()
		queue_free()


func take_damage(damage_points: int) -> void:
	health_points -= damage_points


func _destroy_animation() -> void: # This method works as an abstract method to be implemented by child classes
	push_error('The class ', get_custom_class(), ' need to overlap this func from parent class.')
