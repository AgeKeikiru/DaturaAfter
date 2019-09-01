/// @description Custom events

switch cEvent{
    case MHE_INIT:
        layer_background_sprite(global.ly_bg[0],bg_underground);
        
        with obj_handler_dungeon{
            var _i = 1;
            
            ds_grid_resize(grd_mobPool,3,ds_grid_height(grd_mobPool));
			ds_grid_set_region(grd_mobPool,0,DH_MOB_PMIN,ds_grid_width(grd_mobPool) + -1,DH_MOB_PMIN,0);
			ds_grid_set_region(grd_mobPool,0,DH_MOB_PMAX,ds_grid_width(grd_mobPool) + -1,DH_MOB_PMAX,2);
			ds_grid_set_region(grd_mobPool,0,DH_MOB_PLV,ds_grid_width(grd_mobPool) + -1,DH_MOB_PLV,3);
			ds_grid_set_region(grd_mobPool,0,DH_MOB_LV1,ds_grid_width(grd_mobPool) + -1,DH_MOB_LV3,6); //enemy level
			
			grd_mobPool[# _i,DH_MOB_ID1] = noone;
			grd_mobPool[# _i,DH_MOB_ID2] = CHAR_RND_DRONE;
			grd_mobPool[# _i,DH_MOB_ID3] = noone;
			
			_i++;
			
			grd_mobPool[# _i,DH_MOB_ID1] = CHAR_RND_CONDUIT;
			grd_mobPool[# _i,DH_MOB_ID2] = CHAR_RND_DRONE;
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
			
			ds_list_add(lst_popcornPool,CHAR_PARASLIME,CHAR_ARCMINE);
			
			
			var
			_x = [34,39,88],
			_y = [40,40,82];
			
			for(var _i = 0;_i < array_length_1d(_x);_i++){
			    global.grd_dMap_terrain[# _x[_i],_y[_i]] = DMAP_TER_LOOT;
			}
        }
    
        break;
    
    case MHE_ETILE + "0":
        var _e = real(string_digits(cEvent));
    
        grd_events[# _e,MHE_VAR_X] = -1;
    
        with obj_handler_dungeon{
            grd_mobPool[# 0,DH_MOB_ID1] = CHAR_LICONDUIT;
            grd_mobPool[# 0,DH_MOB_ID2] = CHAR_RND_DRONE;
            grd_mobPool[# 0,DH_MOB_ID3] = CHAR_LICONDUIT;
            
            grd_mobPool[# 0,DH_MOB_PMIN] = 3;
            grd_mobPool[# 0,DH_MOB_PMAX] = 3;
            
            grd_mobPool[# 0,DH_MOB_LV1] = 6;
            grd_mobPool[# 0,DH_MOB_LV2] = 8;
            grd_mobPool[# 0,DH_MOB_LV3] = 6;
            
            grd_mobPool[# 0,DH_MOB_PLV] = grd_mobPool[# 1,DH_MOB_LV1];
            
            missionComplete = true;
            state_boss = true;
            
            ds_list_clear(lst_popcornPool);
            ds_list_add(lst_popcornPool,CHAR_RND_DRONE);
            
            scr_cEvent(id,EVENT_DND_ENCOUNTER_FIXED);
        }
        
        break;
        
    default:
        event_inherited();
        break;
}