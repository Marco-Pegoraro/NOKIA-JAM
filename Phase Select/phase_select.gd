extends Node2D

var buttonsGroup : Array;

var menuOrder;

var backAnimation;

var phaseAnimation01;

var phaseAnimation02;

var phaseAnimation03;

var phaseAnimation04;

var campFires : Array;

func _ready():
	buttonsGroup = get_tree().get_nodes_in_group("PhaseSelectButtons");
	menuOrder = 0;
	
	var phase01 = buttonsGroup[0].get_node("Animation");
	var phase01Complete = buttonsGroup[0].get_node("AnimationCompleted");
	
	if (Utils.phase01Completed == true):
		phaseAnimation01 = phase01Complete
		phase01.visible = false;
	else:
		phaseAnimation01 = phase01;
		phase01Complete.visible = false;
	
	var phase02 = buttonsGroup[1].get_node("Animation");
	var phase02Complete = buttonsGroup[1].get_node("AnimationCompleted");
	
	if (Utils.phase02Completed == true):
		phaseAnimation02 = phase02Complete
		phase02.visible = false;
	else:
		phaseAnimation02 = phase02;
		phase02Complete.visible = false;
	
	var phase03 = buttonsGroup[2].get_node("Animation");
	var phase03Complete =  buttonsGroup[2].get_node("AnimationCompleted");
	
	if (Utils.phase03Completed == true):
		phaseAnimation03 = phase03Complete
		phase03.visible = false;
	else:
		phaseAnimation03 = phase03;
		phase03Complete.visible = false;
	
	var phase04 = buttonsGroup[3].get_node("Animation");
	var phase04Complete = buttonsGroup[3].get_node("AnimationCompleted");
	
	if (Utils.phase04Completed == true):
		phaseAnimation04 = phase04Complete
		phase04.visible = false;
	else:
		phaseAnimation04 = phase04;
		phase04Complete.visible = false;
	
	backAnimation = $Back.get_node("Animation");


func _process(delta):
	if (Input.is_action_just_pressed("ui_right")):
		if (menuOrder + 1 > 5):
			menuOrder = 0;
		else: 
			menuOrder += 1;
	elif (Input.is_action_just_pressed("ui_left")):
		if ((menuOrder - 1) < 0):
			menuOrder = 4;
		else:
			menuOrder -= 1;
	
	if (menuOrder == 0):
		phaseAnimation01.play("Selected");
		
		phaseAnimation02.play("NonSelected");
		backAnimation.play("NonSelected");
		
		if (Input.is_action_just_released("ui_confirm")):
			get_tree().change_scene_to_file("res://Phases/Phase 01/phase_01.tscn");
	
	if (menuOrder == 1):
		phaseAnimation02.play("Selected");
		
		phaseAnimation01.play("NonSelected");
		phaseAnimation03.play("NonSelected");
		
		if (Input.is_action_just_released("ui_confirm")):
			get_tree().change_scene_to_file("res://Phases/Phase 02/phase_02.tscn");
	
	if (menuOrder == 2):
		phaseAnimation03.play("Selected");
		
		phaseAnimation02.play("NonSelected");
		phaseAnimation04.play("NonSelected");
		
		if (Input.is_action_just_released("ui_confirm")):
			get_tree().change_scene_to_file("res://Phases/Phase 03/phase_03.tscn");
	
	if (menuOrder == 3):
		phaseAnimation04.play("Selected");
		
		phaseAnimation03.play("NonSelected");
		backAnimation.play("NonSelected");
		
		if (Input.is_action_just_released("ui_confirm")):
			get_tree().change_scene_to_file("res://Phases/Phase 04/phase_04.tscn");
	
	if (menuOrder == 4):
		backAnimation.play("Selected");
		
		phaseAnimation01.play("NonSelected");
		phaseAnimation04.play("NonSelected");
		
		if (Input.is_action_just_released("ui_confirm")):
			get_tree().change_scene_to_file("res://Start/start.tscn");
	
