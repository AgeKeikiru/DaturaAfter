global.tempBool = true;

with obj_handler_dungeon{
    if(state_event || state_results){
        global.tempBool = false;
    }
}

with obj_handler_menuUI{
    if(CS_UI_PSOPEN){
        global.tempBool = false;
    }
}

specCurr += -global.tempBool;

if(specCurr <= 0){
    specCurr = 999999;
    
    with obj_handler_dungeon{
        scr_cEvent(EVENT_DND_BATTLELOSE);
        
        state_event = true;
    }
    
    scr_dia_build_nLoewi_02_timeUp();
    instance_create_depth(0,0,0,obj_handler_dialogue);
}