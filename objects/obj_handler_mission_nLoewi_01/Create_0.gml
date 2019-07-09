/// @description Insert description here
/*
arr_events (x coord, y coord, shows visible tile marker)
used to keep track of tile-triggered events
*/

event_inherited();

ds_grid_resize(grd_events,25,3);
//ds_grid_set_region(grd_events,0,MHE_VAR_X,ds_grid_width(grd_events) + -1,MHE_VAR_X,-1);
//ds_grid_set_region(grd_events,0,MHE_VAR_VIS,ds_grid_width(grd_events) + -1,MHE_VAR_VIS,false);

var
_x = [2,45,12,45],
_y = [3,9,43,45],
_e = 4;

for(var _i = 0;_i < 4;_i++){
    //0-3: paraslime battle
    grd_events[# _i,MHE_VAR_X] = _x[_i];
    grd_events[# _i,MHE_VAR_Y] = _y[_i];
    grd_events[# _i,MHE_VAR_VIS] = true;
    
    //4-19: first encounter dialogue
    grd_events[# _e,MHE_VAR_X] = _x[_i] + 1;
    grd_events[# _e,MHE_VAR_Y] = _y[_i];
    grd_events[# _e,MHE_VAR_VIS] = false;
    
    _e++;
    
    grd_events[# _e,MHE_VAR_X] = _x[_i] + -1;
    grd_events[# _e,MHE_VAR_Y] = _y[_i];
    grd_events[# _e,MHE_VAR_VIS] = false;
    
    _e++;
    
    grd_events[# _e,MHE_VAR_X] = _x[_i];
    grd_events[# _e,MHE_VAR_Y] = _y[_i] + 1;
    grd_events[# _e,MHE_VAR_VIS] = false;
    
    _e++;
    
    grd_events[# _e,MHE_VAR_X] = _x[_i];
    grd_events[# _e,MHE_VAR_Y] = _y[_i] + -1;
    grd_events[# _e,MHE_VAR_VIS] = false;
    
    _e++;
}

repeat(4){
    //20: final encounter dialogue
    grd_events[# _e,MHE_VAR_X] = DEBUG ? 26 : -1;
    grd_events[# _e,MHE_VAR_Y] = DEBUG ? 26 : -1;
    grd_events[# _e,MHE_VAR_VIS] = DEBUG;
    
    _e++;
}

//debug
grd_events[# 24,MHE_VAR_X] = DEBUG ? 25 : -1;
grd_events[# 24,MHE_VAR_Y] = DEBUG ? 24 : -1;
grd_events[# 24,MHE_VAR_VIS] = DEBUG;

map_flags[? 0] = 0; //mission progress