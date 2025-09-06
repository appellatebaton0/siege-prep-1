extends Component
class_name RespawnComponent
var me:Node2D = get_me()

@onready var spawn_position = actor.global_position

func respawn():
	actor.global_position = spawn_position
