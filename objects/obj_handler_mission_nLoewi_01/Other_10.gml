/// @description Custom events

switch cEvent{
    case MHE_ETILE + "0":
    case MHE_ETILE + "1":
    case MHE_ETILE + "2":
    case MHE_ETILE + "3":
        var _e = real(string_digits(cEvent));
    
        grd_events[# _e,MHE_VAR_X] = -1;
        
        map_flags[? 0] += 1;
        
        if(map_flags[? 0] > 4){
            //move final event tiles around player location
            _e = 20;
            
            grd_events[# _e,MHE_VAR_X] = round(global.dMap_xPos) + 1;
            grd_events[# _e,MHE_VAR_Y] = round(global.dMap_yPos);
            
            _e++;
            
            grd_events[# _e,MHE_VAR_X] = round(global.dMap_xPos) + -1;
            grd_events[# _e,MHE_VAR_Y] = round(global.dMap_yPos);
            
            _e++;
            
            grd_events[# _e,MHE_VAR_X] = round(global.dMap_xPos);
            grd_events[# _e,MHE_VAR_Y] = round(global.dMap_yPos) + 1;
            
            _e++;
            
            grd_events[# _e,MHE_VAR_X] = round(global.dMap_xPos);
            grd_events[# _e,MHE_VAR_Y] = round(global.dMap_yPos) + -1;
        }
    
        with obj_handler_dungeon{
            grd_mobPool[# 0,0] = CHAR_SLIME;
            grd_mobPool[# 0,1] = CHAR_SLIME;
            grd_mobPool[# 0,2] = noone;
            
            scr_cEvent(id,EVENT_DND_ENCOUNTER_FIXED);
        }
    
        break;
        
    case MHE_ETILE + "4":
    case MHE_ETILE + "5":
    case MHE_ETILE + "6":
    case MHE_ETILE + "7":
    case MHE_ETILE + "8":
    case MHE_ETILE + "9":
    case MHE_ETILE + "10":
    case MHE_ETILE + "11":
    case MHE_ETILE + "12":
    case MHE_ETILE + "13":
    case MHE_ETILE + "14":
    case MHE_ETILE + "15":
    case MHE_ETILE + "16":
    case MHE_ETILE + "17":
    case MHE_ETILE + "18":
    case MHE_ETILE + "19":
        if(map_flags[? 0] == 0){
            map_flags[? 0] = 1;
            
            ds_grid_set_region(grd_events,4,MHE_VAR_X,19,MHE_VAR_X,-1);
            
            with obj_handler_dungeon{
                state_event = true;
            }
            
            scr_dia_build_nLoewi_01_cut02();
            
            instance_create_depth(0,0,0,obj_handler_dialogue);
        }
    
        break;
        
    case MHE_ETILE + "20":
    case MHE_ETILE + "21":
    case MHE_ETILE + "22":
    case MHE_ETILE + "23":
        ds_grid_set_region(grd_events,20,MHE_VAR_X,23,MHE_VAR_X,-1);
            
        with obj_handler_dungeon{
            state_event = true;
            missionComplete = true;
            endDia_battle = true;
        }
        
        scr_dia_build_nLoewi_01_cut03();
        
        instance_create_depth(0,0,0,obj_handler_dialogue);
    
        break;
        
    case MHE_ETILE + "24":
        with obj_handler_dungeon{
            missionComplete = true;
        }
    
        break;
        
    default:
        event_inherited();
        break;
}