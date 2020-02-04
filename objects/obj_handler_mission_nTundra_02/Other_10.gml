/// @description Custom events

switch cEvent{
    case MHE_INIT:
        layer_background_sprite(global.ly_bg[0],bg_tundra);
        
        with obj_handler_dungeon{
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
			
			grd_mobPool[# 0,DH_MOB_ID1] = noone;
            grd_mobPool[# 0,DH_MOB_ID2] = CHAR_NPC_NEWTYPE;
            grd_mobPool[# 0,DH_MOB_ID3] = noone;
            
            grd_mobPool[# 0,DH_MOB_PMIN] = 0;
            grd_mobPool[# 0,DH_MOB_PMAX] = 0;
            
            grd_mobPool[# 0,DH_MOB_LV1] = 0;
            grd_mobPool[# 0,DH_MOB_LV2] = 25;
            grd_mobPool[# 0,DH_MOB_LV3] = 0;
            
            state_event = true;
            state_boss = true;
            missionComplete = true;
            endDia_battle = true;
        }
    
        break;
    
    case EVENT_DND_CLEAR:
    	event_inherited();
    	
        var _map = scr_data_getMap(global.grd_missions,MSN_ZDESERT_01);
        
        _map[? MSN_VAR_STATUS] = 3;
        
        ds_list_add(global.lst_inv_classes,create(obj_handler_class_newtypeDmg));
    	
    	break;
    
    default:
        event_inherited();
        break;
}