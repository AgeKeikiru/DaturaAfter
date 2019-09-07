/// @description Insert description here
/*
arr_events (x coord, y coord, shows visible tile marker)
used to keep track of tile-triggered events
*/

event_inherited();

ds_grid_resize(grd_events,2,3);

var _i = 0;

grd_events[# _i,MHE_VAR_X] = global.dMap_pgmCoords[0];
grd_events[# _i,MHE_VAR_Y] = global.dMap_pgmCoords[1];
grd_events[# _i,MHE_VAR_VIS] = true;

_i++;

grd_events[# _i,MHE_VAR_X] = global.dMap_pgmCoords[2];
grd_events[# _i,MHE_VAR_Y] = global.dMap_pgmCoords[3];
grd_events[# _i,MHE_VAR_VIS] = true;