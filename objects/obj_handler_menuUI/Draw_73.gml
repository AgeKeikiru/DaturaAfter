
if(DEBUG){
	var _str = "[stk_menu]\n\tsize: ";
	
	if(variable_global_exists("stk_menu")){
		_str += string(ds_stack_size(global.stk_menu));
	}else{
		_str += "null";
	}
	
	_str += "\nps_baseMenuIndex: " + string(ps_baseMenuIndex);
	
	draw_set_font(ft_menuSub);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	ktk_scr_draw_text_stroke(0,0,_str,c_yellow,c_black,2,10);
}