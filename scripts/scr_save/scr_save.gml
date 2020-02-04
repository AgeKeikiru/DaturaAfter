scr_writeLog();

var
SV_map = ds_map_create(),
SV_key = "";

#region //items

    for(var SV_i = 0;SV_i < 8;SV_i++){
        SV_key = DATA_ITEMSET + string(SV_i);
        SV_map[? SV_key] = global.arr_itemSet[SV_i];
        scr_trace("saved arr_itemSet[" + string(SV_i) + "]: " + string(SV_map[? SV_key]));
    }
    
    SV_key = DATA_ITEMHELD;
    SV_map[? SV_key] = ds_map_write(global.map_item_held);
    scr_trace("saved " + SV_key);

#endregion

#region //mats

    SV_key = DATA_MATHELD;
    SV_map[? SV_key] = ds_map_write(global.map_mat_held);
    scr_trace("saved " + SV_key);

#endregion

#region //missions

    for(var SV_i = 0;SV_i < ds_grid_height(global.grd_missions);SV_i++){
        var
        SV_id = global.grd_missions[# 0,SV_i],
        SV_m = global.grd_missions[# 1,SV_i];
        
        SV_key = DATA_MSNID + string(SV_i);
        SV_map[? SV_key] = SV_id;
        
        SV_key = DATA_MSNSTATUS + string(SV_i);
        SV_map[? SV_key] = SV_m[? MSN_VAR_STATUS];
        scr_trace("saved " + SV_id + " status: " + string(SV_map[? SV_key]));
    }

#endregion

#region //party

    for(var SV_i = 0;SV_i < 6;SV_i++){
        var
        SV_x = SV_i % 3,
        SV_y = SV_i > 2,
        SV_c = global.grd_party_player[# SV_x,SV_y],
        SV_val = "";
        
        if(scr_exists(SV_c,asset_object) && ds_exists(SV_c.src,ds_type_map)){
            var SV_yy = ds_grid_value_y(global.grd_chars,0,0,1,ds_grid_height(global.grd_chars) + -1,SV_c.src);
            
            SV_val = global.grd_chars[# 0,SV_yy];
        }
        
        SV_key = DATA_PARTY + string(SV_i);
        SV_map[? SV_key] = SV_val;
        scr_trace("saved grd_party_player[" + string(SV_x) + "," + string(SV_y) + "]: " + SV_map[? SV_key]);
    }

#endregion

#region //cid

    SV_key = DATA_CID;
    SV_map[? SV_key] = global.cid;
    scr_trace("saved cid: " + string(SV_map[? SV_key]));

#endregion

#region //inv_act

	for(var SV_i = 0;SV_i < ds_list_size(global.lst_inv_acts);SV_i++){
		var SV_o = global.lst_inv_acts[| SV_i];
		
		SV_key = DATA_ACTTAG + string(SV_i);
		SV_map[? SV_key] = SV_o.type;
		scr_trace("saved lst_inv_acts[" + string(SV_i) + "] type: " + SV_map[? SV_key]);
		
		SV_key = DATA_ACTRARE + string(SV_i);
		SV_map[? SV_key] = SV_o.rare;
		scr_trace("saved lst_inv_acts[" + string(SV_i) + "] rare: " + string(SV_map[? SV_key]));
		
		SV_key = DATA_ACTPLUS + string(SV_i);
		SV_map[? SV_key] = SV_o.plus;
		scr_trace("saved lst_inv_acts[" + string(SV_i) + "] plus: " + string(SV_map[? SV_key]));
		
		SV_key = DATA_ACTELE + string(SV_i);
		SV_map[? SV_key] = SV_o.ele;
		scr_trace("saved lst_inv_acts[" + string(SV_i) + "] ele: " + string(SV_map[? SV_key]));
	}

#endregion

#region //inv_arm

	for(var SV_i = 0;SV_i < ds_list_size(global.lst_inv_arms);SV_i++){
		var SV_o = global.lst_inv_arms[| SV_i];
		
		SV_key = DATA_ARMTAG + string(SV_i);
		SV_map[? SV_key] = SV_o.type;
		scr_trace("saved lst_inv_arms[" + string(SV_i) + "] type: " + string(SV_map[? SV_key]));
		
		SV_key = DATA_ARMRARE + string(SV_i);
		SV_map[? SV_key] = SV_o.rare;
		scr_trace("saved lst_inv_arms[" + string(SV_i) + "] rare: " + string(SV_map[? SV_key]));
		
		SV_key = DATA_ARMPLUS + string(SV_i);
		SV_map[? SV_key] = SV_o.plus;
		scr_trace("saved lst_inv_arms[" + string(SV_i) + "] plus: " + string(SV_map[? SV_key]));
		
		var SV_lst = ds_list_create();
		
		ds_list_add(SV_lst,SV_o.ele_fir);
		ds_list_add(SV_lst,SV_o.ele_ice);
		ds_list_add(SV_lst,SV_o.ele_nat);
		ds_list_add(SV_lst,SV_o.ele_elc);
		ds_list_add(SV_lst,SV_o.ele_lgt);
		ds_list_add(SV_lst,SV_o.ele_drk);
		
		SV_key = DATA_ARMELE + string(SV_i);
		SV_map[? SV_key] = ds_list_write(SV_lst);
		scr_trace("saved lst_inv_arms[" + string(SV_i) + "] ele");
	}

#endregion

#region //classes

	for(var SV_i = 0;SV_i < ds_list_size(global.lst_inv_classes);SV_i++){
		var SV_o = global.lst_inv_classes[| SV_i];
		
		SV_key = DATA_CLSID + string(SV_i);
		SV_map[? SV_key] = object_get_name(SV_o.object_index);
		scr_trace("saved lst_inv_classes[" + string(SV_i) + "]: " + SV_map[? SV_key]);
		
		SV_key = DATA_CLSLVS + string(SV_i);
		SV_map[? SV_key] = ds_grid_write(SV_o.grd_skills);
		scr_trace("saved lst_inv_classes[" + string(SV_i) + "] skills");
		
		SV_key = DATA_CLSSUB + string(SV_i);
		SV_map[? SV_key] = SV_o.ss_level;
		scr_trace("saved lst_inv_classes[" + string(SV_i) + "] sublevel");
		
		SV_key = DATA_CLSNAME + string(SV_i);
		SV_map[? SV_key] = SV_o.cName;
		scr_trace("saved lst_inv_classes[" + string(SV_i) + "] cName: " + SV_map[? SV_key]);
	}

#endregion

#region //gold

	SV_key = DATA_GOLD;
	SV_map[? SV_key] = global.heldGold;
	scr_trace("saved gold: " + string(SV_map[? SV_key]));

#endregion

#region //flags

	SV_key = DATA_FLAGS;
	SV_map[? SV_key] = ds_map_write(global.map_flags);
	scr_trace("saved flags");

#endregion

#region //chars

    scr_trace("");
    
    for(var _char = 0;_char < en_chars.slime;_char++){
    	var _cm = global.grd_chars[# 1,_char];
    	
    	if(ds_exists(_cm,ds_type_map)){
	    	for(var _i = en_charVar.hb0;_i <= en_charVar.clsU;_i++){
	    		var _inv = global.lst_inv_acts;
	    		
	    		if(_i >= en_charVar.arm0){
	    			_inv = global.lst_inv_arms;
	    		}
	    		
	    		if(_i >= en_charVar.cls0){
	    			_inv = global.lst_inv_classes;
	    		}
	    		
	    		SV_key = _cm[? en_charVar.charID] + string(_i);
	    		
	    		var _o = _cm[? _i];
	    		
	    		if(scr_exists(_o)){
	    			var _pos = ds_list_find_index(_inv,_o);
	    			
	    			SV_map[? SV_key] = _pos >= 0 ? _pos : object_get_name(_o.object_index);
	    			
	    			scr_trace(string(SV_map[? SV_key]));
	    		}
	    		
	    		scr_trace("saved " + SV_key);
	    	}
	    	
	    	scr_trace("");
    	}
    }

#endregion

var SV_path = DATA_FNAME + "SYS";

if(file_exists(SV_path)){
	file_copy(SV_path,SV_path + "b");
	file_delete(SV_path);
}

var SV_f = file_text_open_write(SV_path);

scr_trace("writing to " + SV_path);
file_text_write_string(SV_f,base64_encode(ds_map_write(SV_map)));
file_text_close(SV_f);

SV_path = DATA_FSETTINGS;

if(file_exists(SV_path)){
	file_copy(SV_path,SV_path + "b");
	file_delete(SV_path);
}

ds_map_clear(SV_map);
SV_f = file_text_open_write(SV_path);

#region //controls

	SV_key = DATA_KEYBIND;
	SV_map[? SV_key] = ds_grid_write(global.grd_controls);
	scr_trace("saved keybinds");

#endregion

#region //settings

	var SV_arr = DATA_SETTINGS;
	
	for(var SV_i = 0;SV_i < array_length_1d(SV_arr);SV_i++){
		SV_key = SV_arr[SV_i];
		SV_map[? SV_key] = variable_global_get(SV_key);
		scr_trace("saved " + SV_key + ": " + string(SV_map[? SV_key]));
	}

#endregion

file_text_write_string(SV_f,base64_encode(ds_map_write(SV_map)));
file_text_close(SV_f);

var SV_b = instance_create_depth(0,200,0,obj_fpo_lootBanner);
			
SV_b.txt[0] = "Game Saved";
SV_b.txt_ft[0] = ft_dungeonBold;
SV_b.txt_valign[0] = fa_bottom;
SV_b.txt_x[0] = 10;
SV_b.txt_y[0] = 5;

ds_map_destroy(SV_map);

scr_writeLog();