extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var lastmpos
var mousesense
var curmpos
var chpos
var sensitivity=10
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	lastmpos=Vector2(0,0)
	mousesense=get_parent().get_parent().get_node("mousesense")
	set_process(true)
	set_process_input(true)
func _fixed_process(delta):
	if OS.get_name()!="Android":
		if lastmpos==Vector2(0,0):
			lastmpos=mousesense.get_local_mouse_pos()
		else:
			curmpos=mousesense.get_local_mouse_pos()
			chpos=curmpos-lastmpos
			lastmpos=curmpos
			get_parent().rotate_y(deg2rad(chpos.x/10))
			rotate_x(deg2rad(chpos.y/10))
			
func _process(delta):
	if OS.get_name()!="Android":
		curmpos=mousesense.get_local_mouse_pos()
		if curmpos.x<0:
			mousesense.warp_mouse(Vector2(mousesense.get_size().x,curmpos.y))
			lastmpos=Vector2(0,0)
		elif curmpos.x>mousesense.get_size().x:
			mousesense.warp_mouse(Vector2(0,curmpos.y))
			lastmpos=Vector2(0,0)
		if curmpos.y<0:
			mousesense.warp_mouse(Vector2(curmpos.x,mousesense.get_size().y))
			lastmpos=Vector2(0,0)
		elif curmpos.y>mousesense.get_size().y:
			mousesense.warp_mouse(Vector2(curmpos.x,0))
			lastmpos=Vector2(0,0)
	
func _input(event):
	if event.type==InputEvent.SCREEN_DRAG:
		rotate_x(deg2rad(event.relative_y/sensitivity))
	