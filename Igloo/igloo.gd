extends Node2D

var showText : bool;

func _ready():
	showText = false;


func _on_area_2d_body_entered(body):
	if (body.name == "Player"):
		showText = true;


func _on_area_2d_body_exited(body):
	if (body.name == "Player"):
		showText = false;
