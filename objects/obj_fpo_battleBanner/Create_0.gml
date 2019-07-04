/// @description Insert description here
// You can write your code in this editor

event_inherited();

layer = global.ly_obj[5];

tgt_yScale = bSize;

image_xscale = room_width;
image_yscale = 0;

//tween_yPos = true;
//y += tgt_yScale / 2;

tween_alpha = true;
tgt_alpha = 1;
image_alpha = 0;

txt[0] = "!!! BATTLE !!!";
txt_ft[0] = ft_menuTitle;
txt_halign[0] = fa_center;
txt_valign[0] = fa_middle;
txt_y[0] = 10;