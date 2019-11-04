/// @description custom events

switch(cEvent){
	#region //class_baseStatAdd
		case EVENT_CLASS_BASESTATADD:
		    event_inherited();
		
			if(scr_exists(src,asset_object)){
			    src.fAtk += grd_skills[# 0,0] * grd_skillRate[# 0,0];
			    src.ele_elc += grd_skills[# 0,1] * grd_skillRate[# 0,1];
			    src.fDef += grd_skills[# 0,2] * grd_skillRate[# 0,2];
			}
			
			break;
	#endregion
	
	#region //class_skillRefresh
		case EVENT_CLASS_SKILLREFRESH:
			event_inherited();
			
			//orbs
			for(var _iy = 0;_iy < 3;_iy++){
				var
				_ix = 1,
				_act = grd_skillAct[# _ix,_iy];
				
				ds_list_clear(_act.special);
				ds_list_add(_act.special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
				ds_list_add(_act.special,grd_skills[# 2,0] * grd_skillRate[# 2,0]);
				ds_list_add(_act.special,grd_skills[# 2,1] * grd_skillRate[# 2,1]);
				ds_list_add(_act.special,grd_skills[# 2,2] * grd_skillRate[# 2,2]);
				ds_list_add(_act.special,grd_skills[# 3,1] * grd_skillRate[# 3,1]);
			}
			
			//swarm orb
			var
			_ix = 3,
			_iy = 0,
			_act = grd_skillAct[# _ix,_iy];
			
			_act.pwr = grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy];
			
			break;
	#endregion
	
	#region //snct_saveCheck
		case EVENT_NEWT_SAVECHECK:
			var
			_dmg = cArgs[| 0],
			_tgt = cArgs[| 1],
			_act = cArgs[| 2],
			_x = 3,
			_y = 2,
			_proc = !DEBUG ? (grd_skills[# _x,_y] * grd_skillRate[# _x,_y]) : 1;
			
			if(
				scr_exists(src) &&
				scr_exists(src.stance) &&
				object_is_ancestor(src.stance.object_index,obj_handler_actEffect_newt_orb_parent) &&
				_act.tgtEnemy &&
				_dmg >= _tgt.hpCurr &&
				_tgt.allyParty == src.allyParty &&
				random(1) < _proc
			){
				scr_createEffectTxt(_tgt,"PROTECT");
				instance_destroy(src.stance);
				
				global.tempObj = src;
				
				with obj_handler_act_newt_orb_parent{
					if(src == global.tempObj){
						cdMax = UNIVERSAL_COOLDOWN + (cdAdd * 200);
						cdCurr = cdMax;
					}
				}
				
				global.tempBool = true;
			}
			
			event_inherited();
			
			break;
	#endregion
		
	default:
	    event_inherited();
	    break;
}