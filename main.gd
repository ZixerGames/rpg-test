extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_right_pressed():
	Input.action_press("left") # replace with function body


func _on_right_released():
	Input.action_release("left") # replace with function body


func _on_left_pressed():
	Input.action_press("right") # replace with function body


func _on_left_released():
	Input.action_release("right") # replace with function body


func _on_up_pressed():
	Input.action_press("up") # replace with function body


func _on_up_released():
	Input.action_release("up") # replace with function body


func _on_down_pressed():
	Input.action_press("down") # replace with function body


func _on_down_released():
	Input.action_release("down") # replace with function body
