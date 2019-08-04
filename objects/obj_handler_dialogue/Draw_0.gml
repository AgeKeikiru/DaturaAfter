
if(instance_exists(talkbox)){
	var _alpha = talkbox.image_xscale / talkbox.tgt_xScale;
	
	draw_set_alpha(_alpha * .5);
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
	
	if(abs(talkbox.image_xscale + -talkbox.tgt_xScale) < .1){
		var
		_tx = [0,0,0],
		_ty = [0,0,0];
		
		_tx[0] = talkbox.x + 5;
		_tx[1] = _tx[0] + 2;
		_tx[2] = _tx[0] + 345;
		
		_ty[0] = talkbox.y;
		_ty[1] = _ty[0] + -30;
		_ty[2] = _ty[0];
		
		draw_set_color(c_black);
		draw_set_alpha(_alpha * .5);
		
		draw_triangle(_tx[0] + 15,_ty[0] + -1,_tx[1] + 15,_ty[1] + -1,_tx[2] + 15,_ty[2] + -1,false);
		
		draw_set_color(c_white);
		draw_set_alpha(_alpha);
		
		draw_triangle(_tx[0],_ty[0],_tx[1],_ty[1],_tx[2],_ty[2],false);
		
		_tx[0] = talkbox.x;
		_tx[1] = _tx[0] + -15;
		_tx[2] = _tx[0];
		
		_ty[0] = talkbox.y + 5;
		_ty[1] = _ty[0] + ((345 + -4) / 2);
		_ty[2] = _ty[0] + (345 / 2);
		
		draw_triangle(_tx[0],_ty[0],_tx[1],_ty[1],_tx[2],_ty[2],false);
		
		draw_set_font(ft_menuButton);
		draw_set_halign(fa_left);
		draw_set_valign(fa_bottom);
		
		ktk_scr_draw_text_stroke(_tx[0] + 5,_ty[0],txt_name,c_dkgray,c_white,2,10);
		
		draw_set_font(ft_menuSub);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		
		var
		_x = [0,0,0,0],
		_y = [0,0,0,0],
		_str = [
			"[Z]: Next",
			"[X]: Skip",
			"[C]: "
		];
		
		_x[0] = talkbox.x + talkbox.image_xscale + 5;
		_y[0] = talkbox.y + talkbox.image_yscale + -5;
		
		_x[1] = _x[0] + lengthdir_x(string_width(_str[0]) + 10,170);
		_y[1] = _y[0] + lengthdir_y(string_width(_str[0]) + 10,170);
		
		_x[2] = _x[1];
		_y[2] = _y[1] + -(string_height(_str[0]) + 5) * 3;
		
		_x[3] = _x[0];
		_y[3] = _y[0] + -(string_height(_str[0]) + 5) * 3;
		
		draw_set_color(c_black);
		draw_set_alpha(_alpha * .5);
		
		draw_primitive_begin(pr_trianglefan);
		
		for(var _i = 0;_i <= array_length_1d(_x);_i++){
			var _di = _i % array_length_1d(_x);
			
			draw_vertex(_x[_di] + 2,_y[_di] + -2);
		}
		
		draw_primitive_end();
		
		draw_set_color(c_white);
		draw_set_alpha(_alpha);
		
		draw_primitive_begin(pr_trianglefan);
		
		for(var _i = 0;_i <= array_length_1d(_x);_i++){
			var _di = _i % array_length_1d(_x);
			
			draw_vertex(_x[_di],_y[_di]);
		}
		
		draw_primitive_end();
		
		for(var _i = 0;_i < array_length_1d(_str);_i++){
			ktk_scr_draw_text_shadow_ext(_x[2] + 5,_y[2] + 8 + ((string_height(_str[0]) + 3) * _i),_str[_i],c_dkgray,c_dkgray,1,c_ltgray,c_ltgray,1,1,1,1,-10);
		}
	}
}

draw_set_color(c_white);
draw_set_alpha(1);