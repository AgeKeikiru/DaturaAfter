/*
arg0: social id
*/

var SV_r = ds_map_create();

//general
SV_r[? SOC_VAR_ID] = argument0;
SV_r[? SOC_VAR_NAME] = "???";
SV_r[? SOC_VAR_DIA] = noone;

global.map_flags[? SOC_FG_STATUS + argument0] = DEBUG;

var SV_h = ds_grid_height(global.grd_socials);
ds_grid_resize(global.grd_socials,2,SV_h + 1);
global.grd_socials[# 0,SV_h + -1] = argument0;
global.grd_socials[# 1,SV_h + -1] = SV_r;

return SV_r;