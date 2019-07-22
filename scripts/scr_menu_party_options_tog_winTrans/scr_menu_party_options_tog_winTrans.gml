///@arg increase

var
SV_m = ds_stack_top(global.stk_menu);

scr_menu_toggleBasic(argument0,"set_winTrans",1,10,100);

SV_m.grd_txt[# SV_m.menu_x,SV_m.menu_y] = scr_stringGapFormat("Window Opac.:","<- " + string(global.set_winTrans) + "% ->",25);