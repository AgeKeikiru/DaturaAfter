/// @description Insert description here
/*
arr_events (x coord, y coord, shows visible tile marker)
used to keep track of tile-triggered events
*/

event_inherited();

ds_grid_resize(grd_events,4,3);

var
_x = [9,96,121,114],
_y = [9,11,8,73];

for(var _i = 0;_i < array_length_1d(_x);_i++){
    grd_events[# _i,MHE_VAR_X] = _x[_i];
    grd_events[# _i,MHE_VAR_Y] = _y[_i];
    grd_events[# _i,MHE_VAR_VIS] = true;
}

map_flags[? 0] = 0; //mission progress