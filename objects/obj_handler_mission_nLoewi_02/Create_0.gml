/// @description Insert description here
/*
grd_events (x coord, y coord, shows visible tile marker)
used to keep track of tile-triggered events
*/

event_inherited();

var _map = scr_data_getMap(global.grd_missions,global.missionCurr);

specMax = _map[? MSN_VAR_PAR_TIME_C];
specCurr = specMax;

ds_grid_resize(grd_events,32,3);

var
_x = 2,
_y = 21,
_e = 0;

repeat(4){
    repeat(4){
        grd_events[# _e,MHE_VAR_X] = _x;
        grd_events[# _e,MHE_VAR_Y] = _y;
        grd_events[# _e,MHE_VAR_VIS] = true;
        
        _e++;
        
        grd_events[# _e,MHE_VAR_X] = _x;
        grd_events[# _e,MHE_VAR_Y] = _y + 6;
        grd_events[# _e,MHE_VAR_VIS] = true;
        
        _e++;
        _x += 4;
    }
    
    _x += 4;
}

grd_events[# 3,MHE_VAR_X] = -1;

map_flags[? 0] = 0; //right guesses
map_flags[? 1] = 0; //wrong guesses