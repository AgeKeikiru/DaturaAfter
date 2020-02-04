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

if(specCurr <= 0 && !obj_handler_dungeon.state_battle){
    specCurr = 999999;
    
    with obj_handler_dungeon{
        missionComplete = true;
    }
}