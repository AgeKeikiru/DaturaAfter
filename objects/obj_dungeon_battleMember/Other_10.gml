/// @description custom events

switch(cEvent){
	
	#region //battlm_init
		case EVENT_BATTLM_INIT:
			if(src != noone){
				name = src[? CHAR_VAR_NAMEDISP];
				
				if(allyParty == global.grd_party_player){
					level = 0;
				}
				
				hpMax = src[? CHAR_VAR_HP];
				enMax = src[? CHAR_VAR_EN];
				
				mAtk = src[? CHAR_VAR_MATK];
				mDef = src[? CHAR_VAR_MDEF];
				fAtk = src[? CHAR_VAR_FATK];
				fDef = src[? CHAR_VAR_FDEF];
				sAtk = src[? CHAR_VAR_SATK];
				sDef = src[? CHAR_VAR_SDEF];
				
				acc = src[? CHAR_VAR_ACC];
				eva = src[? CHAR_VAR_EVA];
				spd = src[? CHAR_VAR_SPD];
				misc = src[? CHAR_VAR_MISC];
				
				ele_fir = src[? CHAR_VAR_ELE_FIR];
				ele_ice = src[? CHAR_VAR_ELE_ICE];
				ele_lgt = src[? CHAR_VAR_ELE_LGT];
				ele_drk = src[? CHAR_VAR_ELE_DRK];
				ele_elc = src[? CHAR_VAR_ELE_ELC];
				ele_nat = src[? CHAR_VAR_ELE_NAT];
				
				//load acts
				if(allyParty == global.grd_party_enemy){
					switch(src[? CHAR_VAR_ID]){
						#region //pvp_blaze
							case CHAR_PVP_BLAZE:
								act[0] = scr_data_act_new(WTAG_TYPE_HGN,CHAR_VAR_ELE_ICE,0,10);
								act[0].src = id;
								
								act[1] = scr_data_act_new(WTAG_TYPE_HGN,CHAR_VAR_ELE_ICE,0,10);
								act[1].src = id;
								
								act[2] = scr_data_act_new(WTAG_TYPE_HGN,CHAR_VAR_ELE_ICE,0,10);
								act[2].src = id;
								
								act[3] = scr_data_act_new(WTAG_TYPE_CSC,CHAR_VAR_ELE_ICE,0,10);
								act[3].src = id;
								
								act[4] = scr_data_act_new(WTAG_TYPE_ASC_RAY,CHAR_VAR_ELE_DRK,0,10);
								act[4].src = id;
								
								act[5] = scr_data_act_new(WTAG_TYPE_SHG,"",0,10);
								act[5].src = id;
								
								break;
						#endregion
						
						#region //pvp_imo
							case CHAR_PVP_IMO:
								act[0] = scr_data_act_new(WTAG_TYPE_DGR,"",0,0);
								act[0].src = id;
								
								act[1] = scr_data_act_new(WTAG_TYPE_ASC_ARW,CHAR_VAR_ELE_ICE,0,0);
								act[1].src = id;
								
								break;
						#endregion
						
						#region //pvp_aile
							case CHAR_PVP_AILE:
								act[0] = scr_data_act_new(WTAG_TYPE_HGN,"",0,0);
								act[0].src = id;
								
								act[1] = scr_data_act_new(WTAG_TYPE_SSC_HEAL,"",0,0);
								act[1].src = id;
								
								break;
						#endregion
						
						#region //pvp_paprika
							case CHAR_PVP_PAPRIKA:
								act[0] = scr_data_act_new(WTAG_TYPE_PAN,"",0,0);
								act[0].src = id;
								
								break;
						#endregion
						
						#region //npc_agent
							case CHAR_NPC_AGENT:
								act[0] = scr_data_act_new(WTAG_TYPE_HGN,"",0,0);
								act[0].src = id;
								
								act[1] = scr_data_act_new(WTAG_TYPE_HGN,"",0,0);
								act[1].src = id;
								
								act[2] = scr_data_act_new(WTAG_TYPE_SHG,"",0,0);
								act[2].src = id;
								
								break;
						#endregion
							
						#region //npc_evoker
							case CHAR_NPC_EVOKER:
								act[0] = scr_data_act_new(WTAG_TYPE_ASC_ARW,CHAR_VAR_ELE_DRK,0,0);
								act[0].src = id;
								
								act[1] = scr_data_act_new(WTAG_TYPE_ASC_ARW,CHAR_VAR_ELE_DRK,0,0);
								act[1].src = id;
								
								act[2] = scr_data_act_new(WTAG_TYPE_ASC_ARW,CHAR_VAR_ELE_LGT,0,0);
								act[2].src = id;
								
								act[3] = scr_data_act_new(WTAG_TYPE_SSC_HEAL,"",0,0);
								act[3].src = id;
								
								act[4] = scr_data_act_new(WTAG_TYPE_CSC,CHAR_VAR_ELE_DRK,0,0);
								act[4].src = id;
								
								break;
						#endregion
						
						#region //paraslime
							case CHAR_PARASLIME:
								act[0] = scr_data_act_new(EACT_TACKLE);
								act[0].src = id;
								
								act[1] = scr_data_act_new(EACT_TACKLE);
								act[1].src = id;
								
								act[2] = scr_data_act_new(EACT_PARATACKLE);
								act[2].src = id;
								
								break;
						#endregion
						
						#region //froslime
							case CHAR_FROSLIME:
								act[0] = scr_data_act_new(EACT_TACKLE);
								act[0].src = id;
								
								act[1] = scr_data_act_new(EACT_TACKLE);
								act[1].src = id;
								
								act[2] = scr_data_act_new(EACT_FROSTACKLE);
								act[2].src = id;
								
								break;
						#endregion
						
						#region //wolfeant
							case CHAR_WOLFEANT:
								act[0] = scr_data_act_new(EACT_TACKLE);
								act[0].src = id;
								
								act[1] = scr_data_act_new(EACT_BITE);
								act[1].src = id;
								
								act[2] = scr_data_act_new(EACT_RAZORCLAW);
								act[2].src = id;
								
								break;
						#endregion
						
						#region //mine
							case CHAR_ARCMINE:
								act[0] = scr_data_act_new(EACT_DETONATE);
								act[0].src = id;
								
								break;
						#endregion
						
						#region //liConduit
							case CHAR_LICONDUIT:
								act[0] = scr_data_act_new(EACT_LIFESTIM);
								act[0].src = id;
								
								break;
						#endregion
						
						#region //atConduit
							case CHAR_ATCONDUIT:
								act[0] = scr_data_act_new(EACT_BLASTSTIM);
								act[0].src = id;
								
								break;
						#endregion
						
						#region //dfConduit
							case CHAR_DFCONDUIT:
								act[0] = scr_data_act_new(EACT_GUARDSTIM);
								act[0].src = id;
								
								break;
						#endregion
						
						#region //gunnerDrone
							case CHAR_GUNNERDRONE:
								act[0] = scr_data_act_new(EACT_SVULCAN);
								act[0].src = id;
								
								break;
						#endregion
						
						#region //flamerDrone
							case CHAR_FLAMERDRONE:
								act[0] = scr_data_act_new(EACT_FIREBALL);
								act[0].src = id;
								
								act[1] = scr_data_act_new(EACT_FLAMESWEEP);
								act[1].src = id;
								
								break;
						#endregion
							
						#region //bleeding bullet
							case CHAR_BLEEDINGBULLET:
								act[0] = scr_data_act_new(EACT_PETALSNIPE);
								act[0].src = id;
								
								break;
						#endregion
							
						#region //dart lily
							case CHAR_DARTLILY:
								act[0] = scr_data_act_new(EACT_PETALSNIPE);
								act[0].src = id;
								
								act[1] = scr_data_act_new(EACT_PETALSNIPE);
								act[1].src = id;
								
								act[2] = scr_data_act_new(EACT_TOXICPETAL);
								act[2].src = id;
								
								break;
						#endregion
							
						#region //candywing
							case CHAR_CANDYWING:
								act[0] = scr_data_act_new(EACT_BITE);
								act[0].src = id;
								
								break;
						#endregion
						
						#region //wanderer
							case CHAR_WANDERER:
								act[0] = scr_data_act_new(EACT_WAVECANNON);
								act[0].src = id;
								
								break;
						#endregion
						
						default:
							act[0] = scr_data_act_new(EACT_TACKLE);
							act[0].src = id;
							
							break;
					}
					
					for(var _i = 0;_i < 8;_i++){
						if(act[_i] != noone){
							act[_i].enCost = 0;
						}
					}
				}else{
					var _key = CHAR_VAR_HB;
					
					for(var _i = 0;_i < 8;_i++){
						with act[_i]{
							src = noone;
						}
						
						act[_i] = src[? _key + string(_i)];
						
						if(scr_exists(act[_i],asset_object)){
							act[_i].src = id;
							act[_i].abort = false;
						}
					}
				}
				
				//apply armor
				for(var _i = 0;_i < 2;_i++){
					var _arm = src[? "char_var_arm" + string(_i)];
					
					if(scr_exists(_arm,asset_object)){
						_arm.src = id;
						
						switch(_arm.type){
							case CHAR_VAR_HP:
								hpMax += _arm.pwr;
								break;
								
							case CHAR_VAR_EN:
								enMax += _arm.pwr;
								break;
								
							case CHAR_VAR_MATK:
								mAtk += _arm.pwr;
								break;
								
							case CHAR_VAR_MDEF:
								mDef += _arm.pwr;
								break;
								
							case CHAR_VAR_FATK:
								fAtk += _arm.pwr;
								break;
								
							case CHAR_VAR_FDEF:
								fDef += _arm.pwr;
								break;
								
							case CHAR_VAR_SATK:
								sAtk += _arm.pwr;
								break;
								
							case CHAR_VAR_SDEF:
								sDef += _arm.pwr;
								break;
								
							case CHAR_VAR_ACC:
								acc += _arm.pwr;
								break;
								
							case CHAR_VAR_EVA:
								eva += _arm.pwr;
								break;
								
							case CHAR_VAR_SPD:
								spd += _arm.pwr;
								break;
								
							case CHAR_VAR_MISC:
								misc += _arm.pwr;
								break;
						}
						
						ele_fir += _arm.ele_fir * _arm.plus
						ele_ice += _arm.ele_ice * _arm.plus
						ele_lgt += _arm.ele_lgt * _arm.plus
						ele_drk += _arm.ele_drk * _arm.plus
						ele_elc += _arm.ele_elc * _arm.plus
						ele_nat += _arm.ele_nat * _arm.plus
					}
				}
				
				//apply classes
				var _i = 0;
				
				repeat(3){
					class[_i] = src[? "char_var_cls" + string(_i)];
					
					if(class[_i] != undefined && instance_exists(class[_i])){
						class[_i].src = id;
						scr_cEvent(class[_i],EVENT_CLASS_SKILLREFRESH);
						scr_cEvent(class[_i],EVENT_CLASS_BASESTATADD);
						level += class[_i].level;
					}
					
					_i++;
				}
				
				class[_i] = src[? CHAR_VAR_UCLASS];
				
				if(scr_exists(class[_i],asset_object)){
					class[_i].src = id;
					scr_cEvent(class[_i],EVENT_CLASS_BASESTATADD);
					level += class[_i].level;
				}
				
				hpMax += round(src[? CHAR_VAR_HP] * .05 * level);
				enMax += round(src[? CHAR_VAR_EN] * .05 * level);
				
				hpCurr = min(hpCurr,hpMax);
				enCurr = min(enCurr,enMax);
				
				if(instance_number(obj_handler_dungeon) < 1 || allyParty == global.grd_party_enemy){
					hpCurr = hpMax;
					enCurr = enMax;
					
					if(scr_exists(stance,asset_object)){
						instance_destroy(stance);
						stance = noone;
					}
					
					for(var _i = 0;_i < array_length_1d(ailment);_i++){
						ailment[_i] = 0;
					}
					
					hpBarOver = 1;
					hpBarUnder = 1;
				}
				
				scr_cEvent(id,EVENT_BATTLM_ICONREFRESH);
			}
			
			break;
	#endregion
		
	#region //battlm_iconRefresh
		case EVENT_BATTLM_ICONREFRESH:
			aggro = 0;
		
			ds_list_clear(lst_statusIcons);
			var _map = ds_map_create();
			
			_map[? CHAR_VAR_MATK] = 0;
			_map[? CHAR_VAR_MDEF] = 0;
			_map[? CHAR_VAR_FATK] = 0;
			_map[? CHAR_VAR_FDEF] = 0;
			_map[? CHAR_VAR_SATK] = 0;
			_map[? CHAR_VAR_SDEF] = 0;
			_map[? CHAR_VAR_ACC] = 0;
			_map[? CHAR_VAR_EVA] = 0;
			_map[? CHAR_VAR_SPD] = 0;
			
			for(var _i = ds_list_size(lst_effects) + -1;_i >= 0;_i--){
				var _obj = lst_effects[| _i];
				
				if(scr_exists(_obj,asset_object)){
					_map[? CHAR_VAR_MATK] += _obj.map_statMod[? CHAR_VAR_MATK];
					_map[? CHAR_VAR_MDEF] += _obj.map_statMod[? CHAR_VAR_MDEF];
					_map[? CHAR_VAR_FATK] += _obj.map_statMod[? CHAR_VAR_FATK];
					_map[? CHAR_VAR_FDEF] += _obj.map_statMod[? CHAR_VAR_FDEF];
					_map[? CHAR_VAR_SATK] += _obj.map_statMod[? CHAR_VAR_SATK];
					_map[? CHAR_VAR_SDEF] += _obj.map_statMod[? CHAR_VAR_SDEF];
					_map[? CHAR_VAR_ACC] += _obj.map_statMod[? CHAR_VAR_ACC];
					_map[? CHAR_VAR_EVA] += _obj.map_statMod[? CHAR_VAR_EVA];
					_map[? CHAR_VAR_SPD] += _obj.map_statMod[? CHAR_VAR_SPD];
					
					aggro += _obj.aggro;
				}else{
					ds_list_delete(lst_effects,_i);
				}
			}
			
			if(_map[? CHAR_VAR_MATK] != 0){
				ds_list_add(lst_statusIcons,_map[? CHAR_VAR_MATK] > 0 ? CHAR_SI_MATKUP : CHAR_SI_MATKDN);
			}
			
			if(_map[? CHAR_VAR_MDEF] != 0){
				ds_list_add(lst_statusIcons,_map[? CHAR_VAR_MDEF] > 0 ? CHAR_SI_MDEFUP : CHAR_SI_MDEFDN);
			}
			
			if(_map[? CHAR_VAR_FATK] != 0){
				ds_list_add(lst_statusIcons,_map[? CHAR_VAR_FATK] > 0 ? CHAR_SI_FATKUP : CHAR_SI_FATKDN);
			}
			
			if(_map[? CHAR_VAR_FDEF] != 0){
				ds_list_add(lst_statusIcons,_map[? CHAR_VAR_FDEF] > 0 ? CHAR_SI_FDEFUP : CHAR_SI_FDEFDN);
			}
			
			if(_map[? CHAR_VAR_SATK] != 0){
				ds_list_add(lst_statusIcons,_map[? CHAR_VAR_SATK] > 0 ? CHAR_SI_SATKUP : CHAR_SI_SATKDN);
			}
			
			if(_map[? CHAR_VAR_SDEF] != 0){
				ds_list_add(lst_statusIcons,_map[? CHAR_VAR_SDEF] > 0 ? CHAR_SI_SDEFUP : CHAR_SI_SDEFDN);
			}
			
			if(_map[? CHAR_VAR_ACC] != 0){
				ds_list_add(lst_statusIcons,_map[? CHAR_VAR_ACC] > 0 ? CHAR_SI_ACCUP : CHAR_SI_ACCDN);
			}
			
			if(_map[? CHAR_VAR_EVA] != 0){
				ds_list_add(lst_statusIcons,_map[? CHAR_VAR_EVA] > 0 ? CHAR_SI_EVAUP : CHAR_SI_EVADN);
			}
			
			if(_map[? CHAR_VAR_SPD] != 0){
				ds_list_add(lst_statusIcons,_map[? CHAR_VAR_SPD] > 0 ? CHAR_SI_SPDUP : CHAR_SI_SPDDN);
			}
			
			for(var _i = 0;_i < 6;_i++){
				if(ailment[_i] > 0){
					ds_list_add(lst_statusIcons,CHAR_SI_BRN + _i);
				}
			}
			
			break;
	#endregion
		
	#region //battlm_iconDraw
		case EVENT_BATTLM_ICONDRAW:
			var
			_si_scale = 2,
			_si_gap = 25,
			_si_startX = x + -160,
			_si_startY = y + (allyParty == global.grd_party_player ? -120 : 0),
			_si_maxX = 12;
			
			//status icons
			for(var _i = 0;_i < ds_list_size(lst_statusIcons);_i++){
				draw_sprite_ext(
					spr_statusIcons,
					lst_statusIcons[| _i],
					_si_startX + ((_i mod _si_maxX) * _si_gap),
					_si_startY + -(floor(_i / _si_maxX) * _si_gap),
					_si_scale,
					_si_scale,
					0,
					c_white,
					1
				);
			}
			
			break;
	#endregion
	
	#region //battle_enemyKilled
		case EVENT_BATTLE_ENEMYKILLED:
			var _bool = true;
			
			for(var _i = 0;_i < 3;_i++){
				var _o = global.grd_party_enemy[# _i,0];
				
				if(scr_exists(_o,asset_object) && _o.hpCurr > 0){
					_bool = false;
				}
			}
			
			if(_bool){
				actUsing = noone;
			}
			
			break;
	#endregion
}