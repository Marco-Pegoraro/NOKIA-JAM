extends Node2D

@onready
var menuOrder = 0;

@onready
var completeText = "Complete"

func _ready():
	if (Utils.phase01Completed == true):
		$"Phase01 Button".labelText = completeText;
	
	if (Utils.phase02Completed == true):
		$"Phase02 Button".labelText = completeText;
	
	if (Utils.phase03Completed == true):
		$"Phase03 Button".labelText = completeText;
	
	if (Utils.phase04Completed == true):
		$"Phase04 Button".labelText = completeText;


func _process(delta):
	if (Input.is_action_just_pressed("ui_back")):
		get_tree().change_scene_to_file("res://Start/start.tscn");
	
	MenuMovement();
	
	if (menuOrder == 0):
		$"Phase01 Button".selected = true;
		
		$"Phase02 Button".selected = false;
		$"Phase04 Button".selected = false;
		
		if (Input.is_action_just_released("ui_confirm")):
			get_tree().change_scene_to_file("res://Phases/Phase 01/phase_01.tscn");
	
	if (menuOrder == 1):
		$"Phase02 Button".selected = true;
		
		$"Phase01 Button".selected = false;
		$"Phase03 Button".selected = false;
		
		if (Input.is_action_just_released("ui_confirm")):
			get_tree().change_scene_to_file("res://Phases/Phase 02/phase_02.tscn");
	
	if (menuOrder == 2):
		$"Phase03 Button".selected = true;
		
		$"Phase02 Button".selected = false;
		$"Phase04 Button".selected = false;
		
		if (Input.is_action_just_released("ui_confirm")):
			get_tree().change_scene_to_file("res://Phases/Phase 03/phase_03.tscn");
	
	if (menuOrder == 3):
		$"Phase04 Button".selected = true;
		
		$"Phase01 Button".selected = false;
		$"Phase03 Button".selected = false;
		
		if (Input.is_action_just_released("ui_confirm")):
			get_tree().change_scene_to_file("res://Phases/Phase 04/phase_04.tscn");


func MenuMovement():
	if (Input.is_action_just_pressed("ui_right")):
		if (menuOrder + 1 > 3):
			menuOrder = 0;
		else: 
			menuOrder += 1;
	elif (Input.is_action_just_pressed("ui_left")):
		if ((menuOrder - 1) < 0):
			menuOrder = 3;
		else:
			menuOrder -= 1;
