var SV_m = ds_stack_top(global.stk_menu);

with SV_m{
    var
	SV_i = 0,
	SV_lst = ds_list_create();
	
	back_function = scr_menu_social_formation_cancel;
	
	page_h = 6;
	
	ds_grid_resize(grd_txt,1,2);
	scr_menu_matchGrids(id,true);
	
	ds_list_add(SV_lst,
	    CHAR_IMOLEI,
	    CHAR_AILE,
	    CHAR_PAPRIKA,
	    CHAR_ARI,
	    CHAR_BLAZE
	);
	
	for(SV_i = ds_list_size(SV_lst) + -1;SV_i >= 0;SV_i--){
	    var SV_key = SV_lst[| SV_i];
	    
	    if(!global.map_flags[? SV_key]){
	        ds_list_delete(SV_lst,SV_i);
	    }
	}
	
	for(SV_i = 0;SV_i < ds_list_size(SV_lst);SV_i++){
    	var
    	SV_id = SV_lst[| SV_i],
    	SV_pos = ds_list_find_index(global.lst_newFormation,SV_id),
    	SV_map = scr_data_getMap(global.grd_chars,SV_id);
    	
    	grd_txt[# 0,SV_i] = "";
    	
    	if(SV_pos >= 0){
    	    grd_txt[# 0,SV_i] = "[" + string(SV_pos) + "]"
    	}
    	
    	grd_txt[# 0,SV_i] += SV_map[? CHAR_VAR_NAMEDISP];
    	grd_scr[# 0,SV_i] = scr_menu_social_formation_select;
    	grd_equipSrc[# 0,SV_i] = SV_map;
    	
    	ds_grid_resize(grd_txt,1,ds_grid_height(grd_txt) + 1);
	    scr_menu_matchGrids(id,false);
	}
	
	grd_txt[# 0,SV_i] = "Clear";
	grd_scr[# 0,SV_i] = scr_menu_social_formation_clear;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = "Confirm";
	grd_scr[# 0,SV_i] = !ds_list_empty(global.lst_newFormation) ? scr_menu_social_formation_confirm : noone;
}