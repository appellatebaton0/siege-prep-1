extends Component
class_name FreeComponent
var me:Area2D = get_me()

signal free

@export var free_delay:float = 0.0
var free_time:float = 0.0
var freeing:bool = false

func _process(delta: float) -> void:
	if freeing:
		if free_time >= free_delay:
			actor.queue_free()
		free_time += delta

func _on_area_entered(area: Area2D) -> void:
	freeing = true
	free.emit()
func _on_body_entered(body: Node2D) -> void:
	freeing = true
	free.emit()
