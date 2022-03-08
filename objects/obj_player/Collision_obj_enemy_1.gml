/// @description Enemy Damage
// You can write your code in this editor

if canGetHurt {
	canGetHurt = false;
	obj_player.hp -= 15;
	alarm[1] = hit_invincibility_time;
}