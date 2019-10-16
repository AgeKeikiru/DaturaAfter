scr_writeLog();

var
SV_path = DATA_FNAME + "SYS",
SV_f = file_text_open_read(SV_path),
SV_map = ds_map_create(),
SV_key = "";

scr_trace("reading " + SV_path);
ds_map_read(SV_map,base64_decode(file_text_read_string(SV_f)));
file_text_close(SV_f);

#region //items

    for(var SV_i = 0;SV_i < 8;SV_i++){
        SV_key = DATA_ITEMSET + string(SV_i);
        global.arr_itemSet[SV_i] = SV_map[? SV_key];
        scr_trace("loaded arr_itemSet[" + string(SV_i) + "]: " + string(SV_map[? SV_key]));
    }
    
    SV_key = DATA_ITEMHELD;
    var SV_map2 = ds_map_create();
	ds_map_read(SV_map2,SV_map[? SV_key]);
	
	global.map_item_held = scr_data_mergeMap(global.map_item_held,SV_map2);
    scr_trace("loaded " + SV_key);

#endregion

#region //mats

    SV_key = DATA_MATHELD;
    var SV_map2 = ds_map_create();
	ds_map_read(SV_map2,SV_map[? SV_key]);
	
	global.map_mat_held = scr_data_mergeMap(global.map_mat_held,SV_map2);
    scr_trace("loaded " + SV_key);

#endregion

