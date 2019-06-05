/*
arg0: mission id
*/

var SV_r = ds_map_create();

//general
SV_r[? MSN_VAR_ID] = argument0;
SV_r[? MSN_VAR_NAME] = "???";
SV_r[? MSN_VAR_CLIENT] = "Anonymous";
SV_r[? MSN_VAR_REWARD] = 0;

SV_r[? MSN_VAR_DESC_LOC] = "Lost Field";
SV_r[? MSN_VAR_DESC_TGT] = "Unknown";
SV_r[? MSN_VAR_DESC_OBJ] = "Unknown";
SV_r[? MSN_VAR_DESC_SCR] = scr_dia_build_nLoewi_01_brief;

SV_r[? MSN_VAR_MAP_SPR] = spr_map_nLoewi_01;

SV_r[? MSN_VAR_INTRO_DIA] = noone;
SV_r[? MSN_VAR_OUTRO_DIA] = noone;
SV_r[? MSN_VAR_HANDLER] = obj_handler_mission_nLoewi_01;
SV_r[? MSN_VAR_TIMER] = -1;
SV_r[? MSN_VAR_STATUS] = 0;

SV_r[? MSN_VAR_PAR_TIME_S] = 9999999;
SV_r[? MSN_VAR_PAR_TIME_C] = 99999999;
SV_r[? MSN_VAR_PAR_DMG_S] = 1000;
SV_r[? MSN_VAR_PAR_DMG_C] = 0;
SV_r[? MSN_VAR_PAR_EXPL_S] = 90;
SV_r[? MSN_VAR_PAR_EXPL_C] = 50;

var SV_h = ds_grid_height(global.grd_missions);
ds_grid_resize(global.grd_missions,2,SV_h + 1);
global.grd_missions[# 0,SV_h + -1] = argument0;
global.grd_missions[# 1,SV_h + -1] = SV_r;

return SV_r;