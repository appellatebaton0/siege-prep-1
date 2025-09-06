extends Component
class_name SpawnerComponent
var me:Node = get_me()

@onready var options_component:OptionsSpawnerComponent
@onready var transform_component:TransformSpawnerComponent

@export var spawn_limit:int = 0 ## How many actors this spawner can create at maximum (-1 = infinite)
var spawned_so_far:int = 0
@export var auto_spawn:bool = false ## Whether the spawner automatically starts spawning.
@export var spawn_interval:float = 0.0 ## How long to wait between each spawn
var spawn_time:float = 0.0

func _ready() -> void:
	for child in get_children():
		if child is OptionsSpawnerComponent:
			options_component = child
		elif child is TransformSpawnerComponent:
			transform_component = child

func get_actor_motion_component(from:Actor) -> MotionComponent:
	for component in from.get_components():
		if component is MotionComponent:
			return component
	return null

func spawn():
	for options in options_component.get_options():
		var new:Actor = options.instantiate()
		var transform:SpawnTransform = transform_component.get_transform()

		Global.world.add_child(new)
		
		# Apply position & rotation
		new.global_position = transform.global_position
		new.rotation = deg_to_rad(transform.rotation)
		
		# Apply initial velocity (or attempt to)
		if get_actor_motion_component(new) != null:
			get_actor_motion_component(new).me.velocity = transform.initial_velocity

func _process(delta: float) -> void:
	if auto_spawn:
		spawn_time = move_toward(spawn_time, 0, delta)
		
		if spawn_time <= 0 and (spawned_so_far < spawn_limit or spawn_limit < 0):
			spawn()
			spawn_time = spawn_interval
