extends CharacterBody2D


const SPEED = 300.0

var can_shoot: bool = true
var can_grenade: bool = true

signal laser_sig(pos, direction)
signal bomb_sig(pos, direction)

func _ready():
	pass

func _physics_process(_delta):
	
	move()
	
	var player_direction = (get_global_mouse_position() - position).normalized()
	if Input.is_action_pressed("primary key") and can_shoot:
		# update global position when click attack
#		Global.global_position = %Player.position
		can_shoot = false
		$Timer.start()
		
		var mark_point = $MarkerLaserPostion.get_children()
#		print(mark_point)
		var mark_rand = mark_point[randi() % mark_point.size()]
#		print(mark_rand)
#		Global.global_position = mark_rand.global_position
		var pos = mark_rand.global_position
#		print(mark_rand.global_position)
		laser_sig.emit(pos, player_direction)
#		print('shoot')

	if Input.is_action_just_pressed("secondary key") and can_grenade:
		print("Boom")
		can_grenade = false
		$GrenadeTimer.start()
		var pos = $MarkerLaserPostion.get_children()[0].global_position
		bomb_sig.emit(pos, player_direction)
		
		# rotate
		look_at(get_global_mouse_position())
		
	
func move():
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	var direction2 = Input.get_axis("ui_up", "ui_down")
	if direction2:
		velocity.y = direction2 * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()


func _on_timer_timeout():
#	print('_on_timer_timeout')
	can_shoot = true


func _on_grenade_timer_timeout():
	can_grenade = true
	pass # Replace with function body.
