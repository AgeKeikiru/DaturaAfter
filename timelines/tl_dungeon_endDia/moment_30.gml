battleTrans = 2;

if(missionFailed){
    global.playerControl = false;
    state_results = true;
    
    timeline_index = tl_dungeon_missionFailed;
    timeline_position = 0;
    timeline_loop = false;
    timeline_running = true;
}else if(endDia_battle){
    endDia_battle = false;
    state_battle = true;
    
    scr_cEvent(id,EVENT_DND_ENCOUNTER_FIXED);
    
    state_event = false;
}else if(missionComplete){
    global.playerControl = false;
    state_results = true;
    
    timeline_index = tl_dungeon_missionComplete;
    timeline_position = 0;
    timeline_loop = false;
    timeline_running = true;
}else{
    state_event = false;
    global.playerControl = true;
}