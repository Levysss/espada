extends Node2D

@export var factory: EntityFactory
var player
var howManySpawn = 0
func spawn_entity(position: Vector2):
	if factory:
		var entity = factory.create_entity()
		if entity:
			entity.position = position
			add_child(entity)

func _ready():
	player = $"../Player"

func _physics_process(delta: float) -> void:
	if player.kills <5 and howManySpawn<5:
		for i in range(5):
			spawn_entity(Vector2(0, 1))
			howManySpawn+=1
			
	elif player.kills >5 and howManySpawn<10:
		for i in range(5):
			spawn_entity(Vector2(0, 1))
			
	
