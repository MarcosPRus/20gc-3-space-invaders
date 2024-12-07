extends CharacterBody2D

const SPEED = 300.0

var missile_scene := preload("res://Scenes/missile.tscn")

@onready var timer := $BulletCD


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up") and timer.is_stopped():
		var missile = missile_scene.instantiate()
		missile.position = self.position + Vector2.UP*25
		get_tree().current_scene.add_child(missile)
		
		timer.start()


func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	ScoreBoard.lives -= 1
	
	area.queue_free()
