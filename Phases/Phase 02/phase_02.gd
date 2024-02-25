extends Node2D

@onready
var igloo = $Igloo;

@onready
var campFire = $Campfire;

@onready
var campFire2 = $Campfire2;

@onready
var key = $Key;

@onready
var player = get_node("Player");

@onready
var coldBar =  $"CanvasLayer/Cold Bar".get_node("Sprite2D");

var coldBarLevel;

var coldBarTimer;

var menuOrder;

var replayAnimation;

var menuAnimation;

var buttonsGroup;


func _ready():
	var campFireAnimation = campFire.get_node("AnimatedSprite2D");
	campFireAnimation.play("Default");
	
	var campFireAnimation2 = campFire2.get_node("AnimatedSprite2D");
	campFireAnimation2.play("Default");
	
	var iglooAnimation = igloo.get_node("AnimatedSprite2D");
	iglooAnimation.play("Default");
	
	buttonsGroup = get_tree().get_nodes_in_group("PhaseButton");
	replayAnimation = buttonsGroup[0].get_node("AnimatedSprite2D");
	menuAnimation = buttonsGroup[1].get_node("AnimatedSprite2D")
	
	Utils.playerAlive = true;
	coldBarTimer = 2.0;
	coldBarLevel = 11;
	menuOrder = 0;
	timerStart();


func _process(delta):
	if (Utils.playerAlive):
		checkColdBar();
	else:
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
		
		if (menuOrder == 0):
			replayAnimation.play("Selected");
			menuAnimation.play("NonSelected");
			
			if (Input.is_action_just_released("ui_confirm")):
				get_tree().reload_current_scene();
		
		if (menuOrder == 1):
			menuAnimation.play("Selected");
			replayAnimation.play("NonSelected");
			
			if (Input.is_action_just_released("ui_confirm")):
				get_tree().change_scene_to_file("res://Phase Select/phase_select.tscn");
	
	if (igloo.showText == true):
		if(player.keyCatched):
			get_tree().change_scene_to_file("res://Phase Select/phase_select.tscn");
			Utils.phase02Completed = true;
		else:
			$FindKeyLabel.visible = true;
	
	if (Utils.heatWave && coldBarLevel < 11):
		coldBarLevel += 1;
	
	if (player != null && player.keyCatched == false):
		if (key.keyCatched):
			key.queue_free()
			player.keyCatched = true;


func timerStart():
	while (true):
		await get_tree().create_timer(coldBarTimer).timeout
		coldBarLevel -= 1;


func checkColdBar():
	if (coldBarLevel == 11):
		coldBar.texture = load("res://Assets/Cold Bar/cold_bar1.png");
	elif (coldBarLevel == 10):
		coldBar.texture = load("res://Assets/Cold Bar/cold_bar2.png");
	elif (coldBarLevel == 9):
		coldBar.texture = load("res://Assets/Cold Bar/cold_bar3.png");
	elif (coldBarLevel == 8):
		coldBar.texture = load("res://Assets/Cold Bar/cold_bar4.png");
	elif (coldBarLevel == 7):
		coldBar.texture = load("res://Assets/Cold Bar/cold_bar5.png");
	elif (coldBarLevel == 6):
		coldBar.texture = load("res://Assets/Cold Bar/cold_bar6.png");
	elif (coldBarLevel == 5):
		coldBar.texture = load("res://Assets/Cold Bar/cold_bar7.png");
	elif (coldBarLevel == 4):
		coldBar.texture = load("res://Assets/Cold Bar/cold_bar8.png");
	elif (coldBarLevel == 3):
		coldBar.texture = load("res://Assets/Cold Bar/cold_bar9.png");
	elif (coldBarLevel == 2):
		coldBar.texture = load("res://Assets/Cold Bar/cold_bar10.png");
	elif (coldBarLevel == 1):
		coldBar.texture = load("res://Assets/Cold Bar/cold_bar11.png");
	elif (coldBarLevel == 0):
		Utils.playerAlive = false;
		$CanvasLayer/GameOverBackground.visible = true;
		$CanvasLayer/Gameover.visible = true;
		$"CanvasLayer/Replay Button".visible = true;
		$"CanvasLayer/Menu Button".visible = true;
		
		
		player.queue_free();
