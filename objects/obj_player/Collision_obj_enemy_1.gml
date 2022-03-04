/// @description Enemy Damage
// You can write your code in this editor

// TODO: Rework this so you can't stand on top of enemies
// and take no damage
if canGetHurt {
	canGetHurt = false;
	obj_player.hp -= 15;
}

alarm[1] = hit_invincibility_time;