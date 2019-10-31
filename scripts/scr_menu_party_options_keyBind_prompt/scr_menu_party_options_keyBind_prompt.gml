var
_m = ds_stack_top(global.stk_menu),
_mNew = scr_menu_confirmWindow("message/alert/..","Input new key ...",noone,noone);

global.tempInt = _m.menu_y;
global.tempObj = _m;

with _mNew{
    btn_draw = false;
    rebindMode = true;
    
    grd_txt[# 0,0] = "[waiting]";
}