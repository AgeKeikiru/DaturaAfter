/// @description Custom events

switch cEvent{
    case MHE_INIT:
        layer_background_sprite(global.ly_bg[0],bg_forest);
        
        with obj_handler_dungeon{
            var _i = 1;
            
            ds_grid_resize(grd_mobPool,4,ds_grid_height(grd_mobPool));
			ds_grid_set_region(grd_mobPool,0,DH_MOB_PMIN,ds_grid_width(grd_mobPool) + -1,DH_MOB_PMIN,0);
			ds_grid_set_region(grd_mobPool,0,DH_MOB_PMAX,ds_grid_width(grd_mobPool) + -1,DH_MOB_PMAX,2);
			ds_grid_set_region(grd_mobPool,0,DH_MOB_PLV,ds_grid_width(grd_mobPool) + -1,DH_MOB_PLV,0);
			ds_grid_set_region(grd_mobPool,0,DH_MOB_LV1,ds_grid_width(grd_mobPool) + -1,DH_MOB_LV3,0);
			
			grd_mobPool[# _i,DH_MOB_ID1] = noone;
			grd_mobPool[# _i,DH_MOB_ID2] = CHAR_SLIME;
			grd_mobPool[# _i,DH_MOB_ID3] = noone;
			
			_i++;
			
			grd_mobPool[# _i,DH_MOB_ID1] = CHAR_SLIME;
			grd_mobPool[# _i,DH_MOB_ID2] = CHAR_SLIME;
			grd_mobPool[# _i,DH_MOB_ID3] = noone;
			
			_i++;
			
			grd_mobPool[# _i,DH_MOB_ID1] = noone;
			grd_mobPool[# _i,DH_MOB_ID2] = CHAR_SLIME;
			grd_mobPool[# _i,DH_MOB_ID3] = CHAR_SLIME;
			
			repeat(2){
				ds_list_add(global.lst_missionLoot_table,
					WTAG_TYPE_DGR,
					WTAG_TYPE_HGN
				);
			}
			
			repeat(1){
				ds_list_add(global.lst_missionLoot_table,
					WTAG_TYPE_PAN,
					WTAG_TYPE_SLG
				);
			}
			
			ds_list_add(lst_popcornPool,CHAR_CANDYWING);
			
			global.grd_dMap_terrain[# 1,6] = DMAP_TER_LOOT;
			global.grd_dMap_terrain[# 45,36] = DMAP_TER_LOOT;
        }
    
        break;
    
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
            grd_mobPool[# 0,DH_MOB_ID1] = CHAR_SLIME;
            grd_mobPool[# 0,DH_MOB_ID2] = CHAR_PARASLIME;
            grd_mobPool[# 0,DH_MOB_ID3] = CHAR_SLIME;
            
            grd_mobPool[# 0,DH_MOB_PMIN] = 0;
            grd_mobPool[# 0,DH_MOB_PMAX] = 0;
            
            grd_mobPool[# 0,DH_MOB_LV1] = 0;
            grd_mobPool[# 0,DH_MOB_LV2] = 0;
            grd_mobPool[# 0,DH_MOB_LV3] = 0;
            
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
            grd_mobPool[# 0,DH_MOB_ID1] = CHAR_PARASLIME;
            grd_mobPool[# 0,DH_MOB_ID2] = CHAR_PARASLIME;
            grd_mobPool[# 0,DH_MOB_ID3] = CHAR_PARASLIME;
            
            grd_mobPool[# 0,DH_MOB_PMIN] = 0;
            grd_mobPool[# 0,DH_MOB_PMIN] = 0;
            
            grd_mobPool[# 0,DH_MOB_LV1] = 0;
            grd_mobPool[# 0,DH_MOB_LV2] = 8;
            grd_mobPool[# 0,DH_MOB_LV3] = 0;
            
            state_event = true;
            state_boss = true;
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