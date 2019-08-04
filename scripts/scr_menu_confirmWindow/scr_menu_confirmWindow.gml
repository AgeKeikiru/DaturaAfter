///@arg txt_title
///@arg txt_body
///@arg yesScr
///@arg noScr

draw_set_font(ft_menuButton);

//window placement
var
SV_buttonH = 50,
SV_b = 20,
SV_w = clamp(string_width(argument1),250,1000) + (SV_b * 2),
SV_h = max(string_height_ext(argument1,-1,SV_w),20) + (SV_b * 4) + SV_buttonH,
SV_x = (room_width / 2) + -(SV_w / 2),
SV_y = (room_height / 2) + -(SV_h / 2),
SV_m = scr_createMenuPanel(SV_x,SV_y,SV_w,SV_h,argument0);

SV_m.layer = global.ly_obj[4];
SV_m.submenu = true;
SV_m.y += SV_h + -(SV_buttonH / 2) + -(SV_b * 3);
SV_m.btn_w = 90;
SV_m.btn_gapX = 60;
SV_m.alarm[0] = 8;

//buttons
ds_grid_resize(SV_m.grd_txt,1,1);
ds_grid_resize(SV_m.grd_scr,1,1);
SV_m.grd_txt[# 0,0] = "OK";
SV_m.grd_scr[# 0,0] = argument2;

SV_m.back_function = argument2;

if(script_exists(argument3)){
    ds_grid_resize(SV_m.grd_txt,2,1);
    ds_grid_resize(SV_m.grd_scr,2,1);
    SV_m.grd_txt[# 0,0] = "Yes";
    
    SV_m.grd_txt[# 1,0] = "No";
    SV_m.grd_scr[# 1,0] = argument3;
    
    SV_m.back_function = argument3;
}

SV_m.x = (room_width / 2) + -(((SV_m.btn_w * ds_grid_width(SV_m.grd_txt)) + (SV_m.btn_gapX * (ds_grid_width(SV_m.grd_txt) + -1))) / 2);

//text
SV_m.link_panel.txt_ft[1] = ft_menuButton;
SV_m.link_panel.txt_halign[1] = fa_center;
SV_m.link_panel.txt_x[1] = (SV_w / 2) + (SV_b / 2);
SV_m.link_panel.txt_y[1] = SV_b;
SV_m.link_panel.txt_w[1] = SV_w + -(SV_b * 2);
SV_m.link_panel.txt[1] = argument1;

SV_m.link_panel.tweenSpd = 2;

return SV_m;