extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var main
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_play_button_down():
	main = preload("res://scenes/female2.scn")
	get_tree().change_scene_to(main) # replace with function body
