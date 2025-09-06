extends TransformSpawnerComponent
class_name ManualTransformSpawnerComponent

## The manual transform to give.
@export var transform:SpawnTransform
## Whether or not to substitute the "global position" property with the spawner's global position.
@export var inherit_spawner_position:bool = false

func _ready() -> void:
	if inherit_spawner_position:
		transform.global_position = component.global_position

func get_transform() -> SpawnTransform:
	return transform
