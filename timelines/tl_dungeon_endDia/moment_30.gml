
global.playerControl = true;
state_event = false;
battleTrans = 2;

if(endDia_battle){
    endDia_battle = false;
    
    scr_cEvent(id,EVENT_DND_ENCOUNTER_FIXED);
}else if(missionComplete){
    global.playerControl = false;
    state_results = true;
    
    timeline_index = tl_dungeon_missionComplete;
    timeline_position = 0;
    timeline_loop = false;
    timeline_running = true;
}