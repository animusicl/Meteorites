extends RigidBody2D

## Eport attributes
export var engine_power = 20
export var rotation_power = 280

var pushing_force:Vector2
var rotation_dir:int

##Methods or functions
func _integrate_forces(state: Physics2DDirectBodyState) -> void:
	apply_central_impulse(pushing_force.rotated(rotation))
	apply_torque_impulse(rotation_dir * rotation_power)

func _process(delta: float) -> void:
	player_input()

func player_input() -> void:
	# Push
	pushing_force = Vector2.ZERO
	if Input.is_action_pressed("move_up"):
		pushing_force = Vector2(engine_power, 0)
	elif Input.is_action_pressed("move_down"):
		pushing_force = Vector2(-engine_power, 0)
		
	#Rotation
	rotation_dir = 0
	if Input.is_action_pressed("move_left"):
		rotation_dir -= 1
	elif Input.is_action_pressed("move_right"):
		rotation_dir += 1
		
