/// @description Draw speaker name

if(txt_name != "" && instance_exists(talkbox)){
	draw_set_font(ft_menuButton);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	var
	_x1 = talkbox.x + 5,
	_x2 = _x1 + string_width(txt_name) + 16,
	_y1 = talkbox.y + -(string_height(txt_name) / 2),
	_y2 = _y1 + string_height(txt_name);
	
	draw_set_color(c_white);
	draw_set_alpha(.8);
	
	draw_rectangle(_x1,_y1,_x2,_y2,false);
	
	ktk_scr_draw_text_shadow_ext(_x1 + 8,_y1 + -1,txt_name,c_dkgray,c_dkgray,1,c_gray,c_gray,1,1,1,1,0);
}

draw_set_color(c_white);
draw_set_alpha(1);