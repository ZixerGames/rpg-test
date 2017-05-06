extends RigidBody

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var rr=0
var sensitivity=10
var maxspeed=5
var speed=0.3
var anim
var direc=Vector3(0,0,0)
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	anim=get_node("AnimationPlayer")
	set_process(true)
	set_fixed_process(true)
	anim.set_blend_time("female3","default",2)
	set_process_input(true)
func _process(delta):
	direc=(get_node("Position3D").get_global_transform().origin-get_global_transform().origin).normalized()
	if Input.is_action_pressed("up") or Input.is_action_pressed("down"):
		
		if not(anim.get_current_animation()=="default"):
			anim.play("default")
			
	else:
		
		anim.play("female3")
	
func _fixed_process(delta):
	
	if Input.is_action_pressed("up"):
		
		if get_linear_velocity().length()<maxspeed:
			apply_impulse(Vector3(0,0,0),speed*direc)
	elif Input.is_action_pressed("down"):
		
		if get_linear_velocity().length()<maxspeed:
			apply_impulse(Vector3(0,0,0),-speed*direc)
	if Input.is_action_pressed("left"):
		rotate_y(deg2rad(-1))
	elif Input.is_action_pressed("right"):
		rotate_y(deg2rad(1))
	rotate_y(rr)
	rr=0
func _input(event):
	if event.type==InputEvent.SCREEN_DRAG:
		rr = deg2rad(event.relative_x/sensitivity)