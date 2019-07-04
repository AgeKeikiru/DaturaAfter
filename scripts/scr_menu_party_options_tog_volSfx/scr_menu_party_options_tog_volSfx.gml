///@arg increase

var
SV_m = ds_stack_top(global.stk_menu);

scr_menu_toggleBasic(argument0,"set_volSfx",5,0,100);

SV_m.grd_txt[# SV_m.menu_x,SV_m.menu_y] = scr_stringGapFormat("SFX Volume:","<- " + string(global.set_volSfx) + "% ->",25);