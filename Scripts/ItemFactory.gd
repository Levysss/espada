extends EntityFactory

class_name ItemFactory

@export var item_scene: PackedScene

func create_entity() -> Node:
	return item_scene.instantiate()
