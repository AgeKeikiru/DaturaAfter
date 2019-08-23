var SV_m = ds_stack_top(global.stk_menu);

with SV_m{
    var
    SV_i = 0,
    SV_lst = ds_list_create();
    
    ds_grid_resize(grd_txt,1,1);
    scr_menu_matchGrids(id,true);
	
	for(SV_i = 0;SV_i < ds_grid_height(global.grd_quests);SV_i++){
	    var
	    SV_id = global.grd_quests[# 0,SV_i],
	    SV_key = Q_FG_STATUS + SV_id,
	    SV_map = global.grd_quests[# 1,SV_i],
	    SV_goals = SV_map[? Q_VAR_GOALS];
	    
	    if(global.map_flags[? SV_key] == 1){
    	    global.tempBool = true;
    	    
    	    for(var SV_i2 = 0;SV_i2 < ds_list_size(SV_goals);SV_i2++){
    	        if(global.map_flags[? SV_id + string(SV_i2)] < SV_goals[| SV_i2]){
    	            global.tempBool = false;
    	        }
    	    }
    	    
    	    if(global.tempBool){
    	        global.map_flags[? SV_key] = 2;
    	    }else{
    	        ds_list_add(SV_lst,SV_map);
    	    }
	    }
	    
	    if(global.map_flags[? SV_key] == 2){
    	    ds_list_insert(SV_lst,0,SV_map);
	    }
	}
	
	for(SV_i = 0;SV_i < ds_list_size(SV_lst);SV_i++){
    	var
    	SV_map = SV_lst[| SV_i],
    	SV_id = SV_map[? Q_VAR_ID];
    	
    	grd_txt[# 0,SV_i] = SV_map[? Q_VAR_NAME];
    	grd_desc[# 0,SV_i] = scr_quest_buildDesc(SV_map[? Q_VAR_ID]);
    	grd_scr[# 0,SV_i] = global.map_flags[? Q_FG_STATUS + SV_id] == 2 ? scr_menu_party_quest_clear : noone;
    	grd_equipSrc[# 0,SV_i] = SV_map;
    	
    	ds_grid_resize(grd_txt,1,ds_grid_height(grd_txt) + 1);
	    scr_menu_matchGrids(id,false);
	}
	
	grd_txt[# 0,SV_i] = "Return";
	grd_desc[# 0,SV_i] = "Return to previous menu.";
	grd_scr[# 0,SV_i] = back_function;
	
	scr_cEvent(id,EVENT_MENU_RESIZEPANEL);
}