/// @description Draw speaker name

if(instance_exists(talkbox)){
	draw_set_alpha((talkbox.image_xscale / talkbox.tgt_xScale) * .5);
	draw_set_color(c_black);
	
	draw_rectangle(0,0,room_width,room_height,false);
	
	draw_set_alpha(1);
	
	var
	_arr = [noone,noone,noone],
	_rFocus = global.grd_dia[# DIA_FOCUS_R,max(tb_index + -1,0)];
	
	_arr[!_rFocus] = tb_obj_l;
	_arr[_rFocus] = tb_obj_r;
	_arr[2] = talkbox;
	
	for(var _i = 0;_i < array_length_1d(_arr);_i++){
		with _arr[_i]{
			event_perform(ev_draw,0);
		}
	}
	
	if(txt_name != ""){
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
	
	if(abs(talkbox.image_xscale + -talkbox.tgt_xScale) < .1){
		draw_set_font(ft_menuSub);
		draw_set_halign(fa_right);
		
		var
		_str = "[Z]: Next    [X]: Skip",
		_x1 = talkbox.x + talkbox.image_xscale + -5,
		_x2 = _x1 + -string_width(_str) + -12,
		_y1 = talkbox.y + talkbox.image_yscale + -(string_height(_str) / 2),
		_y2 = _y1 + string_height(_str);
		
		draw_set_color(c_black);
		draw_set_alpha(.8);
		
		draw_rectangle(_x1,_y1,_x2,_y2,false);
		
		ktk_scr_draw_text_shadow_ext(_x1 + -8,_y1 + 1,_str,c_white,c_white,1,c_dkgray,c_dkgray,1,1,1,1,0);
	}
}

draw_set_color(c_white);
draw_set_alpha(1);