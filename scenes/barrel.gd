extends RigidBody2D

var space = 248

func move_down_by_one_barrel():
	position.y += space * 0.4

func update_label():
	$Label.text = str(global_position.y)

func _process(delta):
	update_label()
