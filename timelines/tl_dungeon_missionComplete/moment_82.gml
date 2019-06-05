
globalvar G_dispTime;
G_dispTime = map_results[? MCS_DISP_SPD];

with map_results[? MCS_SPD]{
    var
    SV_timeT = G_dispTime / room_speed,
    SV_timeM = string_format(floor(SV_timeT / 60),2,0),
    SV_timeS = string_format(SV_timeT mod 60,2,2);
    
    txt[1] = string_replace_all(SV_timeM," ","0") + ":" + string_replace_all(SV_timeS," ","0");
}

if(map_results[? MCS_DISP_SPD] < map_results[? MCS_TGT_SPD]){
    map_results[? MCS_DISP_SPD] += map_results[? MCS_TGT_SPD] / 40;
    
    timeline_position += -1;
}else{
    map_results[? MCS_DISP_SPD] = map_results[? MCS_TGT_SPD];
    map_results[? MCS_ICON_SPD] = instance_create_depth(MCS_ALIGNX + 420,MCS_STARTY,0,obj_fpo_parent);
    
    var
    SV_rank = 0,
    SV_map = scr_data_getMap(global.grd_missions,global.missionCurr),
    SV_bonus = .25;
    
    map_results[? MCS_ICON_SPD].sprite_index = spr_scoreRankIcon0;
    
    if(missionTime > SV_map[? MSN_VAR_PAR_TIME_S]){
        map_results[? MCS_ICON_SPD].sprite_index = spr_scoreRankIcon1;
        SV_bonus = .1;
    }
    
    if(missionTime > mean(SV_map[? MSN_VAR_PAR_TIME_S],SV_map[? MSN_VAR_PAR_TIME_C])){
        map_results[? MCS_ICON_SPD].sprite_index = spr_scoreRankIcon2;
        SV_bonus = 0;
    }
    
    if(missionTime > SV_map[? MSN_VAR_PAR_TIME_C]){
        map_results[? MCS_ICON_SPD].sprite_index = spr_scoreRankIcon3;
        SV_bonus = -.1;
    }
    
    with map_results[? MCS_ICON_SPD]{
        layer = global.ly_obj[4];
        image_xscale = 4;
        image_yscale = image_xscale;
        image_alpha = 0;
        
        tween_xScale = true;
        tween_yScale = true;
        tween_alpha = true;
        tweenSpd = 1;
        tweenMax = .3;
        tgtAlpha = 1;
    }
    
    map_results[? MCS_TGT_BONUS] += map_results[? MCS_TGT_GOLD] * SV_bonus;
}