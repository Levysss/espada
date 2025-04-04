extends CharacterBody2D

@export var SPEED: float = 100
var random_direction: Vector2 = Vector2.ZERO
var change_direction_timer: float = 0.0
var player

func _ready() -> void:
	change_direction_timer = randf_range(0,1.0)
	player = $Player

func _physics_process(delta: float) -> void:
	change_direction_timer -= delta
	
	if change_direction_timer <= 0:
		random_direction = Vector2(randf_range(-1.0,1.0), 
		randf_range(-1.0,1.0)).normalized()
		
		change_direction_timer = randf_range(0.1, 0.5)
		
	velocity = random_direction * SPEED
	move_and_slide()

@onready var WalkAnimation = $AnimatedSprite2D
func _process(delta: float) -> void:
	if velocity.length() > 0:
		if abs(velocity.x) > abs(velocity.y):
			if velocity.x >0:
				WalkAnimation.play("Right")
			else:
				WalkAnimation.play("Left")
		else:
			if velocity.y > 0:
				WalkAnimation.play("Down")
			else:
				WalkAnimation.play("Up")

signal heartChanged
var currentHealth = 2

func _on_hit_box_area_entered(area: Area2D) -> void:
	if area.name != "weaponHitBox": return

	currentHealth -= 1
	heartChanged.emit(currentHealth)
	
	if currentHealth <= 0:
		#player.kills+=1
		#print(player.kills)
		queue_free()
