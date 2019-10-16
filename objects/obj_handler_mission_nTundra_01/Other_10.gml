/// @description Custom events

switch cEvent{
    case MHE_INIT:
        layer_background_sprite(global.ly_bg[0],bg_tundra);
        
        with obj_handler_dungeon{
            var _i = 1;
            
            ds_grid_resize(grd_mobPool,4,ds_grid_height(grd_mobPool));
			ds_grid_set_region(grd_mobPool,0,DH_MOB_PMIN,ds_grid_width(grd_mobPool) + -1,DH_MOB_PMIN,1);
			ds_grid_set_region(grd_mobPool,0,DH_MOB_PMAX,ds_grid_width(grd_mobPool) + -1,DH_MOB_PMAX,3);
			ds_grid_set_region(grd_mobPool,0,DH_MOB_PLV,ds_grid_width(grd_mobPool) + -1,DH_MOB_PLV,1);
			ds_grid_set_region(grd_mobPool,0,DH_MOB_LV1,ds_grid_width(grd_mobPool) + -1,DH_MOB_LV3,4); //enemy level
			
			grd_mobPool[# _i,DH_MOB_ID1] = noone;
			grd_mobPool[# _i,DH_MOB_ID2] = CHAR_SLIME;
			grd_mobPool[# _i,DH_MOB_ID3] = noone;
			
			_i++;
			
			grd_mobPool[# _i,DH_MOB_ID1] = noone;
			grd_mobPool[# _i,DH_MOB_ID2] = CHAR_FROSLIME;
			grd_mobPool[# _i,DH_MOB_ID3] = noone;
			
			_i++;
			
			grd_mobPool[# _i,DH_MOB_ID1] = CHAR_SLIME;
			grd_mobPool[# _i,DH_MOB_ID2] = CHAR_FROSLIME;
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
					WTAG_TYPE_AXE,
					WTAG_TYPE_CSW,
					WTAG_TYPE_ASC_BRS,
					WTAG_TYPE_LMG,
					WTAG_TYPE_SHG
				);
			}
			
			ds_list_add(lst_popcornPool,CHAR_ARCMINE);
			
			
			var
			_x = [22,22,37,37],
			_y = [0,1,59,58];
			
			for(var _i = 0;_i < array_length_1d(_x);_i++){
			    global.grd_dMap_terrain[# _x[_i],_y[_i]] = DMAP_TER_LOOT;
			}
        }
    
        break;
    
    case MHE_ETILE + "0":
    case MHE_ETILE + "1":
    case MHE_ETILE + "2":
    case MHE_ETILE + "3":
    case MHE_ETILE + "4":
        var _e = real(string_digits(cEvent));
    
        grd_events[# _e,MHE_VAR_X] = -1;
        
        map_flags[? 0] += 1;
        
        global.tempBool = _e == 4;
        global.tempInt = map_flags[? 0];
    
        with obj_handler_dungeon{
            grd_mobPool[# 0,DH_MOB_ID1] = global.tempBool ? CHAR_WOLFEANT : noone;
            grd_mobPool[# 0,DH_MOB_ID2] = CHAR_WOLFEANT;
            grd_mobPool[# 0,DH_MOB_ID3] = noone;
            
            grd_mobPool[# 0,DH_MOB_PMIN] = 2;
            grd_mobPool[# 0,DH_MOB_PMAX] = 2;
            
            grd_mobPool[# 0,DH_MOB_LV1] = 0;
            grd_mobPool[# 0,DH_MOB_LV2] = 8;
            grd_mobPool[# 0,DH_MOB_LV3] = 0;
            
            if(global.tempInt > 4){
                missionComplete = true;
            }
            
            if(global.tempInt == 1){
                state_event = true;
                endDia_battle = true;
                
                scr_dia_build_nTundra_01_cut01();
                instance_create_depth(0,0,0,obj_handler_dialogue);
            }else{
            	scr_cEvent(EVENT_DND_ENCOUNTER_FIXED);
            }
        }
        
        break;
        
    case EVENT_DND_CLEAR:
    	global.map_flags[? FG_MP1] += 1;
    
    	if(global.map_flags[? FG_MP1] >= 3){
	    	scr_unlockMission(MSN_NLOEWI_02);
	    	scr_unlockMission(MSN_VCANAL_02);
    	}
    	
    	ds_stack_push(global.stk_menuAlert,scr_unlockSim_tundra);
    	
    	break;
    
    default:
        event_inherited();
        break;
}