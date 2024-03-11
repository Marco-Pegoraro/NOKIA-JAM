extends Node2D

var keyCatched : bool;

var maxPosition;

var minPosition;

var moveDown : bool;

var moveUp : bool

func _ready():
	keyCatched = false;
	
	minPosition = position.y - 2;
	maxPosition = position.y + 2;
	
	moveDown = false;
	moveUp = true;


func _process(delta):
	if (moveUp):
		position.y += 0.1;
		
		if (position.y >= maxPosition):
			moveUp = false;
			moveDown = true;
	
	if (moveDown):
		position.y -= 0.1;
		
		if (position.y <= minPosition):
			moveDown = false;
			moveUp = true;


func _on_area_2d_body_entered(body):
	if (body.name == "Player"):
		keyCatched = true;
