
map_results[? MCS_BONUS].txt[1] = string(round(map_results[? MCS_DISP_BONUS])) + "g";

if(abs(map_results[? MCS_DISP_BONUS]) < abs(map_results[? MCS_TGT_BONUS])){
    map_results[? MCS_DISP_BONUS] += map_results[? MCS_TGT_BONUS] / 40;
    
    timeline_position += -1;
    scr_playSfx(sfx_tick2);
}else{
    map_results[? MCS_DISP_BONUS] = map_results[? MCS_TGT_BONUS];
}