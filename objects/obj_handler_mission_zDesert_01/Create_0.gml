/// @description Insert description here
/*
arr_events (x coord, y coord, shows visible tile marker)
used to keep track of tile-triggered events
*/

event_inherited();

var _map = scr_data_getMap(global.grd_missions,global.missionCurr);

specMax = _map[? MSN_VAR_PAR_TIME_S];
specCurr = specMax;
cArgs = ds_list_create();