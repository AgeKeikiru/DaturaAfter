///@arg increase

var
SV_m = ds_stack_top(global.stk_menu);

scr_menu_toggleBasic(argument0,"set_txtSpeed",1,1,20);

SV_m.grd_txt[# SV_m.menu_x,SV_m.menu_y] = scr_stringGapFormat("Text Speed:","<- " + string(global.set_txtSpeed) + " ->",25);