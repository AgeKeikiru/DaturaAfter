/// @description custom events

switch(cEvent){
	
	case EVENT_BATTLM_INIT:
		if(src != noone){
			name = src[? CHAR_VAR_NAMEDISP];
			level = src[? CHAR_VAR_LEVEL];
			
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
					default:
						act[0] = scr_data_act_new(EACT_TACKLE);
						act[0].src = id;
						
						break;
				}
			}else{
				var _key = "char_var_hb";
				
				for(var _i = 0;_i < 8;_i++){
					with act[_i]{
						src = noone;
					}
					
					act[_i] = src[? _key + string(_i)];
					
					if(scr_exists(act[_i],asset_object)){
						act[_i].src = id;
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
					scr_cEvent(class[_i],EVENT_CLASS_BASESTATADD);
					level += ds_grid_get_sum(class[_i].grd_skills,0,0,ds_grid_width(class[_i].grd_skills) + -1,ds_grid_height(class[_i].grd_skills) + -1);
				}
				
				_i++;
			}
			
			class[_i] = src[? CHAR_VAR_UCLASS];
			
			if(class[_i] != undefined && instance_exists(class[_i])){
				class[_i].src = id;
				scr_cEvent(class[_i],EVENT_CLASS_BASESTATADD);
				level += ds_grid_get_sum(class[_i].grd_skills,0,0,ds_grid_width(class[_i].grd_skills) + -1,ds_grid_height(class[_i].grd_skills) + -1);
			}
			
			hpMax += round(src[? CHAR_VAR_HP] * .05 * level);
			enMax += round(src[? CHAR_VAR_EN] * .05 * level);
			
			hpCurr = min(hpCurr,hpMax);
			enCurr = min(enCurr,enMax);
			
			if(instance_number(obj_handler_dungeon) < 1 || allyParty == global.grd_party_enemy){
				hpCurr = hpMax;
				enCurr = enMax;
			}
		}
		
		break;
		
	case EVENT_BATTLM_ICONREFRESH:
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
}