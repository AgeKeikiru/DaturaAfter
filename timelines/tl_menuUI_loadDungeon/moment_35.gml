//set delete menus
ds_stack_clear(global.stk_menu);

instance_destroy(obj_handler_menu_parent);
instance_destroy(obj_handler_dialogue);

if(global.missionCurr != MSN_SIM){
	global.dMap_xPos = 0;
	global.dMap_yPos = 0;
	
	var
	SV_map = scr_data_getMap(global.grd_missions,global.missionCurr),
	_mspr = SV_map[? MSN_VAR_MAP_SPR], //map sprite
	SV_w = sprite_get_width(_mspr),
	SV_h = sprite_get_height(_mspr);
	
	ds_grid_resize(global.grd_dMap_terrain,SV_w,SV_h);
	ds_grid_set_region(global.grd_dMap_terrain,0,0,SV_w + -1,SV_h + -1,noone);
	
	ds_grid_resize(global.grd_dMap_visible,SV_w,SV_h);
	ds_grid_set_region(global.grd_dMap_visible,0,0,SV_w + -1,SV_h + -1,false);
	
	//set up buffer
	if(surface_exists(global.sfc_temp)){
		surface_free(global.sfc_temp);
	}
	
	global.sfc_temp = surface_create(SV_w,SV_h);
	
	surface_set_target(global.sfc_temp);
	
	draw_sprite(_mspr,0,sprite_get_xoffset(_mspr),sprite_get_yoffset(_mspr));
	
	surface_reset_target();
	
	if(buffer_exists(global.buff_temp)){
		buffer_delete(global.buff_temp);
	}
	
	global.buff_temp = buffer_create(SV_w * SV_h * 4,buffer_fixed,1);
	buffer_get_surface(global.buff_temp,global.sfc_temp,0,0,0);
	
	surface_free(global.sfc_temp);
}else{
	scr_procGenMap();
}

if(!instance_exists(obj_handler_mission_parent)){
	//clear music
	while(ds_list_size(global.lst_bgmStream) > 0){
		audio_destroy_stream(global.lst_bgmStream[| 0]);
		ds_list_delete(global.lst_bgmStream,0);
	}
}