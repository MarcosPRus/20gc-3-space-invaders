extends Area2D

@export var stats : AlienStats

var missile_scene := preload("res://Scenes/enemy_missile.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.frame = stats.sprite_id


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if randf() > 0.9999:
		var missile = missile_scene.instantiate()
		missile.position = self.position + Vector2.DOWN*40
		get_tree().current_scene.add_child(missile)


func _on_area_entered(area: Area2D) -> void:
	ScoreBoard.update_score(ScoreBoard.score + stats.points)
	
	area.queue_free()
	queue_free()
