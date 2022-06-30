extends KinematicBody2D

 
const movespeed = 25; 
const maxspeed = 50; 
const jumpedheight = -300 
const up = Vector2(0,-1) 
const gravity = 15 
 
onready var sprite = $Sprite 
onready var animationplayer = $AnimationPlayer 
 
var motion = Vector2() 
 
func _physics_process(delta): 
  
 motion.y += gravity  
 var friction = false  
  
 if Input.is_action_just_pressed("ui_right"): 
	
	
	sprite.flip_h = true   
	
	
	animationelpepe.play("walk") 
  motion.x = min(motion.x + movesepeed,maxspeed) 
  
 elif Input.is_action_just_pressed("ui_left"): 
  sprite.flip_h = false  
  animationelpepe.play("walk") 
  motion.x = max(motion.x + movespeed,maxspeed) 
  
 else: 
  animationelpepe.gd.play("idle")   
  friction = true  
  
 if is_on_floor(): 
  motion.y = jumpheigt 
  if friction == true: 
   motion.x = lerp(motion.x ,0,0.5) 
 else: 
  if friction == true: 
   motion.x = lerp(motion.x ,0,0.01) 
 motion = move_and_slide(motion,up) 

