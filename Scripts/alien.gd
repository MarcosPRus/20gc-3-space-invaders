extends Area2D

@export var stats : AlienStats


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.frame = stats.sprite_id


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	ScoreBoard.update_score(ScoreBoard.score + stats.points)
	
	area.queue_free()
	queue_free()
