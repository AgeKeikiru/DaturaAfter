if(DEBUG){
	var
	_str = "fpo count: " + string(instance_number(obj_fpo_parent)),
	_dh = instance_find(obj_handler_dungeon,0);
	
	if(scr_exists(_dh,asset_object)){
		_str += "\n\n[dungeon]\nstate_event: " + string(_dh.state_event) +
		"\nstate_battle: " + string(_dh.state_battle) +
		"\nstate_results: " + string(_dh.state_results) +
		"\nmissionComplete: " + string(_dh.missionComplete) +
		"\nmissionFailed: " + string(_dh.missionFailed);
	}
	
	draw_set_font(ft_menuSub);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	ktk_scr_draw_text_stroke(0,0,_str,c_yellow,c_black,2,10);
}