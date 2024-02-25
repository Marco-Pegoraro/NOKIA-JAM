extends Node2D

var keyCatched : bool;

func _ready():
	keyCatched = false;


func _on_area_2d_body_entered(body):
	if (body.name == "Player"):
		keyCatched = true;
