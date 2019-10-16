global.playerControl = false;

with scr_createSubmenu(500){
	var
	SV_i = 0,
	SV_lst = ds_list_create();
	
	ds_grid_resize(grd_txt,1,1);
	scr_menu_matchGrids(id,true);
	
	for(SV_i = 0;SV_i < ds_grid_height(global.grd_socials);SV_i++){
	    var
	    SV_key = SOC_FG_STATUS + global.grd_socials[# 0,SV_i],
	    SV_map = global.grd_socials[# 1,SV_i];
	    
	    if(global.map_flags[? SV_key] == 1){
	        ds_list_insert(SV_lst,0,SV_map);
	    }else if(global.map_flags[? SV_key] == 2 || DEBUG){
	        ds_list_add(SV_lst,SV_map);
	    }
	}
	
	for(SV_i = 0;SV_i < ds_list_size(SV_lst);SV_i++){
    	var
    	SV_map = SV_lst[| SV_i],
    	SV_key = SOC_FG_STATUS + SV_map[? SOC_VAR_ID];
    	
    	grd_txt[# 0,SV_i] = (global.map_flags[? SV_key] == 1) ? "[!]" : "";
    	
    	grd_txt[# 0,SV_i] += SV_map[? SOC_VAR_NAME];
    	grd_scr[# 0,SV_i] = scr_menu_social_talk_select;
    	grd_equipSrc[# 0,SV_i] = SV_map;
    	
    	ds_grid_resize(grd_txt,1,ds_grid_height(grd_txt) + 1);
	    scr_menu_matchGrids(id,false);
	}
	
	grd_txt[# 0,SV_i] = "Return";
	grd_scr[# 0,SV_i] = back_function;
	
	scr_cEvent_id(id,EVENT_MENU_RESIZEPANEL);
}