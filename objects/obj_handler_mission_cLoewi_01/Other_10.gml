/// @description Custom events

switch cEvent{
    case MHE_INIT:
        layer_background_sprite(global.ly_bg[0],bg_underground);
        
        with obj_handler_dungeon{
            var _i = 1;
        
            ds_grid_resize(grd_mobPool,4,ds_grid_height(grd_mobPool));
			ds_grid_set_region(grd_mobPool,0,DH_MOB_PMIN,ds_grid_width(grd_mobPool) + -1,DH_MOB_PMIN,0);
			ds_grid_set_region(grd_mobPool,0,DH_MOB_PMAX,ds_grid_width(grd_mobPool) + -1,DH_MOB_PMAX,3);
			ds_grid_set_region(grd_mobPool,0,DH_MOB_PLV,ds_grid_width(grd_mobPool) + -1,DH_MOB_PLV,10);
			ds_grid_set_region(grd_mobPool,0,DH_MOB_LV1,ds_grid_width(grd_mobPool) + -1,DH_MOB_LV3,10);
			
			grd_mobPool[# _i,DH_MOB_ID1] = CHAR_DARKSLIME;
			grd_mobPool[# _i,DH_MOB_ID2] = CHAR_SLIME;
			grd_mobPool[# _i,DH_MOB_ID3] = CHAR_PARASLIME;
			
			_i++;
			
			grd_mobPool[# _i,DH_MOB_ID1] = CHAR_FROSLIME;
			grd_mobPool[# _i,DH_MOB_ID2] = CHAR_PARASLIME;
			grd_mobPool[# _i,DH_MOB_ID3] = CHAR_BRIGHTSLIME;
			
			_i++;
			
			grd_mobPool[# _i,DH_MOB_ID1] = CHAR_FLAMESLIME;
			grd_mobPool[# _i,DH_MOB_ID2] = CHAR_BRIGHTSLIME;
			grd_mobPool[# _i,DH_MOB_ID3] = CHAR_DARKSLIME;
			
			
			repeat(2){
				ds_list_add(global.lst_missionLoot_table,
					WTAG_TYPE_ASC_ARW,
					WTAG_TYPE_HGN
				);
			}
			
			repeat(1){
				ds_list_add(global.lst_missionLoot_table,
					WTAG_TYPE_ASC_ARW,
					WTAG_TYPE_ASC_BRS,
					WTAG_TYPE_ASC_VRT,
					WTAG_TYPE_ASC_RAY
				);
			}
			
			ds_list_add(lst_popcornPool,
			    CHAR_SLIME,
			    CHAR_PARASLIME,
			    CHAR_FLAMESLIME,
			    CHAR_FROSLIME,
			    CHAR_DARKSLIME,
			    CHAR_BRIGHTSLIME
			);
			
			var
			_x = [1,81,130,102,54,1],
			_y = [7,6,19,73,46,27];
			
			for(var _i = 0;_i < array_length_1d(_x);_i++){
                global.grd_dMap_terrain[# _x[_i],_y[_i]] = DMAP_TER_LOOT;
            }
        }
    
        break;
    
    case MHE_ETILE + "0":
    case MHE_ETILE + "1":
    case MHE_ETILE + "2":
    case MHE_ETILE + "3":
        var _e = real(string_digits(cEvent));
        
        grd_events[# _e,MHE_VAR_X] = -1;
        
        map_flags[? 0] += 1;
        
        global.tempBool = map_flags[? 0] >= 4;
    
        with obj_handler_dungeon{
            grd_mobPool[# 0,DH_MOB_ID1] = noone;
            grd_mobPool[# 0,DH_MOB_ID2] = CHAR_BIGSLIME;
            grd_mobPool[# 0,DH_MOB_ID3] = noone;
            
            grd_mobPool[# 0,DH_MOB_PMIN] = 0;
            grd_mobPool[# 0,DH_MOB_PMAX] = 0;
            
            grd_mobPool[# 0,DH_MOB_LV1] = 10;
            grd_mobPool[# 0,DH_MOB_LV2] = 10;
            grd_mobPool[# 0,DH_MOB_LV3] = 10;
            
            missionComplete = global.tempBool;
            
            scr_cEvent(EVENT_DND_ENCOUNTER_FIXED);
        }
    
        break;
    
    default:
        event_inherited();
        break;
}