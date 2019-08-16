var
SV_m = ds_stack_top(global.stk_menu),
SV_map = SV_m.grd_equipSrc[# SV_m.menu_x,SV_m.menu_y],
SV_key = SOC_FG_STATUS + SV_map[? SOC_VAR_ID];

global.map_flags[? SV_key] = 2;
global.currentSocial = SV_map;

scr_menu_back(false,false);

ds_stack_push(global.stk_menuDia,SV_map[? SOC_VAR_DIA]);