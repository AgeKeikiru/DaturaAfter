/// @description Custom events

switch cEvent{
    case MHE_INIT:
        layer_background_sprite(global.ly_bg[0],bg_forest);
        
        with obj_handler_dungeon{
            var _i = 1;
            
            ds_grid_resize(grd_mobPool,4,ds_grid_height(grd_mobPool));
			ds_grid_set_region(grd_mobPool,0,3,ds_grid_width(grd_mobPool) + -1,3,0); //min popcorn
			ds_grid_set_region(grd_mobPool,0,4,ds_grid_width(grd_mobPool) + -1,4,3); //max popcorn
			ds_grid_set_region(grd_mobPool,0,5,ds_grid_width(grd_mobPool) + -1,7,2); //enemy level
			
			grd_mobPool[# _i,0] = noone;
			grd_mobPool[# _i,1] = CHAR_SLIME;
			grd_mobPool[# _i,2] = noone;
			
			_i++;
			
			grd_mobPool[# _i,0] = CHAR_SLIME;
			grd_mobPool[# _i,1] = CHAR_SLIME;
			grd_mobPool[# _i,2] = noone;
			
			_i++;
			
			grd_mobPool[# _i,0] = noone;
			grd_mobPool[# _i,1] = CHAR_SLIME;
			grd_mobPool[# _i,2] = CHAR_SLIME;
			
			repeat(3){
				ds_list_add(global.lst_missionLoot_table,
					WTAG_TYPE_DGR,
					WTAG_TYPE_HGN
				);
			}
			
			repeat(1){
				ds_list_add(global.lst_missionLoot_table,
					WTAG_TYPE_PAN,
					WTAG_TYPE_SLG,
					WTAG_TYPE_ASC_ARW,
					WTAG_TYPE_SMG,
					WTAG_TYPE_SWD
				);
			}
			
			ds_list_add(lst_popcornPool,CHAR_CANDYWING,CHAR_DARTLILY,CHAR_DARTLILY);
			
			global.grd_dMap_terrain[# 2,17] = DMAP_TER_LOOT;
			global.grd_dMap_terrain[# 2,18] = DMAP_TER_LOOT;
			global.grd_dMap_terrain[# 2,19] = DMAP_TER_LOOT;
        }
    
        break;
    
    case MHE_ETILE + "0":
    case MHE_ETILE + "1":
    case MHE_ETILE + "2":
    case MHE_ETILE + "3":
        var _e = real(string_digits(cEvent));
    
        grd_events[# _e,MHE_VAR_X] = -1;
        
        map_flags[? 0] += 1;
        
        global.tempInt = _e;
    
        with obj_handler_dungeon{
            switch global.tempInt{
                case 0:
                case 1:
                case 2:
                    grd_mobPool[# 0,0] = CHAR_BLEEDINGBULLET;
                    grd_mobPool[# 0,1] = CHAR_BLEEDINGBULLET;
                    grd_mobPool[# 0,2] = noone;
                    
                    grd_mobPool[# 0,3] = 0;
                    grd_mobPool[# 0,4] = 0;
                    
                    grd_mobPool[# 0,5] = 2;
                    grd_mobPool[# 0,6] = 2;
                    grd_mobPool[# 0,7] = 2;
                
                    break;
                    
                case 3:
                    grd_mobPool[# 0,0] = noone;
                    grd_mobPool[# 0,1] = CHAR_BLEEDINGBULLET;
                    grd_mobPool[# 0,2] = CHAR_BLEEDINGBULLET;
                    
                    grd_mobPool[# 0,3] = 3;
                    grd_mobPool[# 0,4] = 3;
                    
                    grd_mobPool[# 0,5] = 2;
                    grd_mobPool[# 0,6] = 6;
                    grd_mobPool[# 0,7] = 6;
                
                    break;
            }
        }
        
        if(map_flags[? 0] >= 4){
            with obj_handler_dungeon{
                missionComplete = true;
            }
        }
        
        if(map_flags[? 0] == 1){
            with obj_handler_dungeon{
                state_event = true;
                endDia_battle = true;
            }
            
            scr_dia_build_vWoods_01_cut02();
            instance_create_depth(0,0,0,obj_handler_dialogue);
        }else{
            scr_cEvent(obj_handler_dungeon,EVENT_DND_ENCOUNTER_FIXED);
        }
    
        break;
        
    default:
        event_inherited();
        break;
}