#region //missions

    var SV_i = 0;
    
    SV_key = DATA_MSNID + string(SV_i);
    
    while(ds_map_exists(SV_map,SV_key)){
        var
        SV_y = ds_grid_value_y(global.grd_missions,0,0,ds_grid_width(global.grd_missions) + -1,ds_grid_height(global.grd_missions) + -1,SV_map[? SV_key]),
        SV_id = global.grd_missions[# 0,SV_y],
        SV_m = global.grd_missions[# 1,SV_y];
        
        SV_key = DATA_MSNSTATUS + string(SV_i);
        SV_m[? MSN_VAR_STATUS] = SV_map[? SV_key];
        scr_trace("loaded " + SV_id + " status: " + string(SV_map[? SV_key]));
        
        SV_key = DATA_MSNID + string(++SV_i);
    }

#endregion

#region //cid

    SV_key = DATA_CID;
    global.cid = SV_map[? SV_key];
    scr_trace("loaded cid: " + string(SV_map[? SV_key]));

#endregion

#region //inv_act

	var SV_i = 0;
	
	SV_key = DATA_ACTTAG + string(SV_i);
	ds_list_clear(global.lst_inv_acts);
	instance_destroy(obj_handler_act);
	instance_destroy(obj_handler_actEffect);
	
	while(ds_map_exists(SV_map,SV_key)){
		var SV_type = SV_map[? SV_key];
		scr_trace("loaded lst_inv_acts[" + string(SV_i) + "] type: " + SV_map[? SV_key]);
		
		SV_key = DATA_ACTRARE + string(SV_i);
		var SV_rare = SV_map[? SV_key];
		scr_trace("loaded lst_inv_acts[" + string(SV_i) + "] rare: " + string(SV_map[? SV_key]));
		
		SV_key = DATA_ACTPLUS + string(SV_i);
		var SV_plus = SV_map[? SV_key];
		scr_trace("loaded lst_inv_acts[" + string(SV_i) + "] plus: " + string(SV_map[? SV_key]));
		
		SV_key = DATA_ACTELE + string(SV_i);
		var SV_ele = SV_map[? SV_key];
		scr_trace("loaded lst_inv_acts[" + string(SV_i) + "] ele: " + SV_map[? SV_key]);
		
		var SV_o = scr_data_act_new(SV_type,SV_ele,SV_rare,SV_plus);
		
		ds_list_add(global.lst_inv_acts,SV_o);
		scr_trace("added " + SV_o.name);
		
		SV_key = DATA_ACTTAG + string(++SV_i);
	}

#endregion

#region //inv_arm

	var SV_i = 0;
	
	SV_key = DATA_ARMTAG + string(SV_i);
	ds_list_clear(global.lst_inv_arms);
	instance_destroy(obj_handler_armor);
	
	while(ds_map_exists(SV_map,SV_key)){
		var SV_type = SV_map[? SV_key];
		scr_trace("loaded lst_inv_arms[" + string(SV_i) + "] type: " + SV_map[? SV_key]);
		
		SV_key = DATA_ARMRARE + string(SV_i);
		var SV_rare = SV_map[? SV_key];
		scr_trace("loaded lst_inv_arms[" + string(SV_i) + "] rare: " + string(SV_map[? SV_key]));
		
		SV_key = DATA_ARMPLUS + string(SV_i);
		var SV_plus = SV_map[? SV_key];
		scr_trace("loaded lst_inv_arms[" + string(SV_i) + "] plus: " + string(SV_map[? SV_key]));
		
		var SV_o = scr_data_armor_new(SV_type,SV_rare,SV_plus);
		
		SV_key = DATA_ARMELE + string(SV_i);
		var SV_lst = ds_list_create();
		
		ds_list_read(SV_lst,SV_map[? SV_key]);
		
		SV_o.ele_fir = SV_lst[| 0];
		SV_o.ele_ice = SV_lst[| 1];
		SV_o.ele_nat = SV_lst[| 2];
		SV_o.ele_elc = SV_lst[| 3];
		SV_o.ele_lgt = SV_lst[| 4];
		SV_o.ele_drk = SV_lst[| 5];
		
		ds_list_add(global.lst_inv_arms,SV_o);
		scr_trace("added " + SV_o.name);
		
		SV_key = DATA_ARMTAG + string(++SV_i);
	}

#endregion

#region //classes

	var SV_i = 0;
	
	SV_key = DATA_CLSID + string(SV_i);
	ds_list_clear(global.lst_inv_classes);
	instance_destroy(obj_handler_class_parent);
	
	while(ds_map_exists(SV_map,SV_key)){
		var SV_o = instance_create_depth(0,0,0,asset_get_index(SV_map[? SV_key]));
		scr_trace("loaded lst_inv_classes[" + string(SV_i) + "]: " + SV_map[? SV_key]);
		
		SV_key = DATA_CLSLVS + string(SV_i);
		ds_grid_read(SV_o.grd_skills,SV_map[? SV_key]);
		scr_trace("loaded lst_inv_classes[" + string(SV_i) + "] skills");
		
		SV_key = DATA_CLSSUB + string(SV_i);
		if(ds_map_exists(SV_map,SV_key)){
			SV_o.ss_level = SV_map[? SV_key];
			scr_trace("loaded lst_inv_classes[" + string(SV_i) + "] sublevel");
		}
		
		SV_key = DATA_CLSNAME + string(SV_i);
		SV_o.cName = SV_map[? SV_key];
		scr_trace("loaded lst_inv_classes[" + string(SV_i) + "] cName: " + SV_map[? SV_key]);
		
		ds_list_add(global.lst_inv_classes,SV_o);
		scr_trace("added " + SV_o.name);
		
		scr_cEvent_id(SV_o,EVENT_CLASS_SKILLREFRESH);
		
		SV_key = DATA_CLSID + string(++SV_i);
	}

#endregion

#region //gold

	SV_key = DATA_GOLD;
	global.heldGold = SV_map[? SV_key];
	scr_trace("loaded gold: " + string(SV_map[? SV_key]));

#endregion

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

#region //flags

	SV_key = DATA_FLAGS;
	var SV_map2 = ds_map_create();
	ds_map_read(SV_map2,SV_map[? SV_key]);
	
	global.map_flags = scr_data_mergeMap(global.map_flags,SV_map2);
	scr_trace("loaded flags");
	
	//create active quest handlers
	instance_destroy(obj_handler_quest_parent);
	
	for(var SV_i = 0;SV_i < ds_grid_height(global.grd_quests);SV_i++){
		var
		SV_map2 = global.grd_quests[# 1,SV_i],
		SV_id = global.grd_quests[# 0,SV_i];
		
		if(global.map_flags[? Q_FG_STATUS + SV_id] == 1){
			instance_create_depth(0,0,0,SV_map2[? Q_VAR_HANDLER]);
		}
	}

#endregion

#region //chars

    var
    SV_arr = [CHAR_IMOLEI,CHAR_AILE,CHAR_PAPRIKA,CHAR_BLAZE,CHAR_ARI,CHAR_JACK];
    
    scr_trace("");
    scr_init_chars();
    
    for(var SV_i = 0;SV_i < array_length_1d(SV_arr);SV_i++){
        SV_key = SV_arr[SV_i];
        
        if(ds_map_exists(SV_map,SV_key)){
	        var
	        SV_cm = scr_data_getMap(global.grd_chars,SV_key),
	        SV_map2 = ds_map_create(),
	        SV_lst = ["char_var_cls","char_var_hb","char_var_arm"],
	        SV_lst2 = [global.lst_inv_classes,global.lst_inv_acts,global.lst_inv_arms];
	        
	        for(var SV_i2 = 0;SV_i2 < array_length_1d(SV_lst);SV_i2++){
	        	var
	        	SV_i3 = 0,
	        	SV_key2 = SV_lst[SV_i2] + string(SV_i3);
	        	
	        	ds_map_clear(SV_map2);
	        	ds_map_read(SV_map2,SV_map[? SV_key]);
	        	
	        	while(ds_map_exists(SV_cm,SV_key2)){
		        	if(ds_map_exists(SV_map2,SV_key2)){
		        	    if(is_real(SV_map2[? SV_key2])){
		        	        SV_cm[? SV_key2] = ds_list_find_value(SV_lst2[SV_i2],SV_map2[? SV_key2]);
		        	    }else{
		        	        var SV_o = asset_get_index(SV_map2[? SV_key2]);
		        	        scr_trace(SV_map2[? SV_key2]);
		        	        scr_trace(object_get_name(SV_o));
		        	        
	                        for(var SV_ci = 0;ds_map_exists(SV_cm,"char_var_cls" + string(SV_ci));SV_ci++){
	                            var SV_c = SV_cm[? "char_var_cls" + string(SV_ci)];
	                            
	                            if(scr_exists(SV_c,asset_object)){
	                                for(var SV_x = 0;SV_x < ds_grid_width(SV_c.grd_skillAct);SV_x++){
	                                    for(var SV_y = 0;SV_y < ds_grid_height(SV_c.grd_skillAct);SV_y++){
	                                        var SV_o2 = SV_c.grd_skillAct[# SV_x,SV_y];
	                                        
	                                        if(scr_exists(SV_o2,asset_object) && SV_o2.object_index == SV_o){
	                                            SV_cm[? SV_key2] = SV_o2;
	                                            scr_trace("HIT");
	                                        }
	                                    }
	                                }
	                            }
		        	        }
		        	    }
		        	    
		        	    scr_trace("subloaded " + SV_key2 + ": " + SV_cm[? SV_key2].name);
		        	}
		        	
		        	SV_key2 = SV_lst[SV_i2] + string(++SV_i3);
	        	}
	        }
        }
        
        scr_trace("loaded " + SV_key);
        scr_trace("");
    }

#endregion

#region //party

    ds_grid_clear(global.grd_party_player,noone);
    
    for(var SV_i = 0;SV_i < 6;SV_i++){
        var
        SV_x = SV_i % 3,
        SV_y = SV_i > 2,
        SV_val = "";
        
        SV_key = DATA_PARTY + string(SV_i);
        SV_val = SV_map[? SV_key];
        
        if(SV_val != ""){
            global.grd_party_player[# SV_x,SV_y] = global.map_chars[? SV_val];
        }
        
        
        scr_trace("loaded grd_party_player[" + string(SV_x) + "," + string(SV_y) + "]: " + SV_map[? SV_key]);
    }

#endregion

scr_menuUI_clearPsElements();
scr_menu_nextMenu();

scr_writeLog();