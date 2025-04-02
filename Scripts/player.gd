extends CharacterBody2D
var SPEED = 200
var kills = 0
var heatl = 100

@onready var walkAnimation = $AnimatedSprite2D
var healtBar

func _ready() -> void:
	healtBar = $"../CanvasLayer/HealthBar"
	
	

func _physics_process(delta: float) -> void:
	moviment()
	move_and_slide()
	life()

func life():
	healtBar.value = heatl
	
func _on_hurt_box_area_entered(area):
	if area.name != "hitBox": return

	heatl -= 30
	
	print_debug(heatl)
	
	var knockback_force = 1000
	var knockback_direction = (global_position - area.global_position).normalized()
	velocity = knockback_force * knockback_direction
	move_and_slide()

	if heatl <= 0:
		get_tree().reload_current_scene()
func moviment():
	var input_direction = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	).normalized()

	velocity = input_direction * SPEED if input_direction else velocity.move_toward(Vector2.ZERO, SPEED)

func _process(delta: float) -> void:
	walkAnimation.play("default");
