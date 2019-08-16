///@arg sourceMap
///@arg overwriterMap

var
SV_m1 = argument0,
SV_m2 = argument1,
SV_key = ds_map_find_first(SV_m2);

scr_trace("\n[scr_data_mergeMap]");

while(!is_undefined(SV_key)){
    SV_m1[? SV_key] = SV_m2[? SV_key];
    
    scr_trace(string(SV_key) + " -> " + string(SV_m1[? SV_key]));
    
    SV_key = ds_map_find_next(SV_m2,SV_key);
}

scr_trace("\n");

return SV_m1;