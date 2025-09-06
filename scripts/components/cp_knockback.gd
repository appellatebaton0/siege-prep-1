extends Component
class_name KnockbackComponent

@export var amount:float = 0.0

func apply_to(component:MotionComponent):
	component.me.velocity += amount * actor.global_position.direction_to(component.actor.global_position)
	pass

func _on_body_entered(body: Node2D) -> void:
	var component = body
	if component is MotionComponent:
		apply_to(component)
