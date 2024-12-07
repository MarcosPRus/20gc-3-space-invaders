extends Area2D


func _process(delta: float) -> void:
	position += 350 * delta * Vector2.RIGHT
