/// @description Custom events

switch cEvent{
    case MHE_INIT:
        layer_background_sprite(global.ly_bg[0],bg_subway);
        
        with obj_handler_dungeon{
            var _i = 1;
            
            ds_grid_resize(grd_mobPool,2,ds_grid_height(grd_mobPool));
			ds_grid_set_region(grd_mobPool,0,3,ds_grid_width(grd_mobPool) + -1,3,0); //min popcorn
			ds_grid_set_region(grd_mobPool,0,4,ds_grid_width(grd_mobPool) + -1,4,4); //max popcorn
			ds_grid_set_region(grd_mobPool,0,5,ds_grid_width(grd_mobPool) + -1,7,0); //enemy level
			
			grd_mobPool[# _i,0] = noone;
			grd_mobPool[# _i,1] = CHAR_CANDYWING;
			grd_mobPool[# _i,2] = noone;
			
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
			
			ds_list_add(lst_popcornPool,CHAR_CANDYWING);
        }
    
        break;
    
    case MHE_ETILE + "5":
    case MHE_ETILE + "16":
    case MHE_ETILE + "17":
    case MHE_ETILE + "20":
    case MHE_ETILE + "30":
        var _e = real(string_digits(cEvent));
        grd_events[# _e,MHE_VAR_X] = -1;
        map_flags[? 0] += 1;
        
        if(map_flags[? 0] >= 5){
            with obj_handler_dungeon{
                missionComplete = true;
            }
        }
    
        with obj_handler_dungeon{
            grd_mobPool[# 0,0] = _e == 30 ? CHAR_NPC_EVOKER : noone;
            grd_mobPool[# 0,1] = (_e == 5 || _e == 16 || _e == 30) ? CHAR_NPC_AGENT : CHAR_NPC_EVOKER;
            grd_mobPool[# 0,2] = noone;
            
            grd_mobPool[# 0,3] = 0;
            grd_mobPool[# 0,4] = 0;
            
            grd_mobPool[# 0,5] = 0;
            grd_mobPool[# 0,6] = 0;
            grd_mobPool[# 0,7] = 0;
        }
        
        if(map_flags[? 0] == 1){
            with obj_handler_dungeon{
                state_event = true;
                endDia_battle = true;
            }
            
            scr_dia_build_nLoewi_02_hit1();
            instance_create_depth(0,0,0,obj_handler_dialogue);
        }else if(map_flags[? 0] == 2){
            with obj_handler_dungeon{
                state_event = true;
                endDia_battle = true;
            }
            
            scr_dia_build_nLoewi_02_hit2();
            instance_create_depth(0,0,0,obj_handler_dialogue);
        }else{
            with obj_handler_dungeon{
                scr_cEvent(id,EVENT_DND_ENCOUNTER_FIXED);
            }
        }
    
        break;
        
    case MHE_ETILE + "0":
    case MHE_ETILE + "9":
    case MHE_ETILE + "15":
        var _e = real(string_digits(cEvent));
        grd_events[# _e,MHE_VAR_X] = -1;
        
        with obj_handler_dungeon{
            state_event = true;
        }
        
        scr_dia_build_nLoewi_02_loot();
        instance_create_depth(0,0,0,obj_handler_dialogue);
    
        break;
        
    default:
        if(string_pos(MHE_ETILE,cEvent)){
            var _e = real(string_digits(cEvent));
            grd_events[# _e,MHE_VAR_X] = -1;
            map_flags[? 1] += 1;
            
            if(map_flags[? 1] == 1 && map_flags[? 0 < 2]){
                with obj_handler_dungeon{
                    state_event = true;
                }
                
                scr_dia_build_nLoewi_02_miss1();
                instance_create_depth(0,0,0,obj_handler_dialogue);
            }else if(choose(1,0)){
                with obj_handler_dungeon{
                    grd_mobPool[# 0,0] = CHAR_SLIME;
                    grd_mobPool[# 0,1] = CHAR_SLIME;
                    grd_mobPool[# 0,2] = CHAR_SLIME;
                    
                    grd_mobPool[# 0,3] = 0;
                    grd_mobPool[# 0,4] = 0;
                    
                    grd_mobPool[# 0,5] = 3;
                    grd_mobPool[# 0,6] = 3;
                    grd_mobPool[# 0,7] = 3;
                    
                    scr_cEvent(id,EVENT_DND_ENCOUNTER_FIXED);
                }
            }else{
                with obj_handler_dungeon{
                    state_event = true;
                }
                
                scr_dia_build_nLoewi_02_miss2();
                instance_create_depth(0,0,0,obj_handler_dialogue);
            }
        }else{
            event_inherited();
        }
        
        break;
}