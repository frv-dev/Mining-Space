extends Node2D

@onready var _laser_sprite := $LaserSprite
@export var speed := 300


func _ready() -> void:
	_laser_sprite.play("default")


func _process(delta: float) -> void:
	translate(Vector2(0, -1) * speed * delta)


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
