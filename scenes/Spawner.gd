extends Node2D

@export var factory: EntityFactory  # A fábrica será configurável no Inspetor

func spawn_entity(position: Vector2):
	if factory:
		var entity = factory.create_entity()
		if entity:
			entity.position = position
			add_child(entity)

func _ready():
	spawn_entity(Vector2(0, 1))  # Spawna uma entidade ao iniciar a cena
