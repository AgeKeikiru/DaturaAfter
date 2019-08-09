///@arg w

var
SV_mh = ds_stack_top(global.stk_menu),
SV_x = SV_mh.x + ((SV_mh.btn_w + SV_mh.btn_gapX) * (SV_mh.menu_x + -SV_mh.page_x + 1)) + SV_mh.btn_gapX,
SV_y = min(SV_mh.y + ((SV_mh.btn_h + SV_mh.btn_gapY) * (SV_mh.menu_y + -SV_mh.page_y)),600),
SV_m = scr_createMenuPanel(SV_x,SV_y,argument0,-1,"");

with SV_m{
    submenu = true;
    back_function = scr_menu_backNoRefresh;
}

return SV_m;