extends Node2D


var buttonsGroup;

var menuOrder;

var startButtonAnimation;

var creditsButtonAnimation;

var quitButtonAnimation;


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN);
	
	buttonsGroup = get_tree().get_nodes_in_group("StartButtons");
	menuOrder = 0;
	
	startButtonAnimation = buttonsGroup[0].get_node("AnimatedSprite2D");
	creditsButtonAnimation = buttonsGroup[1].get_node("AnimatedSprite2D");
	quitButtonAnimation = buttonsGroup[2].get_node("AnimatedSprite2D");


func _process(delta):
	if (Input.is_action_just_pressed("ui_down")):
		if (menuOrder + 1 > 2):
			menuOrder = 0;
		else: 
			menuOrder += 1;
	elif (Input.is_action_just_pressed("ui_up")):
		if ((menuOrder - 1) < 0):
			menuOrder = 2;
		else:
			menuOrder -= 1;
	
	if (menuOrder == 0):
		startButtonAnimation.play("Selected");
		creditsButtonAnimation.stop();
		quitButtonAnimation.stop();
		
		if (Input.is_key_pressed(KEY_1)):
			get_tree().change_scene_to_file("res://Phase Select/phase_select.tscn");
		
	elif (menuOrder == 1):
		startButtonAnimation.stop();
		creditsButtonAnimation.play("Selected");
		quitButtonAnimation.stop();
		
		if (Input.is_key_pressed(KEY_1)):
			get_tree().change_scene_to_file("res://Credits/credits.tscn");
		
	elif (menuOrder == 2):
		startButtonAnimation.stop();
		creditsButtonAnimation.stop();
		quitButtonAnimation.play("Selected");
		
		if (Input.is_key_pressed(KEY_1)):
			get_tree().quit();
	
	
