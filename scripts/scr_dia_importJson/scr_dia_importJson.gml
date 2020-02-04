///@arg fName
///@arg diaKey

ds_grid_destroy(global.grd_dia);

global.grd_dia = ds_grid_create(8,0);

var
_json = scr_jsonLoad(argument0),
_jarr = _json[? argument1];

for(var _step = 0;_step < ds_list_size(_jarr);_step++){
    var
    _i = scr_dia_newStep(),
    _jm = _jarr[| _step],
    _keys = ["focus_switch","charIn_l","charIn_r","name","txt","spr_l","spr_r","focus_l","focus_r","refr_l","refr_r","bg","scr"];
    
    for(var _ki = 0;_ki < array_length_1d(_keys);_ki++){
        var _k = _keys[_ki];
        
        if(ds_map_exists(_jm,_k)){
            var _val = _jm[? _k];
            
            switch _k{
                case "focus_switch":
                    global.grd_dia[# DIA_FOCUS_L,_i] = !global.grd_dia[# DIA_FOCUS_L,_i];
                    global.grd_dia[# DIA_FOCUS_R,_i] = !global.grd_dia[# DIA_FOCUS_R,_i];
                
                    break;
                    
                case "charIn_l":
                    global.grd_dia[# DIA_SPR_L,_i] = (_val == "noone") ? noone : asset_get_index(_val);
                    global.grd_dia[# DIA_FOCUS_L,_i] = true;
                    global.grd_dia[# DIA_FOCUS_R,_i] = false;
                    global.grd_dia[# DIA_REFR_L,_i] = true;
                    
                    break;
                    
                case "charIn_r":
                    global.grd_dia[# DIA_SPR_R,_i] = (_val == "noone") ? noone : asset_get_index(_val);
                    global.grd_dia[# DIA_FOCUS_R,_i] = true;
                    global.grd_dia[# DIA_FOCUS_L,_i] = false;
                    global.grd_dia[# DIA_REFR_R,_i] = true;
                    
                    break;
                    
                case "bg":
                    global.grd_dia[# DIA_BG,_i] = (_val == "noone") ? noone : asset_get_index(_val);
                    break;
                
                case "scr":
                    global.grd_dia[# DIA_SCR,_i] = (_val == "noone") ? noone : asset_get_index(_val);
                    break;
                    
                case "name":
                    global.grd_dia[# DIA_NAME,_i] = _val;
                    break;
                    
                case "txt":
                    global.grd_dia[# DIA_TXT,_i] = _val;
                    break;
                    
                case "spr_l":
                    global.grd_dia[# DIA_SPR_L,_i] = (_val == "noone") ? noone : asset_get_index(_val);
                    break;
                    
                case "spr_r":
                    global.grd_dia[# DIA_SPR_R,_i] = (_val == "noone") ? noone : asset_get_index(_val);
                    break;
                    
                case "focus_l":
                    global.grd_dia[# DIA_FOCUS_L,_i] = _val;
                    break;
                    
                case "focus_r":
                    global.grd_dia[# DIA_FOCUS_R,_i] = _val;
                    break;
                    
                case "refr_l":
                    global.grd_dia[# DIA_REFR_L,_i] = _val;
                    break;
                    
                case "refr_r":
                    global.grd_dia[# DIA_REFR_R,_i] = _val;
                    break;
            }
        }
    }
}

ds_map_destroy(_json);