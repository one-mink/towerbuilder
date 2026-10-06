extends Node3D

@export var block =  preload("res://scenes/box.tscn")

@onready var spawn = $Marker3D
@onready var camera = $Camera3D
@onready var score_label = $CanvasLayer/score_label

var current_block = null

var score = 0

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		if current_block and not current_block.dropped:
			_drop()


func _ready() -> void:
	_spawn()


func _process(delta: float) -> void:
	pass
	
func _spawn():
	current_block = block.instantiate()
	add_child(current_block)
	print(spawn.position)
	current_block.position = spawn.position
	current_block.dirc = current_block.directions.pick_random()
	
func _drop():
	current_block.drop()
	score += 1
	score_label.text = str(score)
	spawn.position.y += 0.5
	await get_tree().create_timer(0.2).timeout
	camera.position.y += 0.2
	camera.position.z += 0.2
	camera.position.x -= 0.2
	_spawn()
	


func _on_area_3d_body_entered(body: Node3D) -> void:
	get_tree().change_scene_to_file("res://scenes/game-over.tscn")
