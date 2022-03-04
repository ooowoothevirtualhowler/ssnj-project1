/// @description Insert description here
// You can write your code in this editor

hsp = dir * movespeed;
vsp += grav;
if (hsp > 0) {
	image_xscale = -1;
}
if (hsp < 0) {
	image_xscale = 1;
}

if (place_meeting(x+hsp,y,obj_wall) || place_meeting(x+hsp,y,obj_blocker)) {
	while (!place_meeting(x+sign(hsp),y,obj_wall) && !place_meeting(x,y+sign(vsp),obj_blocker)) {
		x = x + sign(hsp);
	}
	hsp = 0;
	dir *= -1;
}
x = x + hsp;


//Vertical
if (place_meeting(x,y+vsp,obj_wall) || place_meeting(x,y+vsp,obj_blocker)) {
	while (!place_meeting(x,y+sign(vsp),obj_wall) && !place_meeting(x,y+sign(vsp),obj_blocker)) {
		y = y + sign(vsp);
	}
	vsp = 0;
}

y = y + vsp;
if (vsp < 0 || (!(place_meeting(x,y+1,obj_wall) || !(place_meeting(x,y+1,obj_blocker))))) {
	sprite_index = enemy_1_jump;
	
}
if (vsp > 0 && sprite_index == enemy_1_jump) {
		sprite_index = enemy_1;
}