//select mission briefing and build dialogue
if(menu_y < ds_list_size(global.lst_missionIndex)){
    global.missionCurr = global.lst_missionIndex[| menu_y];
    
    var
    SV_map = scr_data_getMap(global.grd_missions,global.missionCurr),
    _jf = SV_map[? MSN_VAR_JSON];
    
    if(ds_exists(global.missionJson,ds_type_map)){
        ds_map_destroy(global.missionJson);
    }
    
    global.missionJson = scr_jsonLoad(_jf);
    
    if(_jf != ""){
        scr_dia_importJson(_jf,MSN_JSON_DIA_BRIEF);
        scr_dia_briefEnd(SV_map);
    }else if(script_exists(SV_map[? MSN_VAR_DESC_SCR])){
        script_execute(SV_map[? MSN_VAR_DESC_SCR]);
    }else{
        return;
    }
    
    with obj_handler_menuUI{
        timeline_index = tl_menu_mission_brief;
        timeline_position = 0;
        timeline_loop = false;
        timeline_running = true;
    }
}