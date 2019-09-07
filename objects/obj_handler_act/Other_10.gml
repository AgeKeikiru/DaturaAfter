/// @description Insert description here
// You can write your code in this editor

switch(cEvent){
	#region //act_use
		case EVENT_ACT_USE:
			if(!scr_exists(src,asset_object)){
				exit;
			}
			
			scr_cEvent(all,EVENT_AGNT_FSCHECK,src,id);
		
			#region //special act effects
				if(type == WTAG_TYPE_PAN || type == WTAG_TYPE_SLG){
					pwr = 50;
					hitCount = 1;
					tgtType = ACT_TGT_SINGLE;
					tgtEnemy = true;
					nonAttack = false;
					effect_start = noone;
					spark_hit = type == WTAG_TYPE_PAN ? spr_spark_bash : spr_spark_pierce;
					ds_list_clear(special);
					
					if(scr_exists(src.stance,asset_object) && src.stance.object_index == obj_handler_actEffect_chef_messKit && ds_list_size(src.stance.lst_food) > 0){
						pwr = (type == WTAG_TYPE_SLG) * 50;
						tgtEnemy = type == WTAG_TYPE_SLG;
						nonAttack = type == WTAG_TYPE_PAN;
						
						if(type == WTAG_TYPE_PAN){
							spark_start = spr_spark_dot;
							effect_start = obj_handler_actEffect_chef_pan;
						}
						
						for(var _i = ds_list_size(src.stance.lst_food) + -1;_i >= 0;_i--){
							var
							_food = src.stance.lst_food[| _i],
							_multi = 1;
							
							if(object_index == obj_handler_act_chef_tasteTest){
								_multi = multi;
								tgtType = ACT_TGT_SELF;
							}
							
							if(scr_exists(_food,asset_object)){
								switch _food.special[| 0]{
									case FOOD_ATK:
									case FOOD_DEF:
									case FOOD_ACC:
									case FOOD_EVA:
									case FOOD_SPD:
									case FOOD_EN:
										if(type == WTAG_TYPE_PAN){
											ds_list_add(special,_food.special[| 0]);
											ds_list_add(special,_food.special[| 1] * _multi);
										}else{
											switch(_food.special[| 0]){
												case FOOD_ATK:
													sa_inflict[| CHAR_SA_BRN] = 5;
													sa_chance[| CHAR_SA_BRN] += _food.special[| 1] * 2;
									
													break;
										
												case FOOD_DEF:
													sa_inflict[| CHAR_SA_SLW] = 5;
													sa_chance[| CHAR_SA_SLW] += _food.special[| 1] * 2;
									
													break;
										
												case FOOD_ACC:
													sa_inflict[| CHAR_SA_SLC] = 5;
													sa_chance[| CHAR_SA_SLC] += _food.special[| 1] * 2;
									
													break;
										
												case FOOD_EVA:
													sa_inflict[| CHAR_SA_PAR] = 5;
													sa_chance[| CHAR_SA_PAR] += _food.special[| 1] * 2;
									
													break;
										
												case FOOD_SPD:
													sa_inflict[| CHAR_SA_BLD] = 5;
													sa_chance[| CHAR_SA_BLD] += _food.special[| 1] * 2;
									
													break;
										
												case FOOD_EN:
													sa_inflict[| CHAR_SA_PSN] = 5;
													sa_chance[| CHAR_SA_PSN] += _food.special[| 1] * 2;
									
													break;
											}
										}
										
										break;
									
									case FOOD_HP:
										pwr += _food.special[| 1] * _multi;
										nonAttack = false;
										
										break;
										
									case FOOD_WIDE:
										tgtType = ACT_TGT_WIDE;
										
										break;
										
									case FOOD_MULTI:
										hitCount++;
										
										break;
								}
							}
							
							if(object_index != obj_handler_act_chef_tasteTest){
								instance_destroy(_food);
								ds_list_delete(src.stance.lst_food,_i);
							}
						}
					}
				}
				
				if(object_index == obj_handler_act_raze_dBlow && ds_list_size(special) > 0){
					recoil = floor(src.hpCurr / 2);
					pwr = recoil * special[| 0];
				}
				
				if(type == EACT_DETONATE){
					src.noLoot = true;
					src.hpCurr = 0;
				}
			#endregion
		
			ds_list_clear(dc_tgt);
			ds_list_clear(dc_dmgMin);
			ds_list_clear(dc_dmgMax);
			ds_list_clear(dc_aim);
			ds_list_clear(dc_weakres);
		
			//create banner
			with obj_fpo_actBanner{
				tgt_yPos += bSize + 8;
			}
		
			var _p = instance_create_depth(0,80,-999,obj_fpo_actBanner);
			_p.sprite_index = src.src[? CHAR_VAR_SPR_NEUTRAL];
			_p.src = src;
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
			_i = (src.tgtIndex == -1 || tgtType == ACT_TGT_RANDOM || src.ailment[CHAR_SA_BLD] > 0) ? irandom_range(0,2) : src.tgtIndex,
			_valid = false;
			
			repeat(tgtType == ACT_TGT_RANDOM ? hitCount : 1){
				repeat(3){
					var _tgt = _tgtParty[# _i,0];
					
					if(instance_exists(_tgt) && (_tgt.hpCurr > 0 ^^ revive)){
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
					_aimBonus = 0,
					_defDiff = 0, //base defense + ele res value, for checking effectiveness
					_weakRes = ""; //"weak" or "res" display text
					
					if(tgtEnemy){
						_dmgBonus += (src.level + -dc_tgt[| _i].level) * .05;
						scr_trace("dmg level bonus: " + string((src.level + -dc_tgt[| _i].level) * 5) + "%");
						
						if(ele != ""){
							_dmgBonus += -dc_tgt[| _i].src[? ele] / 100;
							_defDiff += dc_tgt[| _i].src[? ele];
							scr_trace("ele -resist: " + string(dc_tgt[| _i].src[? ele]) + "%");
						}
					}
					
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
						case CHAR_VAR_SDEF:
							_dmgBonus += src.sDef / 100;
							scr_trace("dmg +sDef: " + string(src.sDef) + "%");
							
							break;
					}
					
					global.tempFloat = 0;
					scr_cEvent(all,EVENT_BATTLE_ATKMOD,src,dc_tgt[| _i],id);
					
					if(tgtEnemy){
						switch(defScale){
							case CHAR_VAR_MDEF:
								_dmgBonus += -dc_tgt[| _i].mDef / 100;
								_defDiff += dc_tgt[| _i].mDef;
								scr_trace("dmg -mDef: " + string(dc_tgt[| _i].mDef) + "%");
								
								break;
							case CHAR_VAR_FDEF:
								_dmgBonus += -dc_tgt[| _i].fDef / 100;
								_defDiff += dc_tgt[| _i].fDef;
								scr_trace("dmg -fDef: " + string(dc_tgt[| _i].fDef) + "%");
								
								break;
							case CHAR_VAR_SDEF:
								_dmgBonus += -dc_tgt[| _i].sDef / 100;
								_defDiff += dc_tgt[| _i].sDef;
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
						
						var _msn = instance_find(obj_handler_mission_parent,0);
						
						if(scr_exists(_msn,asset_object) && _msn.con_dark){
							_aimBonus += MSN_CEV_DARK;
							scr_trace("con_dark: " + string(MSN_CEV_DARK * 100) + "%");
						}
						
						if(scr_exists(_msn,asset_object) && _msn.con_diffTerrain){
							_aimBonus += MSN_CEV_DTERR;
							scr_trace("con_dTerr: " + string(MSN_CEV_DTERR * 100) + "%");
						}
						
						if(_defDiff >= 30){
							_weakRes = "RES";
						}
						
						if(_defDiff <= -30){
							_weakRes = "WEAK";
						}
					}
					
					ds_list_add(dc_weakres,_weakRes);
					ds_list_add(dc_dmgMin,pwr * (1 + _dmgBonus));
					ds_list_add(dc_dmgMax,dc_dmgMin[| _i] * 1.4);
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
	
	#region //act_refreshInfo
		case EVENT_ACT_REFRESHINFO:
			name = baseName;
			cdAdd = round(cdBase * (1 + (cdRate * rare)));
			enCost = round(enBase * (1 + (enRate * rare)));
			pwr = round(basePwr * (1 + (.05 * plus)));
			price = round(basePrice * (1 + (.1 * plus) + (.5 * rare)));
			
			switch(ele){
				case CHAR_VAR_ELE_FIR:
					name = "Flar " + name;
					
					break;
				case CHAR_VAR_ELE_ICE:
					name = "Fros " + name;
					
					break;
				case CHAR_VAR_ELE_LGT:
					name = "Weiz " + name;
					
					break;
				case CHAR_VAR_ELE_DRK:
					name = "Warz " + name;
					
					break;
				case CHAR_VAR_ELE_ELC:
					name = "Tesl " + name;
					
					break;
				case CHAR_VAR_ELE_NAT:
					name = "Terr " + name;
					
					break;
			}
			
			if(plus > 0){
				name += " +" + string(plus);
			}
			
			break;
	#endregion
}