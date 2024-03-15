extends CharacterBody3D

@onready var nav:NavigationAgent3D = $NavigationAgent3D;
@onready var player = get_tree().get_nodes_in_group("Player")[0];

var target_position: Vector3 = player.global_position;

var speed = 3;
var health = 20;

func _ready():
	nav.path_desired_distance = 0.5;
	nav.target_desired_distance = 0.5;
	
	call_deferred("actor_setup");


func actor_setup():
	await get_tree().physics_frame
	
	set_movement_target(target_position);



func set_movement_target(target: Vector3):
	nav.set_target_position(target);


func _physics_process(delta):
	if nav.is_navigation_finished():
		return
	
	var current_agent_pos: Vector3 = global_position;
	var next_path_pos: Vector3 = nav.get_next_path_position();
	
	velocity = current_agent_pos.direction_to(next_path_pos)*speed;
	move_and_slide()

	





func take_damage(dmg_amount):
	health -= dmg_amount;
	if health <= 0:
		death();
	
func death():
	set_process(false);
	set_physics_process(false);
	$CollisionShape3D.disabled = true;
	$AnimatedSprite3D.play("Death");
	
func shoot(target):
	pass
	
