/// @description Insert description here
// You can write your code in this editor

switch(cEvent){
	#region //act_use
		case EVENT_ACT_USE:
			//create banner
			with obj_fpo_actBanner{
				tgt_yPos += bSize + 8;
			}
		
			var _p = instance_create_depth(0,80,-999,obj_fpo_actBanner);
			_p.sprite_index = src.src[? CHAR_VAR_SPR_NEUTRAL];
			_p.txt[0] = name;
			_p.txt_ft[0] = ft_dungeonBoldLarge;
			_p.txt_col[0] = c_dkgray;
			_p.txt_halign[0] = fa_right;
			_p.txt_valign[0] = fa_top;
			_p.txt_y[0] = 0;
			
			_p.txt[1] = src.name;
			_p.txt_ft[1] = ft_dungeonBold;
			_p.txt_col[1] = c_dkgray;
			_p.txt_halign[1] = fa_right;
			_p.txt_valign[1] = fa_bottom;
			_p.txt_y[1] = 0;
			
			//select target
			var _tgtParty = tgtEnemy ? src.enemyParty : src.allyParty,
			_i = src.tgtIndex == -1 ? irandom_range(0,2) : src.tgtIndex,
			_valid = false;
			
			repeat(3){
				dc_tgt = _tgtParty[# _i,0];
				
				if(instance_exists(dc_tgt) && dc_tgt.hpCurr > 0){
					_valid = true;
					break;
				}
				
				_i = (_i + 1) mod 3;
			}
			
			if(tgtType == ACT_TGT_SELF){
				dc_tgt = src;
				_valid = src.hpCurr > 0;
			}
			
			//if target exists, damage/aim calculation
			if(_valid){
				var
				_dmgBonus = 0,
				_aimBonus = 0;
				
				switch(atkScale){
					case CHAR_VAR_MATK:
						_dmgBonus += src.mAtk / 100;
						scr_trace("dmg +mAtk: " + string(src.mAtk) + "%");
						
						break;
					case CHAR_VAR_FATK:
						_dmgBonus += src.fAtk / 100;
						scr_trace("dmg +fAtk: " + string(src.fAtk) + "%");
						
						break;
					case CHAR_VAR_SATK:
						_dmgBonus += src.sAtk / 100;
						scr_trace("dmg +sAtk: " + string(src.sAtk) + "%");
						
						break;
				}
				
				global.tempFloat = 0;
				scr_cEvent(all,EVENT_BATTLE_ATKMOD,src,dc_tgt,id);
				
				if(tgtEnemy){
					switch(defScale){
						case CHAR_VAR_MDEF:
							_dmgBonus += -dc_tgt.mDef / 100;
							scr_trace("dmg -mDef: " + string(dc_tgt.mDef) + "%");
							
							break;
						case CHAR_VAR_FDEF:
							_dmgBonus += -dc_tgt.fDef / 100;
							scr_trace("dmg -fDef: " + string(dc_tgt.fDef) + "%");
							
							break;
						case CHAR_VAR_SDEF:
							_dmgBonus += -dc_tgt.sDef / 100;
							scr_trace("dmg -sDef: " + string(dc_tgt.sDef) + "%");
							
							break;
					}
				}
				
				scr_cEvent(all,EVENT_BATTLE_DEFMOD,src,dc_tgt,id);
				_dmgBonus += global.tempFloat;
				
				scr_trace("dmgBonus: " + string(_dmgBonus * 100) + "%");
				
				if(tgtEnemy){
					_aimBonus += (src.acc + -dc_tgt.eva) / 100;
					
					global.tempFloat = 0;
					scr_cEvent(all,EVENT_BATTLE_ACCMOD,src,dc_tgt,id);
					scr_cEvent(all,EVENT_BATTLE_EVAMOD,src,dc_tgt,id);
					_aimBonus += global.tempFloat;
				}
				
				dc_dmgMin = pwr * (1 + _dmgBonus);
				dc_dmgMax = dc_dmgMin * 1.4;
				dc_aim = _aimBonus;
				
				scr_trace(
					"\nsrc: " + src.name +
					"\ntgt: " + dc_tgt.name +
					"\ndmgMin: " + string(dc_dmgMin) +
					"\ndmgMax: " + string(dc_dmgMax) +
					"\naim: " + string(dc_aim)
				);
				
				hitLoopRemaining = hitCount;
				
				alarm[0] = 30;
				using = true;
			}
			
			break;
	#endregion
}