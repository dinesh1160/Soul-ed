extends CharacterBody2D

class_name skeleton
@onready var camera_2d = $Camera2D
@onready var animation_player= $AnimatedSprite2D
@onready var auro = $"../auro"
@onready var point_light_2d = $PointLight2D

const RUN_VELOCITY = 30.0
var gravity = 200
var state_auro: bool = true

func _physics_process(delta):

	if state_auro == false and Gamamanager.being_auro == false:
		if not is_on_floor():
			velocity.y += gravity * delta
		
		if Input.is_action_pressed("left"):
			velocity.x = -RUN_VELOCITY
			animation_player.flip_h = true
			
		elif Input.is_action_pressed("right"):
			velocity.x = RUN_VELOCITY
			animation_player.flip_h = false
		
		elif Input.is_action_just_pressed("release"): #to make it change state
			state_auro = true			
			Gamamanager.being_auro = true
			auro.visible = true
			point_light_2d.energy = 0.1
			Gamamanager.sk_cam.make_current()
		
		else:
			velocity.x = 0
			velocity.y += gravity * delta
	else:
		velocity.y += gravity * delta		
		
	move_and_slide()
	handle_ske_animation()
		
func handle_ske_animation():
	if state_auro== false:
		if velocity.x == 0:
			animation_player.play("idle")
		else:
			animation_player.play("run")
	else:
		animation_player.play("dead")


func _on_click_area_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if Input.is_action_just_pressed('mouse_click') and Gamamanager.being_auro == true:
			Gamamanager.being_auro = false
			state_auro = false
			auro.visible = false
			
			Gamamanager.sk_cam = camera_2d
			Gamamanager.sk_cam.make_current()
			point_light_2d.energy = 1
