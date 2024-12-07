extends Control

var full_hearth_texture = preload("res://Assets/Hearth_full.png")
var empty_hearth_texture = preload("res://Assets/Hearth_empty.png")

var Prev_Lives := 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$CanvasLayer/ScoreLabel.text = str(ScoreBoard.score) + " pts" 
	
	if ScoreBoard.lives != Prev_Lives:
		match ScoreBoard.lives:
			3:
				$CanvasLayer/TextureRect.texture = full_hearth_texture
				$CanvasLayer/TextureRect2.texture = full_hearth_texture
				$CanvasLayer/TextureRect3.texture = full_hearth_texture
			2:
				$CanvasLayer/TextureRect.texture = full_hearth_texture
				$CanvasLayer/TextureRect2.texture = full_hearth_texture
				$CanvasLayer/TextureRect3.texture = empty_hearth_texture
			1:
				$CanvasLayer/TextureRect.texture = full_hearth_texture
				$CanvasLayer/TextureRect2.texture = empty_hearth_texture
				$CanvasLayer/TextureRect3.texture = empty_hearth_texture
			0:
				$CanvasLayer/TextureRect.texture = empty_hearth_texture
				$CanvasLayer/TextureRect2.texture = empty_hearth_texture
				$CanvasLayer/TextureRect3.texture = empty_hearth_texture
	
		Prev_Lives = ScoreBoard.lives
	
