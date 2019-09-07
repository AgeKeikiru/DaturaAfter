/// @description Custom events

switch cEvent{
    case MHE_INIT:
        layer_background_sprite(global.ly_bg[0],bg_underground);
        
        with obj_handler_dungeon{
            var _i = 1;
            
            ds_grid_resize(grd_mobPool,5,ds_grid_height(grd_mobPool));
			ds_grid_set_region(grd_mobPool,0,DH_MOB_PMIN,ds_grid_width(grd_mobPool) + -1,DH_MOB_PMIN,1);
			ds_grid_set_region(grd_mobPool,0,DH_MOB_PMAX,ds_grid_width(grd_mobPool) + -1,DH_MOB_PMAX,3);
			ds_grid_set_region(grd_mobPool,0,DH_MOB_PLV,ds_grid_width(grd_mobPool) + -1,DH_MOB_PLV,1);
			ds_grid_set_region(grd_mobPool,0,DH_MOB_LV1,ds_grid_width(grd_mobPool) + -1,DH_MOB_LV3,4); //enemy level
			
			grd_mobPool[# _i,DH_MOB_ID1] = noone;
			grd_mobPool[# _i,DH_MOB_ID2] = CHAR_SLIME;
			grd_mobPool[# _i,DH_MOB_ID3] = noone;
			
			_i++;
			
			grd_mobPool[# _i,DH_MOB_ID1] = CHAR_SLIME;
			grd_mobPool[# _i,DH_MOB_ID2] = CHAR_SLIME;
			grd_mobPool[# _i,DH_MOB_ID3] = noone;
			
			_i++;
			
			grd_mobPool[# _i,DH_MOB_ID1] = noone;
			grd_mobPool[# _i,DH_MOB_ID2] = CHAR_WANDERER;
			grd_mobPool[# _i,DH_MOB_ID3] = noone;
			
			_i++;
			
			grd_mobPool[# _i,DH_MOB_ID1] = noone;
			grd_mobPool[# _i,DH_MOB_ID2] = CHAR_WANDERER;
			grd_mobPool[# _i,DH_MOB_ID3] = CHAR_SLIME;
			
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
					WTAG_TYPE_SCY,
					WTAG_TYPE_GNT,
					WTAG_TYPE_SSC_CURE,
					WTAG_TYPE_RFL,
					WTAG_TYPE_SHG
				);
			}
			
			ds_list_add(lst_popcornPool,CHAR_CANDYWING,CHAR_MINISLIME);
			
			
			var
			_x = [39,87,94,73,90,96],
			_y = [7,17,38,78,96,96];
			
			for(var _i = 0;_i < array_length_1d(_x);_i++){
			    global.grd_dMap_terrain[# _x[_i],_y[_i]] = DMAP_TER_LOOT;
			}
        }
    
        break;
    
    case MHE_ETILE + "0":
        var _e = real(string_digits(cEvent));
    
        grd_events[# _e,MHE_VAR_X] = -1;
    
        with obj_handler_dungeon{
            grd_mobPool[# 0,DH_MOB_ID1] = noone;
            grd_mobPool[# 0,DH_MOB_ID2] = CHAR_WANDERER;
            grd_mobPool[# 0,DH_MOB_ID3] = noone;
            
            grd_mobPool[# 0,DH_MOB_PMIN] = 10;
            grd_mobPool[# 0,DH_MOB_PMAX] = 10;
            
            grd_mobPool[# 0,DH_MOB_LV1] = 0;
            grd_mobPool[# 0,DH_MOB_LV2] = 8;
            grd_mobPool[# 0,DH_MOB_LV3] = 0;
            
            grd_mobPool[# 0,DH_MOB_PLV] = grd_mobPool[# 1,DH_MOB_LV1];
            
            missionComplete = true;
            state_boss = true;
            state_event = true;
            endDia_battle = true;
            
            ds_list_add(lst_popcornPool,CHAR_SLIME,CHAR_SLIME,CHAR_SLIME,CHAR_SLIME,CHAR_WANDERER,CHAR_WANDERER);
        }
        
        scr_dia_build_vCanal_01_cut01();
        instance_create_depth(0,0,0,obj_handler_dialogue);
        
        break;
        
    case EVENT_DND_CLEAR:
    	global.map_flags[? FG_MP1] += 1;
    
    	if(global.map_flags[? FG_MP1] >= 3){
	    	scr_unlockMission(MSN_NLOEWI_02);
	    	scr_unlockMission(MSN_VCANAL_02);
    	}
    	
    	break;
    
    default:
        event_inherited();
        break;
}