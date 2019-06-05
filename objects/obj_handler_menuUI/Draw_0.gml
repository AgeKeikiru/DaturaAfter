/// @description Insert description here

#region //draw party lead

	var
	_lead = global.grd_party_player[# 0,0],
	_leadX = 900 + -(100 * (transCurr + -1)),
	_spr = noone;
	
	if(scr_exists(_lead,asset_object)){
		_spr = _lead.src[? CHAR_VAR_SPR_NEUTRAL];
	}
	
	switch(txt_title){
		case "MARKET":
			_spr = spr_npc_merchant;
			break;
		case "MISSION":
			_spr = spr_npc_tear;
			break;
	}
	
	if(scr_exists(_spr,asset_sprite)){
		draw_sprite_ext(_spr,0,_leadX + -10,720,1,1,0,c_black,transCurr * .8); //drop shadow
		draw_sprite_ext(_spr,0,_leadX,720,1,1,0,c_white,transCurr);
	}

#endregion

#region //draw party screen

	#region //background
	
		draw_set_alpha(1);
	
		var _arrowOff,_x,_y;
	
		_arrowOff = 100;
		//vertex coords, starting upper left corner going clockwise
		//bottom
		_x[0] = (room_width + _arrowOff) * grd_ps_xDraw[# 0,0];
		_y[0] = 0;
		
		_x[1] = (room_width + _arrowOff) * grd_ps_xDraw[# 1,0];
		_y[1] = _y[0];
		
		_x[2] = _x[1] + -_arrowOff;
		_y[2] = room_height / 2;
		
		_x[3] = _x[1];
		_y[3] = room_height;
		
		_x[4] = _x[0];
		_y[4] = _y[3];
		
		_x[5] = _x[0] + -_arrowOff;
		_y[5] = _y[2];
		
		_x[6] = _x[0];
		_y[6] = _y[0];
		
		//top
		_x[7] = (room_width + _arrowOff) * grd_ps_xDraw[# 2,0];
		_y[7] = 0;
		
		_x[8] = (room_width + _arrowOff) * grd_ps_xDraw[# 3,0];
		_y[8] = _y[7];
		
		_x[9] = _x[8] + -_arrowOff;
		_y[9] = room_height / 2;
		
		_x[10] = _x[8];
		_y[10] = room_height;
		
		_x[11] = _x[7];
		_y[11] = _y[10];
		
		_x[12] = _x[7] + -_arrowOff;
		_y[12] = _y[9];
		
		_x[13] = _x[7];
		_y[13] = _y[7];
		
		draw_set_color(c_dkgray);
		
		draw_primitive_begin(pr_trianglefan);
		
		for(var _i = 0;_i < 7;_i++){
		    draw_vertex(_x[_i],_y[_i]);
		}
		
		draw_primitive_end();
		
		draw_set_color(c_white);
		
		draw_primitive_begin(pr_trianglefan);
		
		for(var _i = 7;_i < 14;_i++){
		    draw_vertex(_x[_i],_y[_i]);
		}
		
		draw_primitive_end();
	
	#endregion
	
	#region //party slots
	
		for(var _i = 0;_i < ds_list_size(lst_ps_slots);_i++){
			var
			_s = lst_ps_slots[| _i],
			_obj = global.grd_party_player[# _i,0];
			
			if(instance_exists(_s)){
				draw_set_color(c_black);
				draw_set_alpha(.5 * _s.image_alpha);
				
				draw_rectangle(_s.x,0,_s.x + -3,room_height,false);
				
				draw_set_color(c_white);
				draw_set_alpha(1)
				
				with _s{
					event_perform(ev_draw,0);
				}
				
				if(instance_exists(_obj)){
					var
					_spr = _obj.src[? CHAR_VAR_SPR_NEUTRAL],
					_ox = sprite_get_xoffset(_spr),
					_oy = sprite_get_yoffset(_spr) + -(100 * (_s.image_alpha + -1)),
					_str = _obj.src[? CHAR_VAR_NAMEDISP];
					
					//portrait
					draw_set_alpha(_s.image_alpha);
					
					draw_sprite_part(_spr,0,_ox + -(_s.image_xscale / 2),_oy + -room_height,_s.image_xscale,room_height,_s.x,0);
					
					draw_set_alpha(1);
					
					//name
					draw_set_font(ft_psOblique);
					
					var _x,_y;
					_x[0] = _s.x + -5;
					_y[0] = 490;
					
					_x[1] = _x[0] + lengthdir_x(string_width(_str) + 20,30);
					_y[1] = _y[0] + lengthdir_y(string_width(_str) + 20,30);
					
					_x[2] = _x[1];
					_y[2] = _y[1] + string_height(_str);
					
					_x[3] = _x[0];
					_y[3] = _y[0] + string_height(_str);
					
					_x[4] = _x[0];
					_y[4] = _y[0];
					
					draw_set_color(c_black);
					draw_set_alpha(.5 * _s.image_alpha);
					
					draw_primitive_begin(pr_trianglefan);
					
					for(var _i2 = 0;_i2 < 5;_i2++){
						draw_vertex(_x[_i2] + -2,_y[_i2] + -2);
					}
					
					draw_primitive_end();
					
					draw_set_color(c_white);
					draw_set_alpha(_s.image_alpha);
					
					draw_primitive_begin(pr_trianglefan);
					
					for(var _i2 = 0;_i2 < 5;_i2++){
						draw_vertex(_x[_i2],_y[_i2]);
					}
					
					draw_primitive_end();
					
					draw_set_color(c_dkgray);
					
					draw_text_transformed(_x[0],_y[0] + 5,_str,1,1,30);
					
					//level
					_str = "Lv." + string(_obj.level);
					
					for(var _i2 = 0;_i2 < 5;_i2++){
						_y[_i2] += string_height(_str) + 2;
					}
					
					_y[2] += -string_height(_str) * .5;
					_y[3] += -string_height(_str) * .5;
					
					draw_set_color(c_black);
					draw_set_alpha(.5 * _s.image_alpha);
					
					draw_primitive_begin(pr_trianglefan);
					
					for(var _i2 = 0;_i2 < 5;_i2++){
						draw_vertex(_x[_i2] + -2,_y[_i2] + -2);
					}
					
					draw_primitive_end();
					
					draw_set_color(c_white);
					draw_set_alpha(_s.image_alpha);
					
					draw_primitive_begin(pr_trianglefan);
					
					for(var _i2 = 0;_i2 < 5;_i2++){
						draw_vertex(_x[_i2],_y[_i2]);
					}
					
					draw_primitive_end();
					
					draw_set_color(c_dkgray);
					
					draw_text_transformed(_x[0],_y[0] + 2,_str,.5,.5,30);
					
					//hp
					_str = "HP";
					
					_x[0] += (_s.image_xscale * .1);
					_y[0] += 30;
					
					_x[1] = _x[0] + lengthdir_x((_s.image_xscale) + 15,30);
					_y[1] = _y[0] + lengthdir_y((_s.image_xscale) + 15,30);
					
					_x[2] = _x[1];
					_y[2] = _y[1] + string_height(_str) * .5;
					
					_x[3] = _x[0];
					_y[3] = _y[0] + string_height(_str) * .5;
					
					_x[4] = _x[0];
					_y[4] = _y[0];
					
					draw_set_color(c_black);
					draw_set_alpha(.5 * _s.image_alpha);
					
					draw_primitive_begin(pr_trianglefan);
					
					for(var _i2 = 0;_i2 < 5;_i2++){
						draw_vertex(_x[_i2] + 2,_y[_i2] + 2);
					}
					
					draw_primitive_end();
					
					draw_set_color(c_white);
					draw_set_alpha(_s.image_alpha);
					
					draw_primitive_begin(pr_trianglefan);
					
					for(var _i2 = 0;_i2 < 5;_i2++){
						draw_vertex(_x[_i2],_y[_i2]);
					}
					
					draw_primitive_end();
					
					draw_set_color(c_dkgray);
					
					draw_text_transformed(_x[0],_y[0] + 3,_str,.5,.5,30);
					
					var _x2,_y2;
					_x2[0] = _x[0] + lengthdir_x((string_width(_str) * .5) + 10,30);
					_y2[0] = _y[0] + lengthdir_y((string_width(_str) * .5) + 10,30);
					
					_x2[1] = _x[1] + lengthdir_x(-3,30);
					_y2[1] = _y[1] + lengthdir_y(-3,30);
					
					_x2[2] = _x[2] + lengthdir_x(-3,30);
					_y2[2] = _y[2] + lengthdir_y(-3,30) + -3;
					
					_x2[3] = _x[3] + lengthdir_x((string_width(_str) * .5) + 10,30);
					_y2[3] = _y[3] + lengthdir_y((string_width(_str) * .5) + 10,30) + -3;
					
					_x2[4] = _x2[0];
					_y2[4] = _y2[0];
					
					draw_primitive_begin(pr_trianglefan);
					
					for(var _i2 = 0;_i2 < 5;_i2++){
						draw_vertex(_x2[_i2],_y2[_i2]);
					}
					
					draw_primitive_end();
					
					draw_set_color(CC_HPGREEN);
					
					_x2[1] += (_x2[1] + -_x2[0]) * ((_obj.hpCurr + -_obj.hpMax) / _obj.hpMax);
					_y2[1] += (_y2[1] + -_y2[0]) * ((_obj.hpCurr + -_obj.hpMax) / _obj.hpMax);
					
					_x2[2] += (_x2[2] + -_x2[3]) * ((_obj.hpCurr + -_obj.hpMax) / _obj.hpMax);
					_y2[2] += (_y2[2] + -_y2[3]) * ((_obj.hpCurr + -_obj.hpMax) / _obj.hpMax);
					
					draw_primitive_begin(pr_trianglefan);
					
					for(var _i2 = 0;_i2 < 5;_i2++){
						draw_vertex(_x2[_i2],_y2[_i2]);
					}
					
					draw_primitive_end();
					
					draw_set_halign(fa_right);
					
					ktk_scr_draw_text_shadow_ext(_x[1] + -12,_y[1] + 2,string(_obj.hpCurr) + "/" + string(_obj.hpMax),c_white,c_white,_s.image_alpha,c_dkgray,c_dkgray,_s.image_alpha,2,0.5,0.5,30);
					
					draw_set_halign(fa_left);
					
					//en
					_str = "EN";
					
					_y[0] += 30;
					
					_x[1] = _x[0] + lengthdir_x((_s.image_xscale) + 15,30);
					_y[1] = _y[0] + lengthdir_y((_s.image_xscale) + 15,30);
					
					_x[2] = _x[1];
					_y[2] = _y[1] + string_height(_str) * .5;
					
					_x[3] = _x[0];
					_y[3] = _y[0] + string_height(_str) * .5;
					
					_x[4] = _x[0];
					_y[4] = _y[0];
					
					draw_set_color(c_black);
					draw_set_alpha(.5 * _s.image_alpha);
					
					draw_primitive_begin(pr_trianglefan);
					
					for(var _i2 = 0;_i2 < 5;_i2++){
						draw_vertex(_x[_i2] + 2,_y[_i2] + 2);
					}
					
					draw_primitive_end();
					
					draw_set_color(c_white);
					draw_set_alpha(_s.image_alpha);
					
					draw_primitive_begin(pr_trianglefan);
					
					for(var _i2 = 0;_i2 < 5;_i2++){
						draw_vertex(_x[_i2],_y[_i2]);
					}
					
					draw_primitive_end();
					
					draw_set_color(c_dkgray);
					
					draw_text_transformed(_x[0],_y[0] + 3,_str,.5,.5,30);
					
					var _x2,_y2;
					_x2[0] = _x[0] + lengthdir_x((string_width(_str) * .5) + 10,30);
					_y2[0] = _y[0] + lengthdir_y((string_width(_str) * .5) + 10,30);
					
					_x2[1] = _x[1] + lengthdir_x(-3,30);
					_y2[1] = _y[1] + lengthdir_y(-3,30);
					
					_x2[2] = _x[2] + lengthdir_x(-3,30);
					_y2[2] = _y[2] + lengthdir_y(-3,30) + -3;
					
					_x2[3] = _x[3] + lengthdir_x((string_width(_str) * .5) + 10,30);
					_y2[3] = _y[3] + lengthdir_y((string_width(_str) * .5) + 10,30) + -3;
					
					_x2[4] = _x2[0];
					_y2[4] = _y2[0];
					
					draw_primitive_begin(pr_trianglefan);
					
					for(var _i2 = 0;_i2 < 5;_i2++){
						draw_vertex(_x2[_i2],_y2[_i2]);
					}
					
					draw_primitive_end();
					
					draw_set_color(CC_ENBLUE);
					
					_x2[1] += (_x2[1] + -_x2[0]) * ((_obj.enCurr + -_obj.enMax) / _obj.enMax);
					_y2[1] += (_y2[1] + -_y2[0]) * ((_obj.enCurr + -_obj.enMax) / _obj.enMax);
					
					_x2[2] += (_x2[2] + -_x2[3]) * ((_obj.enCurr + -_obj.enMax) / _obj.enMax);
					_y2[2] += (_y2[2] + -_y2[3]) * ((_obj.enCurr + -_obj.enMax) / _obj.enMax);
					
					draw_primitive_begin(pr_trianglefan);
					
					for(var _i2 = 0;_i2 < 5;_i2++){
						draw_vertex(_x2[_i2],_y2[_i2]);
					}
					
					draw_primitive_end();
					
					draw_set_halign(fa_right);
					
					ktk_scr_draw_text_shadow_ext(_x[1] + -12,_y[1] + 2,string(_obj.enCurr) + "/" + string(_obj.enMax),c_white,c_white,_s.image_alpha,c_dkgray,c_dkgray,_s.image_alpha,2,0.5,0.5,30);
					
					draw_set_halign(fa_left);
					draw_set_alpha(1);
				}
			}
			
			draw_set_color(c_white);
		}
		
	#endregion
	
	#region //equip portrait
	
		if(scr_exists(ps_portEquip,asset_object)){
			var _menu = ds_stack_top(global.stk_menu);
			
			if(scr_exists(_menu,asset_object)){
				var
				_memX = global.lst_activePartySlots[| _menu.menu_x],
				_mem = global.grd_party_player[# _memX,0],
				_portCenterX = 950,
				_portCenterY = 360;
				
				if(instance_exists(_mem)){
					ps_portEquip.x = _portCenterX + ps_portX;
					ps_portEquip.y = _portCenterY + ps_portY;
					
					if(ps_portEquip.sprite_index != _mem.src[? CHAR_VAR_SPR_NEUTRAL] && _menu.link_panel.txt[0] == "party/equip/.."){
						ps_portEquip.sprite_index = _mem.src[? CHAR_VAR_SPR_NEUTRAL];
						ps_portEquip.image_alpha = -2;
						
						ps_equipMem = _mem;
					}
					
					var
					_iww = 120 * -sign(ps_tgtPortX), //info window width
					_xFlip = _iww > 0, //if true, adjust x offsets of stat text and label text accordingly
					_x1 = 0,
					_y1 = 0,
					_x2 = 0,
					_y2 = 0,
					_name = "-none-",
					_strArr = [
						"---",
						"---",
						"---",
						"---",
						"---"
					],
					_str = "",
					_label = "";
					
					draw_set_alpha(ps_portEquip.image_alpha);
					
					draw_sprite(ps_portEquip.sprite_index,1,_portCenterX + ps_portX,720 + ps_portY);
					
					//draw equipment info
					if(
						(_menu.menu_y < 8 && _menu.link_panel.txt[0] == "party/equip/..") ||
						(_menu.menu_y < ds_list_size(global.lst_inv_acts) && _menu.link_panel.txt[0] == "party/equip/act/..")
					){
						//act
						if(_menu.link_panel.txt[0] == "party/equip/.."){
							ps_tgtPortX = ps_equipMem.src[? CHAR_VAR_PSDO_ACT_X];
							ps_tgtPortY = ps_equipMem.src[? CHAR_VAR_PSDO_ACT_Y];
						}
						
						_iww = 120 * -sign(ps_tgtPortX);
						_xFlip = _iww > 0;
						_x1 = ps_portEquip.x + -ps_tgtPortX;
						_y1 = ps_portEquip.y + -ps_tgtPortY;
						_x2 = _x1 + -(sign(ps_tgtPortX) * 50);
						_y2 = _y1 + -clamp(abs(ps_tgtPortY) * .8,40,80);
						_strArr = [
							"---", //pwr
							"---", //acc
							"---", //typ
							"---", //tgt
							"---" //ele
						];
						_str = "";
						_label = "PWR:\nACC:\nTYP:\nTGT:\nELE:";
						
						var _act = ps_equipMem.act[_menu.menu_y];
						
						if(_menu.link_panel.txt[0] == "party/equip/act/.."){
							_act = global.lst_inv_acts[| _menu.menu_y];
						}
						
						if(_act != undefined && instance_exists(_act)){
							_name = _act.name;
							_strArr[0] = string(round(_act.pwr)) + "x" + string(_act.hitCount * _act.hitSimul);
							_strArr[1] = string(round(_act.acc));
							
							switch(_act.atkScale){
								case CHAR_VAR_MATK:
									_strArr[2] = "M"
									
									break;
								case CHAR_VAR_FATK:
									_strArr[2] = "F"
									
									break;
								case CHAR_VAR_SATK:
									_strArr[2] = "S"
									
									break;
							}
							
							if(_act.tgtEnemy){
								switch(_act.defScale){
									case CHAR_VAR_MDEF:
										_strArr[2] += "vM"
										
										break;
									case CHAR_VAR_FDEF:
										_strArr[2] += "vF"
										
										break;
									case CHAR_VAR_SDEF:
										_strArr[2] += "vS"
										
										break;
								}
							}
							
							switch(_act.tgtType){
								case ACT_TGT_SINGLE:
									_strArr[3] = "SINGLE"
									
									break;
								case ACT_TGT_WIDE:
									_strArr[3] = "WIDE"
									
									break;
								case ACT_TGT_RANDOM:
									_strArr[3] = "RANDOM"
									
									break;
							}
							
							switch(_act.ele){
								case CHAR_VAR_ELE_FIR:
									_strArr[4] = "FIRE"
									
									break;
								case CHAR_VAR_ELE_ICE:
									_strArr[4] = "ICE"
									
									break;
								case CHAR_VAR_ELE_DRK:
									_strArr[4] = "DARK"
									
									break;
								case CHAR_VAR_ELE_LGT:
									_strArr[4] = "LIGHT"
									
									break;
								case CHAR_VAR_ELE_ELC:
									_strArr[4] = "ELEC"
									
									break;
								case CHAR_VAR_ELE_NAT:
									_strArr[4] = "NATURE"
									
									break;
							}
						}
						
						for(var _i = 0;_i < 5;_i++){
							_str += _strArr[_i] + "\n";
						}
					
						
					
					}else if(
						(_menu.menu_y < 10 && _menu.link_panel.txt[0] == "party/equip/..") ||
						(_menu.menu_y < ds_list_size(global.lst_inv_arms) && _menu.link_panel.txt[0] == "party/equip/armor/..")
					){
						//armor
						if(_menu.link_panel.txt[0] == "party/equip/.."){
							ps_tgtPortX = ps_equipMem.src[? CHAR_VAR_PSDO_ARM_X];
							ps_tgtPortY = ps_equipMem.src[? CHAR_VAR_PSDO_ARM_Y];
						}
						
						_iww = 120 * -sign(ps_tgtPortX);
						_xFlip = _iww > 0;
						_x1 = ps_portEquip.x + -ps_tgtPortX;
						_y1 = ps_portEquip.y + -ps_tgtPortY;
						_x2 = _x1 + -(sign(ps_tgtPortX) * 50);
						_y2 = _y1 + -clamp(abs(ps_tgtPortY) * .8,40,80);
						_strArr = [
							"---", //main
							"---", //fir
							"---", //ice
							"---", //elc
							"---", //nat
							"---", //lgt
							"---" //drk
						];
						_str = "";
						_label = "\nFIR:\nICE:\nELC:\nNAT:\nLGT:\nDRK:";
						
						var _arm = _menu.link_panel.txt[0] == "party/equip/armor/.." ?
							global.lst_inv_arms[| _menu.menu_y] :
							ps_equipMem.src[? "char_var_arm" + string(_menu.menu_y + -8)];
						
						if(_arm != noone && _arm != undefined && instance_exists(_arm)){
							_name = _arm.name;
							
							switch(_arm.type){
								case CHAR_VAR_HP:
									_label = "HP" + _label;
									break;
									
								case CHAR_VAR_EN:
									_label = "EN" + _label;
									break;
									
								case CHAR_VAR_MATK:
									_label = "M-ATK" + _label;
									break;
									
								case CHAR_VAR_MDEF:
									_label = "M-DEF" + _label;
									break;
									
								case CHAR_VAR_FATK:
									_label = "F-ATK" + _label;
									break;
									
								case CHAR_VAR_FDEF:
									_label = "F-DEF" + _label;
									break;
									
								case CHAR_VAR_SATK:
									_label = "S-ATK" + _label;
									break;
									
								case CHAR_VAR_SDEF:
									_label = "S-DEF" + _label;
									break;
									
								case CHAR_VAR_ACC:
									_label = "ACC" + _label;
									break;
									
								case CHAR_VAR_EVA:
									_label = "EVA" + _label;
									break;
									
								case CHAR_VAR_SPD:
									_label = "SPD" + _label;
									break;
									
								case CHAR_VAR_MISC:
									_label = "MISC" + _label;
									break;
							}
							
							_strArr[0] = "+" + string(_arm.pwr);
							_strArr[1] = "+" + string(_arm.ele_fir * _arm.plus);
							_strArr[2] = "+" + string(_arm.ele_ice * _arm.plus);
							_strArr[3] = "+" + string(_arm.ele_elc * _arm.plus);
							_strArr[4] = "+" + string(_arm.ele_nat * _arm.plus);
							_strArr[5] = "+" + string(_arm.ele_lgt * _arm.plus);
							_strArr[6] = "+" + string(_arm.ele_drk * _arm.plus);
						}
						
						for(var _i = 0;_i < 7;_i++){
							_str += _strArr[_i] + "\n";
						}
					
					}else if(
						(_menu.menu_y < ds_grid_height(_menu.grd_txt) + -1 && _menu.link_panel.txt[0] == "party/equip/..") ||
						(_menu.menu_y < ds_list_size(global.lst_inv_classes) && _menu.link_panel.txt[0] == "party/equip/class/..")
					){
						//class
						if(_menu.link_panel.txt[0] == "party/equip/.."){
							ps_tgtPortX = _mem.src[? CHAR_VAR_PSDO_CLS_X];
							ps_tgtPortY = _mem.src[? CHAR_VAR_PSDO_CLS_Y];
						}
						
						_iww = 120 * -sign(ps_tgtPortX);
						_xFlip = _iww > 0;
						_x1 = ps_portEquip.x + -ps_tgtPortX;
						_y1 = ps_portEquip.y + -ps_tgtPortY;
						_x2 = _x1 + -(sign(ps_tgtPortX) * 50);
						_y2 = _y1 + -clamp(abs(ps_tgtPortY) * .8,40,80);
						_strArr = [
							"---", //lvl
							"---" //skills
						];
						_str = "";
						_label = "LEVEL:\nSKILLS:";
						
						var _cls = _menu.link_panel.txt[0] == "party/equip/class/.." ?
							global.lst_inv_classes[| _menu.menu_y] :
							_mem.class[_menu.menu_y + -10];
						
						if(_cls != undefined && instance_exists(_cls)){
							_name = _cls.name;
							
							_strArr[0] = string(ds_grid_get_sum(_cls.grd_skills,0,0,ds_grid_width(_cls.grd_skills) + -1,ds_grid_height(_cls.grd_skills) + -1));
							
							var _skills = 0;
							
							for(var _ix = 0;_ix < ds_grid_width(_cls.grd_skills);_ix++){
								for(var _iy = 0;_iy < ds_grid_height(_cls.grd_skills);_iy++){
									_skills += sign(_cls.grd_skills[# _ix,_iy]);
								}
							}
							
							_strArr[1] = string(_skills);
						}
						
						for(var _i = 0;_i < 2;_i++){
							_str += _strArr[_i] + "\n";
						}
						
					}else{
						draw_set_alpha(0);
						
						if(_menu.link_panel.txt[0] == "party/equip/.."){
							ps_tgtPortX = 0;
							ps_tgtPortY = 0;
						}
					}
					
					draw_set_font(ft_menuSub);
					draw_set_halign(!_xFlip ? fa_right : fa_left);
					draw_set_valign(fa_bottom);
					draw_set_color(c_dkgray);
					draw_set_alpha(ps_portEquip.image_alpha * .7);
					
					draw_rectangle(_x2,_y2,_x2 + _iww,_y2 + string_height(_label) + 4,false);
					
					draw_set_alpha(ps_portEquip.image_alpha);
					draw_set_color(c_ltgray);
					
					draw_line_width(_x1,_y1,_x2,_y2,4);
					draw_line_width(_x2,_y2,_x2 + _iww,_y2,4);
					
					draw_set_color(c_dkgray);
					
					draw_line_width(_x1,_y1,_x2,_y2,2);
					draw_line_width(_x2,_y2,_x2 + _iww,_y2,2);
					
					ktk_scr_draw_text_stroke(_x2,_y2,_name,c_dkgray,c_ltgray,1,10);
					
					draw_set_valign(fa_top);
					draw_set_halign(fa_right);
					
					ktk_scr_draw_text_shadow(_x2 + (_iww * _xFlip) + -3,_y2 + 4,_str,c_white,c_dkgray,1);
					
					draw_set_halign(fa_left);
					
					ktk_scr_draw_text_shadow(_x2 + (_iww * !_xFlip) + 3,_y2 + 4,_label,c_white,c_dkgray,1);
					
					//stats window
					var
					_drawX = 20,
					_drawY = 500,
					_drawX2 = 90,
					_drawGap = 50;
					
					_label = "HP:\nEN:\nACC:\nEVA:\nSPD:\nMISC:";
					_str =
					string(ps_equipMem.hpMax) + "\n" +
					string(ps_equipMem.enMax) + "\n" +
					(ps_equipMem.acc > 0 ? "+" : "") + string(ps_equipMem.acc) + "\n" +
					(ps_equipMem.eva > 0 ? "+" : "") + string(ps_equipMem.eva) + "\n" +
					(ps_equipMem.spd > 0 ? "+" : "") + string(ps_equipMem.spd) + "\n" +
					(ps_equipMem.misc > 0 ? "+" : "") + string(ps_equipMem.misc) + "\n";
					
					draw_set_alpha(ps_portEquip.image_alpha * .7);
					
					draw_rectangle(_drawX + -5,_drawY,_drawX + (_drawX2 * 3) + (_drawGap * 2) + 5,_drawY + string_height(_label),false);
					
					draw_set_alpha(ps_portEquip.image_alpha);
					
					ktk_scr_draw_text_shadow(_drawX,_drawY,_label,c_white,c_dkgray,1);
					
					_drawX += _drawX2;
					draw_set_halign(fa_right);
					
					ktk_scr_draw_text_shadow(_drawX,_drawY,_str,c_white,c_dkgray,1);
					
					_drawX += _drawGap
					draw_set_halign(fa_left);
					_label = "M-ATK:\nF-ATK:\nS-ATK:\nM-DEF:\nF-DEF:\nS-DEF:";
					_str =
					(ps_equipMem.mAtk > 0 ? "+" : "") + string(ps_equipMem.mAtk) + "\n" +
					(ps_equipMem.fAtk > 0 ? "+" : "") + string(ps_equipMem.fAtk) + "\n" +
					(ps_equipMem.sAtk > 0 ? "+" : "") + string(ps_equipMem.sAtk) + "\n" +
					(ps_equipMem.mDef > 0 ? "+" : "") + string(ps_equipMem.mDef) + "\n" +
					(ps_equipMem.fDef > 0 ? "+" : "") + string(ps_equipMem.fDef) + "\n" +
					(ps_equipMem.sDef > 0 ? "+" : "") + string(ps_equipMem.sDef) + "\n";
					
					ktk_scr_draw_text_shadow(_drawX,_drawY,_label,c_white,c_dkgray,1);
					
					_drawX += _drawX2;
					draw_set_halign(fa_right);
					
					ktk_scr_draw_text_shadow(_drawX,_drawY,_str,c_white,c_dkgray,1);
					
					_drawX += _drawGap
					draw_set_halign(fa_left);
					_label = "FIR:\nICE:\nELC:\nNAT:\nLGT:\nDRK:";
					_str =
					(ps_equipMem.ele_fir > 0 ? "+" : "") + string(ps_equipMem.ele_fir) + "\n" +
					(ps_equipMem.ele_ice > 0 ? "+" : "") + string(ps_equipMem.ele_ice) + "\n" +
					(ps_equipMem.ele_elc > 0 ? "+" : "") + string(ps_equipMem.ele_elc) + "\n" +
					(ps_equipMem.ele_nat > 0 ? "+" : "") + string(ps_equipMem.ele_nat) + "\n" +
					(ps_equipMem.ele_lgt > 0 ? "+" : "") + string(ps_equipMem.ele_lgt) + "\n" +
					(ps_equipMem.ele_drk > 0 ? "+" : "") + string(ps_equipMem.ele_drk) + "\n";
					
					ktk_scr_draw_text_shadow(_drawX,_drawY,_label,c_white,c_dkgray,1);
					
					_drawX += _drawX2;
					draw_set_halign(fa_right);
					
					ktk_scr_draw_text_shadow(_drawX,_drawY,_str,c_white,c_dkgray,1);
					
					draw_set_alpha(1);
					draw_set_color(c_white);
				}
			}
		}
		
	#endregion
	
	#region //status portrait
	
		if(scr_exists(ps_portStatus,asset_object)){
			var
			_menu = ds_stack_top(global.stk_menu),
			_memX = global.lst_activePartySlots[| _menu.menu_x],
			_mem = global.grd_party_player[# _memX,0],
			_portCenterX = 640;
			
			if(ps_portStatus.sprite_index != _mem.src[? CHAR_VAR_SPR_NEUTRAL]){
				ps_portStatus.sprite_index = _mem.src[? CHAR_VAR_SPR_NEUTRAL];
				ps_portStatus.image_alpha = 0;
			}
			
			draw_set_alpha(ps_portStatus.image_alpha);
			
			draw_sprite(ps_portStatus.sprite_index,1,_portCenterX,720);
		}
	
	#endregion
	
	draw_set_color(c_white);
	draw_set_alpha(1);

#endregion

#region //title bar

	draw_set_font(ft_menuTitle);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	if(scr_exists(ps_portStatus,asset_object)){
		var _m = ds_stack_top(global.stk_menu);
		
		txt_titleDesc = _m.grd_txt[# _m.menu_x,0];
	}
	
	var
	_titleW = string_width(txt_title) + 15,
	_titleH = string_height(txt_title),
	_ctrlH = 22,
	_titleY = (_titleH + _ctrlH) * (transCurr + -1);
	
	draw_set_color(c_dkgray);
	draw_set_alpha(.9);
	
	draw_rectangle(0,_titleY,1280,_titleY + _titleH,false);
	
	draw_set_color(c_gray);
	
	draw_rectangle(0,_titleY + _titleH,1280,_titleY + _titleH + _ctrlH,false);
	
	draw_set_color(c_white);
	draw_set_alpha(1);
	
	draw_rectangle(0,_titleY,_titleW,_titleY + _titleH,false);
	draw_rectangle(0,_titleY + _titleH,1280,_titleY + _titleH + -1,false);
	draw_triangle(_titleW + -1,_titleY + -1,_titleW + -1,_titleY + _titleH,_titleW + 30,_titleY + -1,false);
	
	draw_set_alpha(1);
	draw_set_color(c_dkgray);
	
	draw_text(10,_titleY + 10,txt_title);
	
	draw_set_color(c_white);
	draw_set_font(ft_menuSub);
	
	var
	_s = "",
	_ctrlArr = ["[Z]","[X]","[C]","[BkSpc]"];
	
	for(var _i = 0;_i < 4;_i++){
		if(txt_ctrl[_i] != ""){
			_s += _ctrlArr[_i] + ":" + txt_ctrl[_i] + "    ";
		}
	}
	
	ktk_scr_draw_text_shadow(8,_titleY + _titleH + 2,_s,c_white,c_dkgray,2);
	
	draw_set_font(ft_menuButton);
	draw_set_halign(fa_right);
	
	ktk_scr_draw_text_shadow(1270,_titleY + 5,txt_titleDesc,c_white,c_gray,1);
	
	//title shadow
	draw_set_color(c_black);
	gpu_set_blendmode(bm_subtract);
	
	draw_rectangle_color(0,_titleY + _titleH + _ctrlH,1280,_titleY + _titleH + _ctrlH + 6,c_white,c_white,c_black,c_black,false);
	
	gpu_set_blendmode(bm_normal);

#endregion

#region //bottom bar

	draw_set_font(ft_menuDesc);
	draw_set_halign(fa_left);
	draw_set_color(c_dkgray);
	draw_set_alpha(.9);
	
	var
	_descH = 720 + -string_height("1\n2") + -20,
	_descY = scr_exists(ps_portStatus,asset_object) ? 800 : -((_descH) * (transCurr + -1));
	
	draw_rectangle(0,_descY + 720,1280,_descY + _descH,false);
	
	draw_set_color(c_white);
	draw_set_alpha(1);
	
	ktk_scr_draw_text_shadow_ext_w(10,_descY + _descH + 10,txt_desc,c_white,c_white,1,c_gray,c_gray,1,1,1,1,0,-1,1280 + -20);
	
	draw_rectangle(0,_descY + _descH,1280,_descY + _descH + -1,false);
	
	draw_set_font(ft_menuSub);
	draw_set_halign(fa_right);
	
	if(txt_descLabel != ""){
		var
		_x1 = 1280 + -string_width(txt_descLabel) + -10,
		_y1 = _descH,
		_x2 = _x1,
		_y2 = _y1 + -string_height(txt_descLabel),
		_x3 = _x1 + -10,
		_y3 = _y1;
	
		draw_rectangle(1280,_descY + _y1,_x1,_descY + _y2,false);
		draw_triangle(_x1,_descY + _y1,_x2 + -1,_descY + _y2,_x3,_descY + _y3,false);
		
		draw_set_color(c_dkgray);
		
		draw_text(1280 + -8,_descY + _y2,txt_descLabel);
	}
	
	gpu_set_blendmode(bm_normal);
	draw_set_color(c_white);
	draw_set_alpha(1);

#endregion