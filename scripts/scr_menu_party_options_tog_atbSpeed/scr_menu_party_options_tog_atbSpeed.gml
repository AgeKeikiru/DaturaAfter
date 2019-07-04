///@arg increase

var
SV_m = ds_stack_top(global.stk_menu);

scr_menu_toggleBasic(argument0,"set_atbSpeed",5,50,150);

SV_m.grd_txt[# SV_m.menu_x,SV_m.menu_y] = scr_stringGapFormat("ATB Speed:","<- " + string(global.set_atbSpeed) + "% ->",25);