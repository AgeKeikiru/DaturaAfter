/// @description Custom events

switch cEvent{
    case MHE_INIT:
        layer_background_sprite(global.ly_bg[0],bg_desert);
        
        with obj_handler_dungeon{
            var _i = 1;
            
            ds_grid_resize(grd_mobPool,4,ds_grid_height(grd_mobPool));
			ds_grid_set_region(grd_mobPool,0,DH_MOB_PMIN,ds_grid_width(grd_mobPool) + -1,DH_MOB_PMIN,0);
			ds_grid_set_region(grd_mobPool,0,DH_MOB_PMAX,ds_grid_width(grd_mobPool) + -1,DH_MOB_PMAX,2);
			ds_grid_set_region(grd_mobPool,0,DH_MOB_PLV,ds_grid_width(grd_mobPool) + -1,DH_MOB_PLV,4);
			ds_grid_set_region(grd_mobPool,0,DH_MOB_LV1,ds_grid_width(grd_mobPool) + -1,DH_MOB_LV3,8); //enemy level
			
			grd_mobPool[# _i,DH_MOB_ID1] = noone;
			grd_mobPool[# _i,DH_MOB_ID2] = CHAR_RND_CONDUIT;
			grd_mobPool[# _i,DH_MOB_ID3] = noone;
			
			_i++;
			
			grd_mobPool[# _i,DH_MOB_ID1] = CHAR_RND_DRONE;
			grd_mobPool[# _i,DH_MOB_ID2] = CHAR_RND_CONDUIT;
			grd_mobPool[# _i,DH_MOB_ID3] = noone;
			
			_i++;
			
			grd_mobPool[# _i,DH_MOB_ID1] = CHAR_RND_DRONE;
			grd_mobPool[# _i,DH_MOB_ID2] = CHAR_RND_DRONE;
			grd_mobPool[# _i,DH_MOB_ID3] = noone;
			
			repeat(3){
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
					WTAG_TYPE_RFL,
					WTAG_TYPE_SMG,
					WTAG_TYPE_SHG,
					WTAG_TYPE_LMG,
					WTAG_TYPE_RPG
				);
			}
			
			ds_list_add(lst_popcornPool,
				CHAR_ARCMINE,
				CHAR_CAMDRONE
			);
			
			
			var
			_x = [13,38,38],
			_y = [16,14,15];
			
			for(var _i = 0;_i < array_length_1d(_x);_i++){
			    global.grd_dMap_terrain[# _x[_i],_y[_i]] = DMAP_TER_LOOT;
			}
        }
    
        break;
        
    case EVENT_DND_CLEAR:
    	event_inherited();
    	
        var _map = scr_data_getMap(global.grd_missions,MSN_NABTUNDRA_02);
        
        _map[? MSN_VAR_STATUS] = 3;
    	
    	break;
    
    default:
        event_inherited();
        break;
}