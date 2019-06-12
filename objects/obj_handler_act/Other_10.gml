/// @description Insert description here
// You can write your code in this editor

switch(cEvent){
	#region //act_use
		case EVENT_ACT_USE:
			scr_trace("\n\n\n");
		
			ds_list_clear(dc_tgt);
			ds_list_clear(dc_dmgMin);
			ds_list_clear(dc_dmgMax);
			ds_list_clear(dc_aim);
		
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
			var
			_tgtParty = tgtEnemy ? src.enemyParty : src.allyParty,
			_i = (src.tgtIndex == -1 || tgtType == ACT_TGT_RANDOM) ? irandom_range(0,2) : src.tgtIndex,
			_valid = false;
			
			repeat(tgtType == ACT_TGT_RANDOM ? hitCount : 1){
				repeat(3){
					var _tgt = _tgtParty[# _i,0];
					
					if(instance_exists(_tgt) && _tgt.hpCurr > 0){
						_valid = true;
						ds_list_add(dc_tgt,_tgt);
						
						if(tgtType == ACT_TGT_SINGLE || tgtType == ACT_TGT_RANDOM){
							break;
						}
					}
					
					_i = (_i + 1) mod 3;
				}
				
				_i = irandom_range(0,2);
			}
			
			if(tgtType == ACT_TGT_SELF){
				ds_list_clear(dc_tgt);
				ds_list_add(dc_tgt,src);
				_valid = src.hpCurr > 0;
			}
			
			//if target exists, damage/aim calculation
			if(_valid){
				for(var _i = 0;_i < ds_list_size(dc_tgt);_i++){
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
					scr_cEvent(all,EVENT_BATTLE_ATKMOD,src,dc_tgt[| _i],id);
					
					if(tgtEnemy){
						switch(defScale){
							case CHAR_VAR_MDEF:
								_dmgBonus += -dc_tgt[| _i].mDef / 100;
								scr_trace("dmg -mDef: " + string(dc_tgt[| _i].mDef) + "%");
								
								break;
							case CHAR_VAR_FDEF:
								_dmgBonus += -dc_tgt[| _i].fDef / 100;
								scr_trace("dmg -fDef: " + string(dc_tgt[| _i].fDef) + "%");
								
								break;
							case CHAR_VAR_SDEF:
								_dmgBonus += -dc_tgt[| _i].sDef / 100;
								scr_trace("dmg -sDef: " + string(dc_tgt[| _i].sDef) + "%");
								
								break;
						}
					}
					
					scr_cEvent(all,EVENT_BATTLE_DEFMOD,src,dc_tgt[| _i],id);
					_dmgBonus += global.tempFloat;
					
					scr_trace("dmgBonus: " + string(_dmgBonus * 100) + "%");
					
					if(tgtEnemy){
						_aimBonus += (src.acc + -dc_tgt[| _i].eva) / 100;
						
						global.tempFloat = 0;
						scr_cEvent(all,EVENT_BATTLE_ACCMOD,src,dc_tgt[| _i],id);
						scr_cEvent(all,EVENT_BATTLE_EVAMOD,src,dc_tgt[| _i],id);
						_aimBonus += global.tempFloat;
					}
					
					ds_list_add(dc_dmgMin,pwr * (1 + _dmgBonus));
					ds_list_add(dc_dmgMax,dc_dmgMin * 1.4);
					ds_list_add(dc_aim,_aimBonus);
					
					scr_trace(
						"\nsrc: " + src.name +
						"\ntgt: " + dc_tgt[| _i].name +
						"\ndmgMin: " + string(dc_dmgMin[| _i]) +
						"\ndmgMax: " + string(dc_dmgMax[| _i]) +
						"\naim: " + string(dc_aim[| _i])
					);
				}
				
				hitLoopRemaining = hitCount;
				
				alarm[0] = 30;
				using = true;
			}
			
			break;
	#endregion
}