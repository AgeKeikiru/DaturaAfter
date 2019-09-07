/// @description Insert description here
/*
arr_events (x coord, y coord, shows visible tile marker)
used to keep track of tile-triggered events
*/

event_inherited();

var _key = SOC_FG_STATUS + SOC_BBULLETTIP;

if(!global.map_flags[? _key]){
	global.map_flags[? _key] = 1;
}

ds_grid_resize(grd_events,25,3);

var
_x = [63,33,11,15],
_y = [11,18,47,26];

for(var _i = 0;_i < array_length_1d(_x);_i++){
    grd_events[# _i,MHE_VAR_X] = _x[_i];
    grd_events[# _i,MHE_VAR_Y] = _y[_i];
    grd_events[# _i,MHE_VAR_VIS] = true;
}

map_flags[? 0] = 0; //mission progress