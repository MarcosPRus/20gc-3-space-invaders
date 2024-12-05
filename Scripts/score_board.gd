extends Node
var score : int
var lifes : int = 3


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score = 0


func update_score(new_score:int) -> void:
	score = new_score
