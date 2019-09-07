/// @description Custom events

switch cEvent{
    case MHE_INIT:
        with obj_handler_dungeon{
            var
            _i = 1,
            _area = global.lst_simAreas[| global.simArea],
            _bg;
            
            switch _area{
            	#region //tunnels
	            	case SIM_TUNNELS:
	            		_bg = bg_underground;
	            	
			            ds_grid_resize(grd_mobPool,5,ds_grid_height(grd_mobPool));
						
						grd_mobPool[# _i,DH_MOB_ID1] = noone;
						grd_mobPool[# _i,DH_MOB_ID2] = CHAR_PARASLIME;
						grd_mobPool[# _i,DH_MOB_ID3] = noone;
						
						_i++;
						
						grd_mobPool[# _i,DH_MOB_ID1] = CHAR_PARASLIME;
						grd_mobPool[# _i,DH_MOB_ID2] = CHAR_PARASLIME;
						grd_mobPool[# _i,DH_MOB_ID3] = noone;
						
						_i++;
						
						grd_mobPool[# _i,DH_MOB_ID1] = noone;
						grd_mobPool[# _i,DH_MOB_ID2] = CHAR_WANDERER;
						grd_mobPool[# _i,DH_MOB_ID3] = noone;
						
						_i++;
						
						grd_mobPool[# _i,DH_MOB_ID1] = noone;
						grd_mobPool[# _i,DH_MOB_ID2] = CHAR_WANDERER;
						grd_mobPool[# _i,DH_MOB_ID3] = CHAR_PARASLIME;
						
						ds_list_add(global.lst_missionLoot_table,
							WTAG_TYPE_HGN,
							WTAG_TYPE_SMG,
							WTAG_TYPE_SLG,
							WTAG_TYPE_LMG,
							WTAG_TYPE_RFL,
							WTAG_TYPE_RPG,
							WTAG_TYPE_SHG
						);
						
						ds_list_add(lst_popcornPool,CHAR_RND_DRONE,CHAR_RND_CONDUIT,CHAR_ARCMINE);
						
						break;
				#endregion
				
				#region //tundra
	            	case SIM_TUNDRA:
	            		_bg = bg_tundra;
	            	
			            ds_grid_resize(grd_mobPool,5,ds_grid_height(grd_mobPool));
						
						grd_mobPool[# _i,DH_MOB_ID1] = noone;
						grd_mobPool[# _i,DH_MOB_ID2] = CHAR_FROSLIME;
						grd_mobPool[# _i,DH_MOB_ID3] = noone;
						
						_i++;
						
						grd_mobPool[# _i,DH_MOB_ID1] = CHAR_FROSLIME;
						grd_mobPool[# _i,DH_MOB_ID2] = CHAR_FROSLIME;
						grd_mobPool[# _i,DH_MOB_ID3] = noone;
						
						_i++;
						
						grd_mobPool[# _i,DH_MOB_ID1] = noone;
						grd_mobPool[# _i,DH_MOB_ID2] = CHAR_WOLFEANT;
						grd_mobPool[# _i,DH_MOB_ID3] = noone;
						
						_i++;
						
						grd_mobPool[# _i,DH_MOB_ID1] = noone;
						grd_mobPool[# _i,DH_MOB_ID2] = CHAR_WOLFEANT;
						grd_mobPool[# _i,DH_MOB_ID3] = CHAR_FROSLIME;
						
						ds_list_add(global.lst_missionLoot_table,
							WTAG_TYPE_DGR,
							WTAG_TYPE_SWD,
							WTAG_TYPE_SCY,
							WTAG_TYPE_AXE,
							WTAG_TYPE_CSW,
							WTAG_TYPE_PAN,
							WTAG_TYPE_GNT
						);
						
						ds_list_add(lst_popcornPool,CHAR_CANDYWING,CHAR_MINISLIME);
						
						break;
				#endregion
				
				#region //forest
	            	default:
	            		_bg = bg_forest;
	            	
			            ds_grid_resize(grd_mobPool,5,ds_grid_height(grd_mobPool));
						
						grd_mobPool[# _i,DH_MOB_ID1] = noone;
						grd_mobPool[# _i,DH_MOB_ID2] = CHAR_SLIME;
						grd_mobPool[# _i,DH_MOB_ID3] = noone;
						
						_i++;
						
						grd_mobPool[# _i,DH_MOB_ID1] = CHAR_SLIME;
						grd_mobPool[# _i,DH_MOB_ID2] = CHAR_SLIME;
						grd_mobPool[# _i,DH_MOB_ID3] = noone;
						
						_i++;
						
						grd_mobPool[# _i,DH_MOB_ID1] = noone;
						grd_mobPool[# _i,DH_MOB_ID2] = CHAR_BLEEDINGBULLET;
						grd_mobPool[# _i,DH_MOB_ID3] = noone;
						
						_i++;
						
						grd_mobPool[# _i,DH_MOB_ID1] = noone;
						grd_mobPool[# _i,DH_MOB_ID2] = CHAR_BLEEDINGBULLET;
						grd_mobPool[# _i,DH_MOB_ID3] = CHAR_SLIME;
						
						ds_list_add(global.lst_missionLoot_table,
							WTAG_TYPE_ASC_ARW,
							WTAG_TYPE_ASC_BRS,
							WTAG_TYPE_ASC_RAY,
							WTAG_TYPE_ASC_VRT,
							WTAG_TYPE_SSC_CURE,
							WTAG_TYPE_SSC_HEAL,
							WTAG_TYPE_SSC_RAISE,
							WTAG_TYPE_SHD_BRN,
							WTAG_TYPE_SHD_FLS,
							WTAG_TYPE_SHD_STC
						);
						
						ds_list_add(lst_popcornPool,CHAR_CANDYWING,CHAR_MINISLIME,CHAR_DARTLILY);
						
						break;
				#endregion
            }
			
			layer_background_sprite(global.ly_bg[0],_bg);
			
			ds_grid_set_region(grd_mobPool,0,DH_MOB_PMIN,ds_grid_width(grd_mobPool) + -1,DH_MOB_PMIN,0);
			ds_grid_set_region(grd_mobPool,0,DH_MOB_PMAX,ds_grid_width(grd_mobPool) + -1,DH_MOB_PMAX,3);
			ds_grid_set_region(grd_mobPool,0,DH_MOB_PLV,ds_grid_width(grd_mobPool) + -1,DH_MOB_PLV,global.simFloor + 1);
			ds_grid_set_region(grd_mobPool,0,DH_MOB_LV1,ds_grid_width(grd_mobPool) + -1,DH_MOB_LV3,(global.simFloor + 1) * 3); //enemy level
        }
    
        break;
    
    case MHE_ETILE + "0":
    case MHE_ETILE + "1":
        var _e = real(string_digits(cEvent));
        
        global.tempInt = _e;
    
        with obj_handler_menuUI{
			visible = false;
			
			if(global.tempInt == 0){
				scr_menu_sim_leaveConfirm();
			}else{
				scr_menu_sim_progressConfirm();
			}
		}
        
        break;
        
    default:
        event_inherited();
        break;
}