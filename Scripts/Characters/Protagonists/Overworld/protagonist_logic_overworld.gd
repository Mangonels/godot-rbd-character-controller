class_name ProtagonistLogic_Overworld extends Node3D

@export var protagonist_body : ProtagonistMovement_Overworld
@export var ground_checker : ContactChecker_Groups

var last_jump_input_start : float = 0.0

func _physics_process(_delta):
	# Movement command check
	var move_direction = Vector2.ZERO
	move_direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	move_direction.y = Input.get_action_strength("move_backward") - Input.get_action_strength("move_forward")
	
	protagonist_body.horizontal_movement = move_direction.normalized()
	
	# Jump command check
	if Input.is_action_just_pressed("jump"):
		last_jump_input_start = 0.0
		protagonist_body.ascend()

	if Input.is_action_just_released("jump"):
		protagonist_body.ascend_cut()

func _process(_delta):
	last_jump_input_start += _delta
