extends EntityFactory

class_name EnemyFactory

@export var enemy_scene = preload("res://scenes/enemy.tscn")

func create_entity() ->Node:
	return enemy_scene.instantiate()
