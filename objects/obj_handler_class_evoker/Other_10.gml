/// @description custom events

switch(cEvent){
	#region //battle_enemyDebuffed
		case EVENT_BATTLE_ENEMYDEBUFFED:
			var
			_src = cArgs[| 0],
			_tgt = cArgs[| 1];
			
			if(scr_exists(src,asset_object) && _src == src){
				global.tempInt += grd_skills[# 3,1] * grd_skillRate[# 3,1];
				global.tempFloat += src.level * .005;
				
				scr_trace("[" + grd_skillName[# 3,1] + "] inflict duration boost: " + string(grd_skills[# 3,1] * grd_skillRate[# 3,1]));
				scr_trace("[Curse Concentrate] inflict rate boost: " + string((src.level * .005) * 100) + "%");
			}
			
			break;
	#endregion
	
	#region //evok_rBrandCheck
		case EVENT_EVOK_RBRANDCHECK:
			var
			_src = cArgs[| 0];
			
			if(scr_exists(src,asset_object) && _src == src && grd_skills[# 3,0] > 0){
				src.hpCurr = 1;
				src.iFrames = room_speed * 3;
				
				scr_createEffectTxt(src.x,src.y + -70,"Endure");
				
				for(var _i = 0;_i < 3;_i++){
					var _obj = src.enemyParty[#_i,0];
					
					if(scr_exists(_obj,asset_object)){
						repeat(2){
							scr_inflictAilment(src,_obj,irandom(5),999,20);
						}
					}
				}
				
				global.tempFloat = stat_rBrand_base + (stat_rBrand_rate * grd_skills[# 3,0]);
				global.tempObj = src;
				
				with obj_handler_act_evok_mRdmr{
					if(scr_exists(src,asset_object) && src == global.tempObj){
						cdCurr = global.tempFloat;
						cdMax = cdCurr;
					}
				}
			}
			
			break;
	#endregion
	
	#region //class_baseStatAdd
		case EVENT_CLASS_BASESTATADD:
		    event_inherited();
		
			if(scr_exists(src,asset_object)){
			    src.sDef += grd_skills[# 0,0] * grd_skillRate[# 0,0];
			    src.spd += grd_skills[# 0,1] * grd_skillRate[# 0,1];
			    src.sAtk += grd_skills[# 0,2] * grd_skillRate[# 0,2];
			}
			
			break;
	#endregion
		
	#region //battle_atkMod
		case EVENT_BATTLE_ATKMOD:
			var
			_src = cArgs[| 0],
			_tgt = cArgs[| 1],
			_act = cArgs[| 2];
			
			if(scr_exists(src,asset_object) && _src == src){
				//dark love
				if(_act.ele == CHAR_VAR_ELE_DRK){
					var _boost = grd_skills[# 1,1] * grd_skillRate[# 1,1];
					
					scr_trace("[" + grd_skillName[# 1,1] + "] atk boost: +" + string(_boost * 100) + "%");
					
					global.tempFloat += _boost;
				}
				
				//light love
				if(_act.ele == CHAR_VAR_ELE_LGT){
					var _boost = grd_skills[# 2,1] * grd_skillRate[# 2,1];
					
					scr_trace("[" + grd_skillName[# 2,1] + "] atk boost: +" + string(_boost * 100) + "%");
					
					global.tempFloat += _boost;
				}
			}
		
			break;
	#endregion
		
	#region
		case EVENT_CLASS_SKILLREFRESH:
			event_inherited();
			
			//magical redeemer
			var
			_ix = 1,
			_iy = 0;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			
			//magical destroyer
			_ix = 1;
			_iy = 2;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			
			//stealth flight
			_ix = 2;
			_iy = 0;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,stat_sf_penaltyBase + (grd_skills[# _ix,_iy] * stat_sf_penaltyRate));
			ds_list_add(grd_skillAct[# _ix,_iy].special,stat_sf_boostBase + (grd_skills[# _ix,_iy] * stat_sf_boostRate));
			ds_list_add(grd_skillAct[# _ix,_iy].special,grd_skills[# _ix,_iy] * -stat_flightAggro);
			
			//trick flight
			_ix = 2;
			_iy = 2;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,stat_tf_penaltyBase + (grd_skills[# _ix,_iy] * stat_tf_penaltyRate));
			ds_list_add(grd_skillAct[# _ix,_iy].special,stat_tf_boostBase + (grd_skills[# _ix,_iy] * stat_tf_boostRate));
			ds_list_add(grd_skillAct[# _ix,_iy].special,grd_skills[# _ix,_iy] * stat_flightAggro);
			
			//destroyer's brand
			_ix = 3;
			_iy = 2;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,grd_skillRate[# _ix,_iy] + (grd_skills[# _ix,_iy] * stat_dbrand_rate));
			
			break;
	#endregion
	
	default:
	    event_inherited();
	    break;
}