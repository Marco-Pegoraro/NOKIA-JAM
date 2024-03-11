extends Node2D

@onready
var menuOrder = 0;

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN);
	
	$AnimatedSprite2D.play("Idle");


func _process(delta):
	ButtonsOrder();
	
	if (menuOrder == 0):
		$"Start Button".selected = true;
		$"Quit Button".selected = false;
		
		if (Input.is_action_just_released("ui_confirm")):
			get_tree().change_scene_to_file("res://Phase Select/phase_select.tscn");
		
	elif (menuOrder == 1):
		$"Quit Button".selected = true;
		$"Start Button".selected = false;
		
		if (Input.is_action_just_released("ui_confirm")):
			get_tree().quit();


func ButtonsOrder():
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
