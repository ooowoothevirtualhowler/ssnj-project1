/// @description Insert description here
// You can write your code in this editor
//Controls
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(ord("Z"));
key_run = keyboard_check(ord("C"));
key_shoot = keyboard_check_pressed(ord("X"));
key_restart = keyboard_check_pressed(ord("R"));

if (obj_player.hp < 0 || obj_player.hp == 0 || key_restart) {
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
if (key_run) {
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

if (key_shoot && canFire) {
	//Limit Ammo
	if (waterSupply < 0 || waterSupply == 0) {
		canFire = false;
	} else {
		obj_player.waterSupply -= 15;
		//Shooting Mechanics
		canFire = false;
		alarm[0] = fire_rate;
	
		if (obj_player.pwPowerUp) {
			xOffset = 128
		} else {
			xOffset = 64
		}
	
		if (obj_player.image_xscale == -1)
			xOffset *= -1
	
		with (instance_create_layer(x+xOffset,y,"bullets",obj_bullet)) {
			obj_bullet.speed = 25;
		
				if (obj_player.image_xscale == 1) {
					if (obj_player.pwPowerUp) {
						obj_bullet.sprite_index = spr_super_R;
					}
					else {
						obj_bullet.sprite_index = spr_water_R;
					}
					direction = 0;
				} else {
					if (obj_player.pwPowerUp) {
						obj_bullet.sprite_index = spr_super_L;
					}
					else {
						obj_bullet.sprite_index = spr_water_L;
					}
					direction = 180;
				}
				image_angle = direction;
		}
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