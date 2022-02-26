/// @description Insert description here
// You can write your code in this editor
draw_healthbar(x,8,y,32,obj_player.hp,c_black,c_red,c_lime,0,true,true);
draw_healthbar(x,32,y,64,obj_player.waterSupply,c_black,c_navy,c_aqua,0,true,true);
draw_text(24,64,"SCORE: " + string(points));