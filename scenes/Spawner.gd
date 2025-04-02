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
			spawn_entity(RangeSpanw())
			howManySpawn+=1
			
	elif player.kills >5 and howManySpawn<10:
		for i in range(5):
			spawn_entity(RangeSpanw())
			howManySpawn+=1
			
	
func RangeSpanw()-> Vector2:
	return Vector2(randf_range(500,-500),randf_range(300,-300))
