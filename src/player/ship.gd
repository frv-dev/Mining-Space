class_name Ship
extends Node2D

@onready var _ship_fire_sprite := $ShipFireSprite

@export var speed := 200

@export var shot_automatically := true
var _shot_automatically_time := 0.0
var _shot_automatically_speed := 3.0

const _LAZER := preload("res://src/player/laser.tscn")
@onready var _marker_right_blaster := $MarkerRightBlaster
@onready var _marker_left_blaster := $MarkerLeftBlaster


func get_custom_class() -> String:
	return 'Ship'


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	_ship_fire_animation()
	_movement_control_setup(delta)
	_movement_limits()
	_shot_control_setup(delta)


func _movement_control_setup(delta: float) -> void:
	if Input.is_action_pressed("ui_up"):
		translate(Vector2(0, -1) * speed * delta)
	if Input.is_action_pressed("ui_down"):
		translate(Vector2(0, 1) * speed * delta)
	if Input.is_action_pressed("ui_left"):
		translate(Vector2(-1, 0) * speed * delta)
	if Input.is_action_pressed("ui_right"):
		translate(Vector2(1, 0) * speed * delta)


func _movement_limits() -> void:
	global_position.x = clamp(global_position.x, 10, 183)
	global_position.y = clamp(global_position.y, 41, 320)


func _shot_control_setup(delta: float) -> void:
	if shot_automatically:
		_shot_automatically_time += delta * _shot_automatically_speed
		
		if _shot_automatically_time < 1:
			return
		
		_shot_automatically_time = 0
		_shot(_marker_left_blaster.global_position)
		_shot(_marker_right_blaster.global_position)
	elif Input.is_action_just_pressed("ui_accept"):
		_shot(_marker_left_blaster.global_position)
		_shot(_marker_right_blaster.global_position)


func _shot(lazer_position: Vector2) -> void:
	var lazer = _LAZER.instantiate()
	get_parent().add_child(lazer)
	lazer.z_index = z_index - 1
	lazer.global_position = lazer_position


func _ship_fire_animation() -> void:
	if Input.is_action_pressed("ui_up"):
		_ship_fire_sprite.play("default", 0)
		_ship_fire_sprite.frame = 1
	elif Input.is_action_pressed("ui_down"):
		_ship_fire_sprite.play("default", 0)
		_ship_fire_sprite.frame = 0
	else:
		_ship_fire_sprite.play("default")

