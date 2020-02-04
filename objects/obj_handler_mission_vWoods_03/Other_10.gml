/// @description Custom events

switch cEvent{
    case MHE_INIT:
        layer_background_sprite(global.ly_bg[0],bg_forest);
        
        with obj_handler_dungeon{
            var _i = 1;
            
            ds_grid_resize(grd_mobPool,3,ds_grid_height(grd_mobPool));
			ds_grid_set_region(grd_mobPool,0,DH_MOB_PMIN,ds_grid_width(grd_mobPool) + -1,DH_MOB_PMIN,0);
			ds_grid_set_region(grd_mobPool,0,DH_MOB_PMAX,ds_grid_width(grd_mobPool) + -1,DH_MOB_PMAX,3);
			ds_grid_set_region(grd_mobPool,0,DH_MOB_PLV,ds_grid_width(grd_mobPool) + -1,DH_MOB_PLV,30);
			ds_grid_set_region(grd_mobPool,0,DH_MOB_LV1,ds_grid_width(grd_mobPool) + -1,DH_MOB_LV3,30); //enemy level
			
			grd_mobPool[# _i,DH_MOB_ID1] = noone;
			grd_mobPool[# _i,DH_MOB_ID2] = CHAR_GLITCH;
			grd_mobPool[# _i,DH_MOB_ID3] = noone;
			
			_i++;
			
			grd_mobPool[# _i,DH_MOB_ID1] = CHAR_GLITCH;
			grd_mobPool[# _i,DH_MOB_ID2] = CHAR_GLITCH;
			grd_mobPool[# _i,DH_MOB_ID3] = noone;
			
			repeat(3){
				ds_list_add(global.lst_missionLoot_table,
					WTAG_TYPE_DGR,
					WTAG_TYPE_HGN
				);
			}
			
			repeat(1){
				ds_list_add(global.lst_missionLoot_table,
					WTAG_TYPE_SWD,
					WTAG_TYPE_GNT,
					WTAG_TYPE_AXE,
					WTAG_TYPE_RPG,
					WTAG_TYPE_SMG,
					WTAG_TYPE_RFL,
					WTAG_TYPE_CSC
				);
			}
			
			ds_list_add(lst_popcornPool,CHAR_GLITCH);
			
			var
			_x = [3,31,16,56],
			_y = [50,58,41,74];
			
			for(var _i = 0;_i < array_length_1d(_x);_i++){
			    global.grd_dMap_terrain[# _x[_i],_y[_i]] = DMAP_TER_LOOT;
			}
        }
    
        break;
    
    case MHE_ETILE + "0":
    case MHE_ETILE + "1":
        grd_events[# 0,MHE_VAR_X] = -1;
        grd_events[# 1,MHE_VAR_X] = -1;
    
        with obj_handler_dungeon{
            state_event = true;
        }
        
        //remove guests from party if already present
        for(var _ix = 0;_ix < 3;_ix++){
            for(var _iy = 0;_iy < 2;_iy++){
                var _mem = global.grd_party_player[# _ix,_iy];
                
                if(
                    scr_exists(_mem)
                    && (
                        _mem.src == global.grd_chars[# 1,en_chars.blaze] ||
                        _mem.src == global.grd_chars[# 1,en_chars.altai] ||
                        _mem.src == global.grd_chars[# 1,en_chars.witchy]
                    )
                ){
                    global.grd_party_player[# _ix,_iy] = noone;
                }
            }
        }
        
        for(var _i = 0;_i < 3;_i++){
            guest = guestArr[_i];
            
            global.grd_party_player[# _i,1] = guest;
            scr_cEvent_id(guest,EVENT_BATTLM_INIT);
            guest.hpCurr = guest.hpMax;
            guest.enCurr = guest.enMax;
        }
        
        scr_placePlayers();
        
        scr_dia_importJson("msn_vWoods_03","dia_01");
        
        instance_create_depth(0,0,0,obj_handler_dialogue);
        
        break;
        
    case MHE_ETILE + "2":
        var _e = real(string_digits(cEvent));
    
        grd_events[# _e,MHE_VAR_X] = -1;
        
        map_flags[? 0] = 1;
        
        with obj_handler_dungeon{
            grd_mobPool[# 0,DH_MOB_ID1] = noone;
            grd_mobPool[# 0,DH_MOB_ID2] = CHAR_GDRAGON;
            grd_mobPool[# 0,DH_MOB_ID3] = noone;
            
            grd_mobPool[# 0,DH_MOB_PMIN] = 4;
            grd_mobPool[# 0,DH_MOB_PMAX] = 4;
            
            grd_mobPool[# 0,DH_MOB_LV1] = 0;
            grd_mobPool[# 0,DH_MOB_LV2] = 35;
            grd_mobPool[# 0,DH_MOB_LV3] = 0;
            
            state_event = true;
            state_boss = true;
            endDia_battle = true;
            
            /*//debug
            grd_mobPool[# 0,DH_MOB_ID1] = noone;
            grd_mobPool[# 0,DH_MOB_ID2] = CHAR_GDRAGONGLITCH;
            grd_mobPool[# 0,DH_MOB_ID3] = noone;
            
            grd_mobPool[# 0,DH_MOB_PMIN] = 0;
            grd_mobPool[# 0,DH_MOB_PMAX] = 0;
            
            grd_mobPool[# 0,DH_MOB_LV1] = 0;
            grd_mobPool[# 0,DH_MOB_LV2] = 70;
            grd_mobPool[# 0,DH_MOB_LV3] = 0;
            //*/
            
            scr_dia_importJson("msn_vWoods_03","dia_02");
        
        	instance_create_depth(0,0,0,obj_handler_dialogue);
        }
    
        break;
        
    
    case EVENT_DND_BATTLEWIN:
        if(map_flags[? 0] == 1){
            map_flags[? 0] += 1;
            
            with obj_handler_dungeon{
                grd_mobPool[# 0,DH_MOB_ID1] = noone;
	            grd_mobPool[# 0,DH_MOB_ID2] = CHAR_GDRAGONGLITCH;
	            grd_mobPool[# 0,DH_MOB_ID3] = noone;
	            
	            grd_mobPool[# 0,DH_MOB_PMIN] = 0;
	            grd_mobPool[# 0,DH_MOB_PMAX] = 0;
	            
	            grd_mobPool[# 0,DH_MOB_LV1] = 0;
	            grd_mobPool[# 0,DH_MOB_LV2] = 70;
	            grd_mobPool[# 0,DH_MOB_LV3] = 0;
                
                state_event = true;
	            endDia_battle = true;
	            missionComplete = true;
	            
	            scr_dia_importJson("msn_vWoods_03","dia_03");
            	instance_create_depth(0,0,0,obj_handler_dialogue);
            }
        }
        
        break;
    
    default:
        event_inherited();
        break;
}