/// @description Insert description here
// You can write your code in this editor
//Controls
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_up = keyboard_check(vk_up);
key_down = keyboard_check(vk_down);
key_jump = keyboard_check_pressed(ord("Z"));

if (obj_player.hp < 0 || obj_player.hp == 0) {
	game_restart();
}

//Movement
var _move = key_right - key_left;
hsp = _move * walksp;
vsp = vsp + grv;

//Jump
if ((place_meeting(x,y+1,obj_wall)) && (key_jump))
{
	vsp = -jumpsp;
}

//Run
if (keyboard_check(ord("X"))) {
	walksp += 0.25;
	if (walksp > 10) {
		walksp = 10;
	}
	if ((place_meeting(x,y+1,obj_wall)) && (key_jump)) {
		vsp = -jumpsp * 1.25;
	}
}
else {
	walksp = 5;
}

//Hcollision
if (place_meeting(x+hsp,y,obj_wall))
{
	while (!place_meeting(x+sign(hsp),y,obj_wall))
	{
		x = x + sign(hsp);
	}
	if (key_jump) {
		vsp = -jumpsp;
	}
	hsp = 0;
}
x = x + hsp;

//Vcollision
if (place_meeting(x,y+vsp,obj_wall))
{
	while (!place_meeting(x,y+sign(vsp),obj_wall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

//Animation
if (hsp == 0) {
	image_speed = 1;
	sprite_index = nate_idle_ss;
}
if (hsp < 0) {
	image_xscale = -1;
	sprite_index = nate_run_ss;
}
if (hsp > 0) {
	image_xscale = 1;
	sprite_index = nate_run_ss;
}
if (vsp < 0 || !(place_meeting(x,y+1,obj_wall))) {
	sprite_index = nate_jump_ss;
}

//Shooting
fireDelay = fireDelay - 1;

if (keyboard_check_pressed(ord("X")) && (fireDelay < 0)) {
	//Limit Ammo
	obj_player.waterSupply -= 15;
	if (waterSupply < 0 || waterSupply == 0) {
		
	}
	
	
	
	
	//Shooting Mechanics
	fireDelay = 5;
	with (instance_create_layer(x+64,y,"bullets",obj_bullet)) {
		
		obj_bullet.speed = 25;
		
			if (obj_player.image_xscale == 1) {
				if (obj_player.pwPowerUp == true) {
					obj_bullet.sprite_index = spr_super_R;
					direction = 0;
				}
				else {
					obj_bullet.sprite_index = spr_water_R;
					direction = 0;
				}
			}
			
			if (obj_player.image_xscale == -1) {
			
				if (obj_player.pwPowerUp == true) {
					obj_bullet.sprite_index = spr_super_L;
					direction = 180;
				}
				else {
					obj_bullet.sprite_index = spr_water_L;
					direction = 180;
				}
			}
			image_angle = direction;
			
			
			
	}
	
}	


if (pwPowerUp == true) {
	if (hsp == 0) {
		image_speed = 1;
		sprite_index = nate_idle_pw;
	}
	if (hsp < 0) {
		image_xscale = -1;
		sprite_index = nate_run_pw;
	}
	if (hsp > 0) {
		image_xscale = 1;
		sprite_index = nate_run_pw;
	}
	if (vsp < 0 || !(place_meeting(x,y+1,obj_wall))) {
		sprite_index = nate_jump_pw;
	}
	
	
	
			
	
	
}


