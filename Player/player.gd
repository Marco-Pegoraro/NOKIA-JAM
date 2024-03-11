extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -250.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity");

var offSet = Vector2(-25, -10)

var keyCatched : bool;

func _ready():
	keyCatched = false;


func _physics_process(delta):
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta;
	
	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor() and Utils.playerAlive:
		velocity.y = JUMP_VELOCITY;
		$AnimationPlayer.play("Jump");
	
	# Handle Fall.
	if velocity.y > 0:
		$AnimationPlayer.play("Fall");

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right");
	
	if direction and Utils.playerAlive:
		velocity.x = direction * SPEED;
		
		if velocity.y == 0:
			$AnimationPlayer.play("Walk");
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
		if velocity.y == 0 && Utils.playerAlive:
			$AnimationPlayer.play("Idle");
	
	# Control player animations directions
	# Use elif in case you want player sprite stay in same direction
	if Utils.playerAlive:
		if direction == -1:
			get_node("AnimatedSprite2D").flip_h = true;
		
		if direction == 1:
			get_node("AnimatedSprite2D").flip_h = false;

	move_and_slide()
