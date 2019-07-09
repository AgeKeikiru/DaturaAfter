
map_results[? MCS_DMG].txt[1] = string(round(map_results[? MCS_DISP_DMG]));

if(map_results[? MCS_DISP_DMG] < map_results[? MCS_TGT_DMG]){
    map_results[? MCS_DISP_DMG] += map_results[? MCS_TGT_DMG] / 40;
    
    timeline_position += -1;
    scr_playSfx(sfx_tick2);
}else{
    map_results[? MCS_DISP_DMG] = map_results[? MCS_TGT_DMG];
    map_results[? MCS_ICON_DMG] = instance_create_depth(MCS_ALIGNX + 420,MCS_STARTY + (MCS_GAPY * 1),0,obj_fpo_parent);
    
    var
    SV_rank = 0,
    SV_map = scr_data_getMap(global.grd_missions,global.missionCurr),
    SV_bonus = .25;
    
    map_results[? MCS_ICON_DMG].sprite_index = spr_scoreRankIcon0;
    
    if(missionDmg < SV_map[? MSN_VAR_PAR_DMG_S]){
        map_results[? MCS_ICON_DMG].sprite_index = spr_scoreRankIcon1;
        SV_bonus = .1;
    }
    
    if(missionDmg < mean(SV_map[? MSN_VAR_PAR_DMG_S],SV_map[? MSN_VAR_PAR_DMG_C])){
        map_results[? MCS_ICON_DMG].sprite_index = spr_scoreRankIcon2;
        SV_bonus = 0;
    }
    
    if(missionDmg < SV_map[? MSN_VAR_PAR_DMG_C]){
        map_results[? MCS_ICON_DMG].sprite_index = spr_scoreRankIcon3;
        SV_bonus = -.1;
    }
    
    with map_results[? MCS_ICON_DMG]{
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
        
        alarm[2] = room_speed * .15;
    }
    
    map_results[? MCS_TGT_BONUS] += map_results[? MCS_TGT_GOLD] * SV_bonus;
}