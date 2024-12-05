extends Area2D

@export var cell_type := 0
var cell_integrity := 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.frame = cell_type


func _on_area_entered(area: Area2D) -> void:
	area.queue_free()
	
	cell_integrity += 1
	
	if cell_integrity >= 3:
		self.queue_free()
		
	$AnimatedSprite2D.frame = cell_type + cell_integrity
