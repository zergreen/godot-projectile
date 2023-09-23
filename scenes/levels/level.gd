extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var boomb_scene: PackedScene = preload("res://scenes/projectiles/boomb.tscn")

func _on_player_laser_sig():
#	print('graphic to shoot laser')
	var laser = laser_scene.instantiate()
#	add_child(laser)
	laser.position = Global.global_position
	$Projectiles.add_child(laser)
	print(Global.global_position)
#	print(laser.position)


func _on_player_bomb_sig():
	var boomb = boomb_scene.instantiate()
	boomb.position = $Player.position
	$Projectiles.add_child(boomb)
