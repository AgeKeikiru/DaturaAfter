if(file_exists(DATA_FSETTINGS)){
	var
	SV_path = DATA_FSETTINGS,
	SV_f = file_text_open_read(SV_path),
	SV_map = ds_map_create(),
	SV_key = "";
	
	scr_trace("reading " + SV_path);
	ds_map_read(SV_map,base64_decode(file_text_read_string(SV_f)));
	file_text_close(SV_f);
	
	#region //controls
	
		SV_key = DATA_KEYBIND;
		ds_grid_read(global.grd_controls,SV_map[? SV_key]);
		scr_trace("loaded keybinds");
	
	#endregion
	
	#region //settings
	
		var SV_arr = DATA_SETTINGS;
		
		for(var SV_i = 0;SV_i < array_length_1d(SV_arr);SV_i++){
			SV_key = SV_arr[SV_i];
			
			if(ds_map_exists(SV_map,SV_key)){
				variable_global_set(SV_key,SV_map[? SV_key]);
				scr_trace("loaded " + SV_key + ": " + string(SV_map[? SV_key]));
			}
		}
		
	#endregion
	
	ds_map_destroy(SV_map);
}