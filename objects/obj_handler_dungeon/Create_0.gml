/// @description Insert description here
layer = global.ly_obj[1];

var _map = scr_data_getMap(global.grd_missions,global.missionCurr);

instance_create_depth(0,0,0,_map[? MSN_VAR_HANDLER]);

var _i = 0;

//1st set reserved for fixed battles
grd_mobPool[# _i,0] = CHAR_SLIME;
grd_mobPool[# _i,1] = CHAR_SLIME;
grd_mobPool[# _i,2] = noone;

_i++

grd_mobPool[# _i,0] = CHAR_SLIME;
grd_mobPool[# _i,1] = CHAR_SLIME;
grd_mobPool[# _i,2] = CHAR_SLIME;

alarm[0] = 60;