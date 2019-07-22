event_inherited();

if(drawSelf){
	var
	_ch_len = 6,
	_ch_weight = 2,
	_ch_a = .5,
	_ch_x1 = x,
	_ch_y1 = y,
	_ch_x2 = x + image_xscale + -1,
	_ch_y2 = y + image_yscale + -1;
	
	//draw crosshair corners
	draw_set_color(c_white);
	draw_set_alpha(_ch_a * image_alpha * crosshair_alpha);
	
	draw_rectangle(_ch_x1,_ch_y1,_ch_x2 + 1,_ch_y2 + 1,true);
	
	draw_set_alpha(image_alpha * crosshair_alpha);
	
	//top-left corner (vertical then horizontal)
	draw_line_width(_ch_x1,_ch_y1,_ch_x1,_ch_y1 + _ch_len,_ch_weight);
	draw_line_width(_ch_x1,_ch_y1,_ch_x1 + _ch_len,_ch_y1,_ch_weight);
	
	//bottom-right corner (vertical then horizontal)
	draw_line_width(_ch_x2,_ch_y2,_ch_x2,_ch_y2 + -_ch_len,_ch_weight);
	draw_line_width(_ch_x2,_ch_y2,_ch_x2 + -_ch_len,_ch_y2,_ch_weight);
	
	draw_set_color(c_white);
	draw_set_alpha(1);
}

if(scr_exists(link_img,asset_object)){
	link_img.visible = false;
	
	with link_img{
		event_perform(ev_draw,0);
	}
}