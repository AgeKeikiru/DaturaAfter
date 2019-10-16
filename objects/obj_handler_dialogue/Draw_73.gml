
if(scr_exists(talkbox,asset_object)){
	var
	_alpha = max(log_alpha + -0.5,0) / 0.5,
	_x = 180,
	_y = 5,
	_b = 10,
	_col = c_black;
	
	if(log_tgt > 0 && ds_grid_height(log_grd) > 0){
		var
		_sb_w = -4,
		_sb_b = 20,
		_sb_x = room_width + -20,
		_sb_range = ds_grid_height(log_grd),
		_sb_h = room_height + -(_sb_b * 2),
		_sb_y1 = _sb_h * (log_i / _sb_range),
		_sb_y2 = _sb_h * min((log_i + log_page) / _sb_range,1);
		
		draw_set_color(c_black);
		draw_set_alpha(log_alpha * 0.7);
		
		draw_rectangle(0,0,room_width,room_height,false);
		
		draw_set_color(c_white);
		draw_set_alpha(_alpha * 0.1);
		draw_set_font(ft_menuTitle);
		draw_set_halign(fa_right);
		draw_set_valign(fa_top);
		
		draw_text_transformed(20,20 + -(100 * (1 + -_alpha)),"BACKLOG",2,2,90);
		
		draw_set_color(c_dkgray);
		draw_set_alpha(_alpha * 0.3);
		
		draw_rectangle(_sb_x,_sb_b,_sb_x + _sb_w,room_height + -_sb_b,false);
		
		draw_set_color(c_white);
		
		draw_rectangle(_sb_x,_sb_b + _sb_y1,_sb_x + _sb_w,_sb_b + _sb_y2,false);
		
		draw_set_font(ft_menuDesc);
		draw_set_color(c_black);
		
		for(var _i = 0;_i < log_page;_i++){
			var _i2 = log_i + _i;
			
			if(_i2 < ds_grid_height(log_grd)){
				draw_set_alpha(_alpha * 0.5);
				
				draw_rectangle(_x + -_b,_y,_x + talkbox.txt_w[0] + _b,_y + 100 + _b,false);
				
				draw_set_alpha(_alpha);
				draw_set_halign(fa_left);
				
				ktk_scr_draw_text_shadow_ext_w(_x,_y,log_grd[# 1,_i2],c_white,c_white,_alpha,_col,_col,_alpha,2,1,1,0,-1,talkbox.txt_w[0]);
				
				draw_set_halign(fa_right);
				
				var _name = log_grd[# 0,_i2];
				
				if(
					_name != "" &&
					(_i == 0 || _name != log_grd[# 0,_i2 + -1] || true)
				){
					ktk_scr_draw_text_shadow(_x + -15,_y,"[" + _name + "]",c_white,c_gray,1);
				}
			}
			
			_y += 120;
		}
	}
}

draw_set_alpha(1);
draw_set_color(c_white);