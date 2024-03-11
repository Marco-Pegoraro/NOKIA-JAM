extends Node2D

var heatBarLevel : int;

func _process(delta):
	if (heatBarLevel == 11):
		$Sprite2D.texture = load("res://Assets/Cold Bar/cold_bar1.png");
	elif (heatBarLevel == 10):
		$Sprite2D.texture = load("res://Assets/Cold Bar/cold_bar2.png");
	elif (heatBarLevel == 9):
		$Sprite2D.texture = load("res://Assets/Cold Bar/cold_bar3.png");
	elif (heatBarLevel == 8):
		$Sprite2D.texture = load("res://Assets/Cold Bar/cold_bar4.png");
	elif (heatBarLevel == 7):
		$Sprite2D.texture = load("res://Assets/Cold Bar/cold_bar5.png");
	elif (heatBarLevel == 6):
		$Sprite2D.texture = load("res://Assets/Cold Bar/cold_bar6.png");
	elif (heatBarLevel == 5):
		$Sprite2D.texture = load("res://Assets/Cold Bar/cold_bar7.png");
	elif (heatBarLevel == 4):
		$Sprite2D.texture = load("res://Assets/Cold Bar/cold_bar8.png");
	elif (heatBarLevel == 3):
		$Sprite2D.texture = load("res://Assets/Cold Bar/cold_bar9.png");
	elif (heatBarLevel == 2):
		$Sprite2D.texture = load("res://Assets/Cold Bar/cold_bar10.png");
	elif (heatBarLevel == 1 || heatBarLevel == 0):
		$Sprite2D.texture = load("res://Assets/Cold Bar/cold_bar11.png");
