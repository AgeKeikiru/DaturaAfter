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
		scr_trace("loaded lst_inv_acts[" + string(SV_i) + "] ele: " + string(SV_map[? SV_key]));
		
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
		scr_trace("loaded lst_inv_arms[" + string(SV_i) + "] type: " + string(SV_map[? SV_key]));
		
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

    for(var _char = 0;_char < en_chars.slime;_char++){
    	var _cm = global.grd_chars[# 1,_char]; //_cm: char map
    	
    	if(_cm != noone){
	    	for(var _i = en_charVar.clsU;_i >= en_charVar.hb0;_i--){
	    		var _inv = global.lst_inv_acts;
	    		
	    		if(_i >= en_charVar.arm0){
	    			_inv = global.lst_inv_arms;
	    		}
	    		
	    		if(_i >= en_charVar.cls0){
	    			_inv = global.lst_inv_classes;
	    		}
	    		
	    		SV_key = _cm[? en_charVar.charID] + string(_i);
	    		
	    		if(ds_map_exists(SV_map,SV_key)){
	    			var _pos = SV_map[? SV_key];
	    			
	    			scr_trace(string(_pos));
	    			
	    			if(is_real(_pos)){
	        	        _cm[? _i] = _inv[| _pos];
	        	    }else{
	        	        var _o = asset_get_index(_pos);
	        	        scr_trace(_pos);
	        	        scr_trace(object_get_name(_o));
	        	        
	                    for(var _ci = en_charVar.cls0;_ci <= en_charVar.clsU;_ci++){ //_ci: class index
	                        var _c = _cm[? _ci]; //_c: class
	                        
	                        if(scr_exists(_c)){
	                            for(var SV_x = 0;SV_x < ds_grid_width(_c.grd_skillAct);SV_x++){
	                                for(var SV_y = 0;SV_y < ds_grid_height(_c.grd_skillAct);SV_y++){
	                                    var SV_o2 = _c.grd_skillAct[# SV_x,SV_y];
	                                    
	                                    if(scr_exists(SV_o2) && SV_o2.object_index == _o){
	                                        _cm[? _i] = SV_o2;
	                                        scr_trace("HIT");
	                                    }
	                                }
	                            }
	                        }
	        	        }
	        	    }
	    		}else{
	    			_cm[? _i] = noone;
	    		}
	    		
	    		scr_trace("loaded " + SV_key);
	    		scr_trace("");
	    	}
    	}
    	
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

with obj_dungeon_battleMember{
	allyParty = global.grd_party_player;
	enemyParty = global.grd_party_enemy;
}

scr_loadSetting();

scr_menuUI_clearPsElements();
scr_menu_nextMenu();

ds_map_destroy(SV_map);

scr_writeLog();