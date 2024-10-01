extends Area2D

@onready var animated_sprite_2d = $AnimatedSprite2D

func _input(event):
	if event.is_action_pressed("click_left"):
		animated_sprite_2d.play("default")


func _on_animated_sprite_2d_animation_finished():
	animated_sprite_2d.play("idle")
