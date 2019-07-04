///@arg increase

var
SV_m = ds_stack_top(global.stk_menu);

scr_menu_toggleBasic(argument0,"set_atbMod",5,0,100);

SV_m.grd_txt[# SV_m.menu_x,SV_m.menu_y] = scr_stringGapFormat("ATB Slowdown:","<- " + string(global.set_atbMod) + "% ->",25);