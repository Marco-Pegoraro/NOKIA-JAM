extends Node2D

@onready
var endPhase : bool = false;

func _on_area_2d_body_entered(body):
	if (body.name == "Player" && body.keyCatched):
		endPhase = true;
