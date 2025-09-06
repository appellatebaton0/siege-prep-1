extends Node

signal game_lost

@onready var world:Node2D = get_tree().get_first_node_in_group("Main")

var score:int = 0
var best:int = 0

var score_timer:float = 0.0

func _process(delta: float) -> void:
	score_timer = move_toward(score_timer, 1.0, delta)
	if score_timer >= 1.0:
		score += 1
		score_timer = 0.0

func _ready() -> void:
	game_lost.connect(_on_game_lost)

func _on_game_lost():
	
	if score > best:
		best = score
	
	score = 0
	score_timer = 0.0
