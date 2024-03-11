extends Node2D

@export
var labelText : String;

var selected : bool;


func _process(delta):
	$ButtonOnSelect/ButtonOnSelectLabel.text = labelText;
	$ButtonNonSelect/ButtonNonSelectLabel.text = labelText;
	
	if (selected):
		$ButtonOnSelect.visible = true;
		$ButtonNonSelect.visible = false;
	else:
		$ButtonOnSelect.visible = false;
		$ButtonNonSelect.visible = true;
