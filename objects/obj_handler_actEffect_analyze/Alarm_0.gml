
event_inherited();

if(scr_exists(src,asset_object)){
    with obj_handler_mission_zDesert_01{
        with obj_handler_dungeon{
            scr_cEvent(EVENT_DND_BATTLELOSE);
            
            state_event = true;
        }
        
        scr_dia_importJson("msn_zDesert_01","dia_caught");
        instance_create_depth(0,0,0,obj_handler_dialogue);
    }
}