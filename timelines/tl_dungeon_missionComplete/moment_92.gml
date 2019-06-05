
map_results[? MCS_EXP].txt[1] = string_format(map_results[? MCS_DISP_EXP],3,2) + "%";

if(map_results[? MCS_DISP_EXP] < map_results[? MCS_TGT_EXP]){
    map_results[? MCS_DISP_EXP] += map_results[? MCS_TGT_EXP] / 40;
    
    timeline_position += -1;
}else{
    map_results[? MCS_DISP_EXP] = map_results[? MCS_TGT_EXP];
    map_results[? MCS_ICON_EXP] = instance_create_depth(MCS_ALIGNX + 420,MCS_STARTY + (MCS_GAPY * 2),0,obj_fpo_parent);
    
    var
    SV_rank = 0,
    SV_map = scr_data_getMap(global.grd_missions,global.missionCurr),
    SV_bonus = .25;
    
    map_results[? MCS_ICON_EXP].sprite_index = spr_scoreRankIcon0;
    
    if(map_results[? MCS_TGT_EXP] < SV_map[? MSN_VAR_PAR_EXPL_S]){
        map_results[? MCS_ICON_EXP].sprite_index = spr_scoreRankIcon1;
        SV_bonus = .1;
    }
    
    if(map_results[? MCS_TGT_EXP] < mean(SV_map[? MSN_VAR_PAR_EXPL_S],SV_map[? MSN_VAR_PAR_EXPL_C])){
        map_results[? MCS_ICON_EXP].sprite_index = spr_scoreRankIcon2;
        SV_bonus = 0;
    }
    
    if(map_results[? MCS_TGT_EXP] < SV_map[? MSN_VAR_PAR_EXPL_C]){
        map_results[? MCS_ICON_EXP].sprite_index = spr_scoreRankIcon3;
        SV_bonus = -.1;
    }
    
    with map_results[? MCS_ICON_EXP]{
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