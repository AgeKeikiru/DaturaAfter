/// @description Custom events

switch cEvent{
    case MHE_INIT:
        layer_background_sprite(global.ly_bg[0],bg_forest);
        
        with obj_handler_dungeon{
            var _i = 1;
            
            ds_grid_resize(grd_mobPool,4,ds_grid_height(grd_mobPool));
			ds_grid_set_region(grd_mobPool,0,DH_MOB_PMIN,ds_grid_width(grd_mobPool) + -1,DH_MOB_PMIN,1);
			ds_grid_set_region(grd_mobPool,0,DH_MOB_PMAX,ds_grid_width(grd_mobPool) + -1,DH_MOB_PMAX,2);
			ds_grid_set_region(grd_mobPool,0,DH_MOB_PLV,ds_grid_width(grd_mobPool) + -1,DH_MOB_PLV,6);
			ds_grid_set_region(grd_mobPool,0,DH_MOB_LV1,ds_grid_width(grd_mobPool) + -1,DH_MOB_LV3,15); //enemy level
			
			grd_mobPool[# _i,DH_MOB_ID1] = noone;
			grd_mobPool[# _i,DH_MOB_ID2] = CHAR_PARASLIME;
			grd_mobPool[# _i,DH_MOB_ID3] = noone;
			
			_i++;
			
			grd_mobPool[# _i,DH_MOB_ID1] = CHAR_PARASLIME;
			grd_mobPool[# _i,DH_MOB_ID2] = CHAR_PARASLIME;
			grd_mobPool[# _i,DH_MOB_ID3] = noone;
			
			_i++;
			
			grd_mobPool[# _i,DH_MOB_ID1] = noone;
			grd_mobPool[# _i,DH_MOB_ID2] = CHAR_BLEEDINGBULLET;
			grd_mobPool[# _i,DH_MOB_ID3] = noone;
			
			repeat(3){
				ds_list_add(global.lst_missionLoot_table,
					WTAG_TYPE_DGR,
					WTAG_TYPE_HGN
				);
			}
			
			repeat(1){
				ds_list_add(global.lst_missionLoot_table,
					WTAG_TYPE_ASC_BRS,
					WTAG_TYPE_ASC_RAY,
					WTAG_TYPE_ASC_ARW,
					WTAG_TYPE_ASC_VRT,
					WTAG_TYPE_SHD_BRN,
					WTAG_TYPE_SHD_FLS,
					WTAG_TYPE_SHD_STC
				);
			}
			
			ds_list_add(lst_popcornPool,CHAR_CANDYWING,CHAR_DARTLILY,CHAR_MINISLIME);
			
			var
			_x = [0,30,85],
			_y = [13,2,12];
			
			for(var _i = 0;_i < array_length_1d(_x);_i++){
			    global.grd_dMap_terrain[# _x[_i],_y[_i]] = DMAP_TER_LOOT;
			}
        }
    
        break;
    
    case MHE_ETILE + "0":
        var _e = real(string_digits(cEvent));
    
        grd_events[# _e,MHE_VAR_X] = -1;
    
        with obj_handler_dungeon{
            grd_mobPool[# 0,DH_MOB_ID1] = CHAR_WANDERER;
            grd_mobPool[# 0,DH_MOB_ID2] = CHAR_WOLFEANT;
            grd_mobPool[# 0,DH_MOB_ID3] = noone;
            
            grd_mobPool[# 0,DH_MOB_PMIN] = 0;
            grd_mobPool[# 0,DH_MOB_PMAX] = 0;
            
            grd_mobPool[# 0,DH_MOB_LV1] = 20;
            grd_mobPool[# 0,DH_MOB_LV2] = 20;
            grd_mobPool[# 0,DH_MOB_LV3] = 0;
            
            grd_mobPool[# 0,DH_MOB_PLV] = grd_mobPool[# 1,DH_MOB_LV1];
            
            missionComplete = true;
            state_boss = true;
            
            scr_cEvent(EVENT_DND_ENCOUNTER_FIXED);
        }
        
        break;
        
    case EVENT_DND_BATTLEWIN:
        var _mem = global.grd_party_player[# 2,0];
        
        if(scr_exists(_mem) && _mem.hpCurr <= 0){
            with obj_handler_dungeon{
                scr_cEvent(EVENT_DND_BATTLELOSE);
                
                state_event = true;
            }
            
            scr_dia_importJson("msn_vWoods_02","dia_fail");
            instance_create_depth(0,0,0,obj_handler_dialogue);
        }
        
        break;
        
    case EVENT_DND_CLEAR:
        event_inherited();
        
        scr_unlockSocial(SOC_MINA_JOIN);
    
        break;
    
    default:
        event_inherited();
        break;
}