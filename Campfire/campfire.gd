extends Node2D

func _on_area_2d_body_entered(body):
	if (body.name == "Player"):
		Utils.heatWave = true;


func _on_area_2d_body_exited(body):
	if (body.name == "Player"):
		Utils.heatWave = false;
