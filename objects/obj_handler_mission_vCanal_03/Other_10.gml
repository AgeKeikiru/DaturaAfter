/// @description Custom events

switch cEvent{
    case MHE_INIT:
        layer_background_sprite(global.ly_bg[0],bg_underground);
        
        with obj_handler_dungeon{
            var _i = 1;
            
            ds_grid_resize(grd_mobPool,2,ds_grid_height(grd_mobPool));
			ds_grid_set_region(grd_mobPool,0,DH_MOB_PMIN,ds_grid_width(grd_mobPool) + -1,DH_MOB_PMIN,0);
			ds_grid_set_region(grd_mobPool,0,DH_MOB_PMAX,ds_grid_width(grd_mobPool) + -1,DH_MOB_PMAX,0);
			ds_grid_set_region(grd_mobPool,0,DH_MOB_PLV,ds_grid_width(grd_mobPool) + -1,DH_MOB_PLV,10);
			ds_grid_set_region(grd_mobPool,0,DH_MOB_LV1,ds_grid_width(grd_mobPool) + -1,DH_MOB_LV3,10); //enemy level
			
			grd_mobPool[# _i,DH_MOB_ID1] = noone;
			grd_mobPool[# _i,DH_MOB_ID2] = CHAR_GLITCH;
			grd_mobPool[# _i,DH_MOB_ID3] = noone;
			
			repeat(2){
				ds_list_add(global.lst_missionLoot_table,
					WTAG_TYPE_DGR,
					WTAG_TYPE_HGN,
					WTAG_TYPE_PAN,
					WTAG_TYPE_SLG,
					WTAG_TYPE_ASC_ARW,
					WTAG_TYPE_SMG,
					WTAG_TYPE_SWD
				);
			}
			
			repeat(1){
				ds_list_add(global.lst_missionLoot_table,
					WTAG_TYPE_SCY,
					WTAG_TYPE_GNT,
					WTAG_TYPE_SSC_CURE,
					WTAG_TYPE_RFL,
					WTAG_TYPE_SHG
				);
			}
			
			ds_list_add(lst_popcornPool,CHAR_GLITCH);
        }
    
        break;
        
    case EVENT_DND_BATTLEWIN:
        with obj_handler_dungeon{
            grd_mobPool[# 0,DH_MOB_ID1] = CHAR_GLITCH;
            grd_mobPool[# 0,DH_MOB_ID2] = CHAR_GLITCH;
            grd_mobPool[# 0,DH_MOB_ID3] = CHAR_GLITCH;
            
            grd_mobPool[# 0,DH_MOB_PMIN] = 10;
            grd_mobPool[# 0,DH_MOB_PMAX] = 10;
            
            grd_mobPool[# 0,DH_MOB_LV1] = 10;
            grd_mobPool[# 0,DH_MOB_LV2] = 10;
            grd_mobPool[# 0,DH_MOB_LV3] = 10;
            
            state_event = true;
            state_boss = true;
            endDia_battle = true;
        }
        
        scr_dia_importJson("msn_vCanal_03","dia_01");
        instance_create_depth(0,0,0,obj_handler_dialogue);
        
        break;
        
    case EVENT_BATTLE_ENEMYKILLED:
        map_flags[? 0] += 1;
        
        if(map_flags[? 0] > 9){
            with obj_handler_dungeon{
                scr_cEvent(EVENT_DND_BATTLELOSE);
                
                state_event = true;
                missionComplete = false;
                missionFailed = false;
            }
            
            scr_dia_importJson("msn_vCanal_03","dia_outro");
            instance_create_depth(0,0,0,obj_handler_dialogue);
        }
        
        break;
        
    case EVENT_DND_CLEAR:
    	event_inherited();
    	
    	scr_unlockMission(MSN_VWOODS_03);
    	
    	break;
    
    default:
        event_inherited();
        break;
}