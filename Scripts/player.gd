extends CharacterBody2D
var SPEED = 200
var kills = 0

@onready var walkAnimation = $AnimatedSprite2D
func _physics_process(delta: float) -> void:
	var input_direction = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	).normalized()

	velocity = input_direction * SPEED if input_direction else velocity.move_toward(Vector2.ZERO, SPEED)
	


	move_and_slide()
func _process(delta: float) -> void:
	walkAnimation.play("default");
