
switch(cEvent){
    #region //dnd_clear
        case EVENT_DND_CLEAR:
            scr_trace("Quest condition: mission clear");
            global.map_flags[? Q_TEST + "0"] = 1;
        
            break;
    #endregion
    
    #region //quest_reward
        case EVENT_QUEST_REWARD:
            scr_unlockChar(CHAR_ARI);
            
            //set up equipment/class
        
            break;
    #endregion
    
    default:
        event_inherited();
        break;
}