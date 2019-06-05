
map_results[? MCS_GOLD].txt[1] = string(round(map_results[? MCS_DISP_GOLD])) + "g";

if(map_results[? MCS_DISP_GOLD] < map_results[? MCS_TGT_GOLD]){
    map_results[? MCS_DISP_GOLD] += map_results[? MCS_TGT_GOLD] / 40;
    
    timeline_position += -1;
}else{
    map_results[? MCS_DISP_GOLD] = map_results[? MCS_TGT_GOLD];
}