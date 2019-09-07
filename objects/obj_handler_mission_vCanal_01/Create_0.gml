/// @description Insert description here
/*
arr_events (x coord, y coord, shows visible tile marker)
used to keep track of tile-triggered events
*/

event_inherited();

var _arr = [
	SOC_FG_STATUS + SOC_SKNIGHT,
	SOC_FG_STATUS + SOC_WANDERERTIP
];

for(var _i = 0;_i < array_length_1d(_arr);_i++){
	var _key = _arr[_i];
	
	if(!global.map_flags[? _key]){
		global.map_flags[? _key] = 1;
	}
}

ds_grid_resize(grd_events,1,3);

var
_x = [92],
_y = [76];

for(var _i = 0;_i < array_length_1d(_x);_i++){
    grd_events[# _i,MHE_VAR_X] = _x[_i];
    grd_events[# _i,MHE_VAR_Y] = _y[_i];
    grd_events[# _i,MHE_VAR_VIS] = true;
}