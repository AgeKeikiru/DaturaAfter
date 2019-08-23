///@arg questID

var
SV_id = argument0,
SV_map = scr_data_getMap(global.grd_quests,SV_id),
SV_lst = SV_map[? Q_VAR_GOALS],
SV_str = SV_map[? Q_VAR_DESC];

for(var SV_i = 0;SV_i < ds_list_size(SV_lst);SV_i++){
    var SV_ss = string(global.map_flags[? SV_id + string(SV_i)]) + "/" + string(SV_lst[| SV_i]);
    
    SV_str = string_replace_all(SV_str,"@" + string(SV_i),SV_ss);
}

return SV_str;