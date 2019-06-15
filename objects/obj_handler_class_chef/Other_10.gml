/// @description custom events

switch(cEvent){
	#region //class_baseStatAdd
		case EVENT_CLASS_BASESTATADD:
		    event_inherited();
		
			if(scr_exists(src,asset_object)){
			    src.hpCurr += grd_skills[# 0,0] * grd_skillRate[# 0,0];
			    
			    if(src.src[? CHAR_VAR_CLS0] == id){
			    	var _boost = .0025;
			    	
				    src.src[? CHAR_VAR_ELE_FIR] += src.level * _boost;
				    src.src[? CHAR_VAR_ELE_ICE] += src.level * _boost;
				    src.src[? CHAR_VAR_ELE_ELC] += src.level * _boost;
				    src.src[? CHAR_VAR_ELE_NAT] += src.level * _boost;
				    src.src[? CHAR_VAR_ELE_DRK] += src.level * _boost;
				    src.src[? CHAR_VAR_ELE_LGT] += src.level * _boost;
			    }
			}
			
			break;
	#endregion
		
	#region
		case EVENT_CLASS_SKILLREFRESH:
			event_inherited();
			
			//mess kit
			var
			_ix = 0,
			_iy = 1;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			
			//firm rice
			_ix = 0;
			_iy = 2;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,FOOD_HP);
			ds_list_add(grd_skillAct[# _ix,_iy].special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			
			//blast pepper
			_ix = 1;
			_iy = 0;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,FOOD_ATK);
			ds_list_add(grd_skillAct[# _ix,_iy].special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			
			//super flour
			_ix = 1;
			_iy = 1;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,FOOD_WIDE);
			ds_list_add(grd_skillAct[# _ix,_iy].special,stat_specialCd_base + (grd_skills[# _ix,_iy] * stat_specialCd_rate));
			
			//winter green
			_ix = 1;
			_iy = 2;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,FOOD_DEF);
			ds_list_add(grd_skillAct[# _ix,_iy].special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			
			//focuspice
			_ix = 2;
			_iy = 0;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,FOOD_ACC);
			ds_list_add(grd_skillAct[# _ix,_iy].special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			
			//double gum
			_ix = 2;
			_iy = 1;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,FOOD_MULTI);
			ds_list_add(grd_skillAct[# _ix,_iy].special,stat_specialCd_base + (grd_skills[# _ix,_iy] * stat_specialCd_rate));
			
			//citruswift
			_ix = 2;
			_iy = 2;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,FOOD_EVA);
			ds_list_add(grd_skillAct[# _ix,_iy].special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			
			//brightbroth
			_ix = 3;
			_iy = 0;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,FOOD_SPD);
			ds_list_add(grd_skillAct[# _ix,_iy].special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			
			//taste test
			_ix = 3;
			_iy = 1;
			
			grd_skillAct[# _ix,_iy].multi = stat_tt_base + (grd_skills[# _ix,_iy] * stat_tt_rate);
			
			//shadestock
			_ix = 3;
			_iy = 2;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,FOOD_EN);
			ds_list_add(grd_skillAct[# _ix,_iy].special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			
			break;
	#endregion
		
	default:
	    event_inherited();
	    break;
}