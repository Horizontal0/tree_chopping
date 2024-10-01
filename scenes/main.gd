extends Node2D

var barrel_tscn = preload("res://scenes/barrel.tscn")

@onready var ypos = get_viewport().size.y - space * 0.2
var space = 248
var barrel_list:Array = []

func _ready():
	while ypos > 0:
		ypos -= space * 0.4
		gen_barrel(ypos)

func _input(event):
	if event.is_action_pressed("click_left"):
		gen_barrel(ypos - space * 0.4)
		#delete first array on list or animate first array/barrel
		fly_anim(true, barrel_list[0])
		#print("run")
		barrel_list.pop_at(0)
		barrel_down()

func barrel_down():
	
	for barrel in get_tree().get_nodes_in_group("barrel"):
		barrel.move_down_by_one_barrel()
		
	
	

func gen_barrel(y_pos):
		var barrel_instance = barrel_tscn.instantiate()
		barrel_list.append(barrel_instance)
		add_child(barrel_instance)
		barrel_instance.global_position.y = y_pos
		barrel_instance.global_position.x = randi_range(324,500)
		#print(barrel_list)

func fly_anim(direction:bool, barrel_instance:RigidBody2D):
	#print(barrel_instance)
	var tween = get_tree().create_tween()
	tween.tween_property(barrel_instance,"global_position", Vector2(barrel_instance.global_position.x + 500,barrel_instance.global_position.y - 200), 0.5)



	
	
	
	
	
