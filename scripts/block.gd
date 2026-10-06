extends RigidBody3D

@export var speed = 5.0
var direction = 1
var dropped = false
var directions = ['x', 'z']
var dirc = 'x'
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if dropped == false:
		
		if  dirc == 'x':
			position.x += speed * direction * delta
			if abs(position.x) > 5:
				direction *= -1
		if dirc == 'z':
			position.z += speed *direction * delta
			if abs(position.z) > 5:
				direction *= -1

func drop():
	dropped = true
	
	freeze = false
	
