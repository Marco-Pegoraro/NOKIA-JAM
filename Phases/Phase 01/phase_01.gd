extends Node2D

@onready
var player = get_node("Player");

@onready
var heatBarLevel = 11;

@onready
var heatBarTimer = 1.5;

@onready
var menuOrder = 0;

func _ready():
	# Start campfires animations.
	$Campfire.get_node("AnimatedSprite2D").play("Idle");
	$Campfire2.get_node("AnimatedSprite2D").play("Idle");

	Utils.playerAlive = true;
	TimerStart();


func _process(delta):
	$"CanvasLayer/Heat Bar".heatBarLevel = heatBarLevel;
	
	if ($"CanvasLayer/Heat Bar".heatBarLevel == 0 && Utils.playerAlive):
		GameOver();
	else:
		GameOverButtonsActions();
	
	# Handle phase conclusion.
	if ($House.endPhase):
		get_tree().change_scene_to_file("res://Phase Select/phase_select.tscn");
		Utils.phase01Completed = true;
	
	# Heatbar fill up
	if (Utils.heatWave && heatBarLevel < 11):
		heatBarLevel += 1;
	
	if (player != null && player.keyCatched == false):
		if ($Key.keyCatched):
			$Key.queue_free();
			player.keyCatched = true;


func TimerStart():
	while (true):
		await get_tree().create_timer(heatBarTimer).timeout;
		heatBarLevel -= 1;


func GameOver():
	Utils.playerAlive = false;
	player.get_node("AnimationPlayer").play("Death");
	$CanvasLayer/GameOverTitle.visible = true;
	$"CanvasLayer/Replay Button".visible = true;
	$"CanvasLayer/Menu Button".visible = true;


func GameOverButtonsActions():
	# Game Over Buttons Movement.
	if (Input.is_action_just_pressed("ui_down")):
		if (menuOrder + 1 > 1):
			menuOrder = 0;
		else: 
			menuOrder += 1;
	elif (Input.is_action_just_pressed("ui_up")):
		if ((menuOrder - 1) < 0):
			menuOrder = 1;
		else:
			menuOrder -= 1;
	
	# GameOver buttons actions.
	if (menuOrder == 0):
		$"CanvasLayer/Replay Button".selected = true;
		$"CanvasLayer/Menu Button".selected = false;
			
		if (Input.is_action_just_released("ui_confirm")):
			get_tree().reload_current_scene();
		
	if (menuOrder == 1):
		$"CanvasLayer/Menu Button".selected = true;
		$"CanvasLayer/Replay Button".selected = false;
			
		if (Input.is_action_just_released("ui_confirm")):
			get_tree().change_scene_to_file("res://Phase Select/phase_select.tscn");


func _on_house_text_area_body_entered(body):
	if (body.name == "Player"):
		if player.keyCatched:
			$KeyFoundLabel.visible = true;
		else:
			$FindKeyLabel.visible = true;


func _on_house_text_area_body_exited(body):
	if (body.name == "Player"):
		$FindKeyLabel.visible = false;
		$KeyFoundLabel.visible = false;


func _on_campfire_text_area_body_entered(body):
	if (body.name == "Player"):
		$FirecampLabel.visible = true;


func _on_campfire_text_area_body_exited(body):
	if (body.name == "Player"):
		$FirecampLabel.visible = false;
