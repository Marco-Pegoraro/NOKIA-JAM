extends Node2D

var buttonsGroup;

var menuOrder;

var startButtonAnimation;

var quitButtonAnimation;

var backgroundAnimation;

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN);
	
	backgroundAnimation = get_node("AnimatedSprite2D");
	backgroundAnimation.play("Idle");
	
	buttonsGroup = get_tree().get_nodes_in_group("StartScreenButtons");
	menuOrder = 0;
	
	startButtonAnimation = buttonsGroup[0].get_node("Animation");
	quitButtonAnimation = buttonsGroup[1].get_node("Animation");

func _process(delta):
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
		startButtonAnimation.play("Selected");
		quitButtonAnimation.play("NonSelected");
		
		if (Input.is_action_just_released("ui_confirm")):
			get_tree().change_scene_to_file("res://Phase Select/phase_select.tscn");
		
	elif (menuOrder == 1):
		quitButtonAnimation.play("Selected");
		startButtonAnimation.play("NonSelected");
		
		if (Input.is_action_just_released("ui_confirm")):
			get_tree().quit();
	
	
