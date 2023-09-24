extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var boomb_scene: PackedScene = preload("res://scenes/projectiles/boomb.tscn")

func _on_player_laser_sig(pos, direction):
#	print('graphic to shoot laser')
	var laser = laser_scene.instantiate() as Area2D
#	add_child(laser)
	laser.position = pos
#	laser.linear_velocity = direction * 100
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	laser.direction = direction
	$Projectiles.add_child(laser)
#	print(Global.global_position)
#	print(laser.position)


func _on_player_bomb_sig(pos, direction):
	var boomb = boomb_scene.instantiate() as RigidBody2D
	boomb.position = pos
	boomb.linear_velocity = direction * boomb.speed
	$Projectiles.add_child(boomb)
