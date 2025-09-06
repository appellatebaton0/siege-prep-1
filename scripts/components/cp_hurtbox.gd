extends Component
class_name HurtboxComponent
var me:Area2D = get_me()

signal got_hurt

func hurt(hurter:Actor):
	got_hurt.emit()


func _on_area_entered(area: Area2D) -> void:
	var component = area # Abstract type
	if component is HitboxComponent:
		hurt(component.actor)
