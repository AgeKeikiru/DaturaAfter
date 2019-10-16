/// @description Insert description here

var _m = ds_stack_top(global.stk_menu);

if(title){
	var _str = "[A.Kei.KI] [" + GAMEVER + "]" + (CANARY ? " [CANARY BUILD]" : "") + (DEBUG ? " [DEBUG ACTIVE]" : "");
	
	draw_set_color(c_black);
		
	draw_rectangle(0,0,room_width,room_height,false);
	
	draw_set_color(c_white);
	draw_set_font(ft_menuSub);
	draw_set_halign(fa_left);
	draw_set_valign(fa_bottom);
	
	draw_rectangle(0,30,room_width,room_height + -30,false);
	
	draw_sprite(spr_title,0,0,0);
	draw_text(10,room_height + -3,_str);
	
	if(scr_exists(_m,asset_object) && !_m.submenu){
		draw_set_font(ft_dungeonBoldLarge);
		draw_set_halign(fa_right);
		draw_set_valign(fa_top);
		
		var
		_x = 1050,
		_y = 520,
		_h = string_height("A"),
		_yGap = _h + 10;
		
		for(var _i = 0;_i < 3;_i++){
			draw_set_color(c_dkgray);
			
			if(_i == _m.menu_y){
				draw_rectangle(0,_y,room_width,_y + _h,false);
				draw_set_color(c_white);
			}
			
			draw_set_alpha(_m.grd_scr[# 0,_i] != noone ? 1 : .5);
			
			draw_text(_x,_y + 8,_m.grd_txt[# 0,_i]);
			
			draw_set_alpha(1);
			
			_y += _yGap;
		}
	}
}else{
	var
	_bgTop = 0,
	_bgBot = room_height;
	
	#region //menuBG bottom
	
		var
		_px = [0,menuBG_curr + 10,menuBG_curr + menuBG_w2,0],
		_py = [_bgTop,_bgTop,_bgBot,_bgBot];
		
		draw_primitive_begin(pr_trianglefan);
		draw_set_color(c_white);
		draw_set_alpha(1);
		
		if(menuBG_curr > -menuBG_w2){
			for(var _i = 0;_i < 5;_i++){
				draw_vertex(_px[_i % 4],_py[_i % 4]);
			}
		}
		
		draw_primitive_end();
		draw_set_color(c_white);
	
	#endregion
	
	#region //draw party lead
	
		var
		_lead = global.grd_party_player[# 0,0],
		_leadX = 920 + -(100 * (transCurr + -1)),
		_spr = noone;
		
		if(scr_exists(_lead,asset_object)){
			_spr = _lead.src[? CHAR_VAR_SPR_NEUTRAL];
		}
		
		switch(txt_title){
			case "MARKET":
				_spr = spr_npc_merchant;
				break;
			case "MISSION":
			case "CHIP LAB":
				_spr = spr_npc_tear;
				break;
			case "SOCIAL":
				_spr = noone;
		}
		
		if(scr_exists(_spr,asset_sprite)){
			var _arr = sprite_get_uvs(_spr,0);
			
			//drop shadow
			if(global.set_shaders){
				shader_set(shd_silhouette);
				shader_set_uniform_f(suni_silhouette_col,0.25,0.25,0.25,transCurr);
				shader_set_uniform_f(suni_silhouette_grad,false);
				
				draw_sprite(_spr,0,_leadX + -(35 * transCurr),720);
				
				shader_set_uniform_f(suni_silhouette_col,1,1,1,transCurr);
				shader_set_uniform_f(suni_silhouette_grad,false);
				
				draw_sprite(_spr,0,_leadX + -(8 * transCurr),720);
				
				shader_reset();
			}else{
				draw_sprite_ext(_spr,0,_leadX + -(10 * transCurr),720,1,1,0,c_black,0.8 * transCurr);
			}
			
			var
			_blend = c_white,
			_key = layer_background_get_sprite(global.ly_bg[0]);
			
			if(ds_map_exists(global.map_bgCol,_key) && !DEBUG){
				_blend = global.map_bgCol[? _key];
			}
			
			draw_sprite_ext(_spr,0,_leadX,720,1,1,0,_blend,transCurr);
		}
	
	#endregion
	
	#region //menuBG top
	
		var
		_px = [0,menuBG_curr,menuBG_curr + menuBG_w,0],
		_py = [_bgTop,_bgTop,_bgBot,_bgBot],
		_alpha = max(transCurr + -0.9,0) / 0.1;
		
		draw_primitive_begin(pr_trianglefan);
		draw_set_color(c_dkgray);
		draw_set_alpha(1);
		
		if(menuBG_curr > -menuBG_w2){
			for(var _i = 0;_i < 5;_i++){
				draw_vertex(_px[_i % 4],_py[_i % 4]);
			}
		}
		
		draw_primitive_end();
		draw_set_color(c_white);
		draw_set_alpha(0.1 * _alpha);
		draw_set_font(ft_menuTitle);
		draw_set_halign(fa_right);
		draw_set_valign(fa_top);
		
		draw_text(menuBG_curr,80,"BABEL XR \nNAV SYSTEM");
		
		draw_set_font(rndTxt_ft);
		draw_set_halign(fa_left);
		draw_set_valign(fa_bottom);
		
		if(visible && menuBG_curr > 1){
			if(rndTxt_draw < string_length(rndTxt_tgt)){
				rndTxt_draw++;
			}
			
			draw_text_ext_transformed(10,600,string_copy(rndTxt_tgt,1,rndTxt_draw),-1,menuBG_tgt / 0.5,0.5,0.5,0);
		}
		
		draw_set_alpha(1);
	
	#endregion
	
	#region //class upgrade screen
	
		if(
			variable_global_exists("labMenu") && scr_exists(global.labMenu,asset_object) &&
			variable_global_exists("labObj") && scr_exists(global.labObj,asset_object)
		){
			var
			_d_xStart = 580 + global.labMenu.link_panel.x + -global.labMenu.link_panel.tgt_xPos,
			_d_yStart = 170,
			_d_x = _d_xStart,
			_d_y = _d_yStart,
			_d_xGap = 40,
			_d_yGap = 120,
			_d_b = 10,
			
			_d_pw = 500,
			_d_pw2 = _d_pw * 1.0,
			_d_ph = _d_yGap + -30,
			_d_po = _d_xGap,
			
			_d_px = [
				0,
				_d_pw,
				_d_pw + _d_po,
				_d_po
			],
			
			_d_py = [
				0,
				0,
				_d_ph,
				_d_ph
			],
			
			_d_px2 = [
				0,
				_d_pw2 + (_d_po * 2),
				_d_pw2 + _d_po,
				_d_po
			],
			
			_d_py2 = [
				0,
				0,
				_d_ph,
				_d_ph
			],
			
			_d_a = global.labMenu.link_panel.image_xscale / global.labMenu.link_panel.tgt_xScale,
			_d_hx = 40,
			_d_hx2 = _d_hx + 20,
			_d_hy = 170,
			_d_hy2 = _d_hy + 150,
			_d_hw = 280,
			_d_hh = 160,
			_ix = global.labMenu.menu_x,
			_iy = 0,
			_str = "",
			
			_tierName = ["General","Primary","Primary 2","Extended","Specialist"],
			
			_tierDesc = [
				"Main Skill: Skills that scale based on the user's level. Main Skills only take effect when the class chip is in slot 1." +
				"\n\nSub Skill: Stat boosts that have a smaller effect per level than normal skills, but have a very large level cap. Sub skills are useful if you have no interest in a chass chip's primary functions.",
				"Primary Skills include a set of passive stat boosts important to the class, as well as the class' most basic features. Examining these skills will help identify the role they fill in a party.",
				"",
				"Unlocked at Lv.10, Extended Skills typically include auxiliary abilities that either broaden the class' functionality or modify its Primary Skills. Experience and familiarity with a class is recommended before deciding which Extended Skills to invest in.",
				"Unlocked at Lv.20, Specialist Skills are a class' most powerful tools. While their effects can be devastating, Specialist Skills often heavily rely on earlier skills and thus a proper understanding of the class and the user's role in the party is imperative to using these skills to their full potential."
			],
			
			_tierNum = ["G","I","II","III","IV"];
			
			_tierDesc[2] = _tierDesc[1];
			
			draw_set_alpha(1 * _d_a);
			draw_set_font(ft_dungeonBoldLarge);
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			_str = global.labObj.name;
			
			ktk_scr_draw_text_shadow(_d_hx,_d_hy,_str,c_white,c_gray,3);
			
			_str = _tierName[_ix];
			
			ktk_scr_draw_text_shadow(_d_hx,_d_hy2,_str,c_white,c_gray,3);
			
			var _skills = 0;
								
			for(var _xx = 0;_xx < ds_grid_width(global.labObj.grd_skills);_xx++){
				for(var _yy = 0;_yy < ds_grid_height(global.labObj.grd_skills);_yy++){
					_skills += sign(global.labObj.grd_skills[# _xx,_yy]);
					
					global.labMenu.grd_ex_str[# _xx + 1,_yy] = string(global.labObj.grd_skills[# _xx,_yy]) + "/5";
				}
			}
			
			global.labMenu.grd_ex_str[# 0,1] = string(global.labObj.ss_level) + "/30";
			
			draw_set_font(ft_dungeonBold);
			_str = "lv." + string(global.labObj.level) + "/30"
			+ "\n\"" + global.labObj.cName + "\""
			+ "\nSkills: " + string(_skills)
			+ "\nNext Level: " + string(scr_calcLevelupCost(global.labObj)) + "g";
			
			ktk_scr_draw_text_shadow(_d_hx2,_d_hy + 45,_str,c_white,c_gray,2);
			
			_str = _tierDesc[_ix];
			
			ktk_scr_draw_text_shadow_ext_w(_d_hx2,_d_hy2 + 45,_str,c_white,c_white,1,c_gray,c_gray,1,1,1,1,0,-1,350);
			
			draw_set_color(c_gray);
			draw_set_halign(fa_left);
			draw_set_alpha(1 * _d_a);
			draw_set_color(c_white);
			
			if(variable_instance_exists(global.labMenu,"grd_ex_icon") && variable_instance_exists(global.labMenu,"grd_ex_str")){
				for(_iy = 0;_iy < ds_grid_height(global.labMenu.grd_txt);_iy++){
					var
					_highlight = global.labMenu.menu_y == _iy,
					_border = 0,
					_iconX = _d_x + 34,
					_iconY = _d_y + 2,
					_iconB = 0, //bezel
					_iconS = 1.5, //scale
					_iconW = sprite_get_width(spr_icon_test) * _iconS; //width
					
					_str = global.labMenu.grd_txt[# _ix,_iy];
					
					image_blend = (global.labObj.level >= (_ix + -2) * 10) ? c_white : c_gray;
					draw_set_color(c_dkgray);
					draw_set_alpha((_highlight ? 0.95 : 0.8) * _d_a);
					draw_set_font(ft_dungeonBoldLarge);
					draw_set_halign(fa_left);
					draw_set_valign(fa_top);
					
					draw_primitive_begin(pr_trianglefan);
					
					for(var _i = 0;_i < 5;_i++){
						draw_vertex(_d_x + _d_px[_i % 4],_d_y + _d_py[_i % 4]);
					}
					
					draw_primitive_end();
					
					draw_set_color(_highlight ? c_white : c_ltgray);
					draw_set_alpha(_d_a);
					
					draw_primitive_begin(pr_trianglefan);
					
					for(var _i = 0;_i < 5;_i++){
						draw_vertex(_d_x + (_d_px2[_i % 4] * 0.3),_d_y + (_d_py2[_i % 4] * 0.3));
					}
					
					draw_primitive_end();
					
					draw_set_halign(fa_right);
					draw_set_valign(fa_bottom);
					draw_set_color(c_white);
					draw_set_alpha(_d_a * 0.1);
					
					draw_text_transformed(_d_x + _d_px[2] + -35,_d_y + _d_py[2] + 20,_tierNum[_ix],2,2,0);
					
					draw_set_color(_highlight ? c_white : c_ltgray);
					draw_set_alpha(_d_a);
					draw_set_halign(fa_left);
					draw_set_valign(fa_top);
					
					while(_border < 15){
						var
						_bx = [
							_d_x + _d_px[0] + _border,
							_d_x + _d_px[1] + -_border,
							_d_x + _d_px[2] + -_border,
							_d_x + _d_px[3] + _border
						],
						
						_by = [
							_d_y + _d_py[0] + _border,
							_d_y + _d_py[1] + _border,
							_d_y + _d_py[2] + -_border,
							_d_y + _d_py[3] + -_border
						];
						
						if(!(13 > _border && _border > 6)){
							for(var _i = 0;_i < 4;_i++){
								draw_line(_bx[_i % 4],_by[_i % 4],_bx[(_i + 1) % 4],_by[(_i + 1) % 4]);
							}
						}
						
						_border += 0.5;
					}
					
					draw_rectangle(_iconX + -_iconB,_iconY + -_iconB,_iconX + _iconW + _iconB,_iconY + _iconW + _iconB,false);
					
					if(!_highlight){
						image_blend = c_gray;
					}
					
					draw_sprite_ext(global.labMenu.grd_ex_icon[# _ix,_iy],0,_iconX,_iconY,_iconS,_iconS,0,image_blend,draw_get_alpha());
					
					ktk_scr_draw_text_shadow(_d_x + 95,_d_y + 40,_str,image_blend,c_dkgray,2);
					
					_str = global.labMenu.grd_ex_str[# _ix,_iy];
					draw_set_font(ft_dungeonBold);
					draw_set_color(c_dkgray);
					
					draw_text(_d_x + 100,_d_y + 10,_str);
					
					image_blend = c_white;
					draw_set_color(image_blend);
					
					_d_x += _d_xGap;
					_d_y += _d_yGap;
				}
			}
		}
		
		draw_set_alpha(1);
		draw_set_color(c_white);
	
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
			
			with ps_bg{
				event_perform(ev_draw,0);
			}
		
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
						
						ktk_scr_draw_text_shadow_ext(_x[1] + -12,_y[1] + 2,string(ceil(_obj.hpCurr)) + "/" + string(_obj.hpMax),c_white,c_white,_s.image_alpha,c_dkgray,c_dkgray,_s.image_alpha,2,0.5,0.5,30);
						
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
						
						ktk_scr_draw_text_shadow_ext(_x[1] + -12,_y[1] + 2,string(ceil(_obj.enCurr)) + "/" + string(_obj.enMax),c_white,c_white,_s.image_alpha,c_dkgray,c_dkgray,_s.image_alpha,2,0.5,0.5,30);
						
						draw_set_halign(fa_left);
						draw_set_alpha(1);
					}
				}
				
				draw_set_color(c_white);
			}
			
		#endregion
		
		#region //equip portrait
		
			var _menu = ds_stack_top(global.stk_menu);
			
			if(scr_exists(ps_portEquip,asset_object)){
				if(scr_exists(_menu,asset_object)){
					var
					_memI = global.lst_activePartySlots[| _menu.menu_x],
					_memX = _memI % 3,
					_memY = _memI > 2,
					_mem = global.grd_party_player[# _memX,_memY],
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
								(_menu.menu_y < ds_grid_height(_menu.grd_equipSrc) + -2 && _menu.link_panel.txt[0] == "party/equip/act/..")
						){
							
							var _act = ps_equipMem.act[_menu.menu_y % array_length_1d(ps_equipMem.act)];
							
							if(_menu.link_panel.txt[0] == "party/equip/act/.."){
				            	_act = _menu.grd_equipSrc[# 0,_menu.menu_y];
				            }
							
							ps_tgtPortX = ps_equipMem.src[? CHAR_VAR_PSDO_ACT_X];
            				ps_tgtPortY = ps_equipMem.src[? CHAR_VAR_PSDO_ACT_Y];
							scr_menuUI_drawEquipStats(_act);
							
							//hotbar
							var
							_x1 = ps_portEquip.x + -ps_tgtPortX,
				            _y1 = ps_portEquip.y + -ps_tgtPortY,
				            _x2 = _x1 + -(sign(ps_tgtPortX) * 50),
				            _y2 = _y1 + -clamp(abs(ps_tgtPortY) * .8,40,80),
							_hb_x = -ps_equipMem.src[? CHAR_VAR_PSDO_ACT_X] + ps_portEquip.x + -30 + -(sign(_x1 + -_x2) * 110),
							_hb_y = _y2 + -150,
							_hb_size = 35,
							_hb_gap = -5,
							_hb_order = [0,2,3,1],
							_hb_iOffset = 0,
							_hb_angle = 105;
							
							repeat(2){
								for(var _i = 0;_i < 4;_i++){
									var
									_drawX = _hb_x + lengthdir_x(_hb_size + _hb_gap,_hb_angle),
									_drawY = _hb_y + lengthdir_y(_hb_size + _hb_gap,_hb_angle),
									_actIndex = _hb_order[_i] + _hb_iOffset,
									_drawAct = ps_equipMem.src[? "char_var_hb" + string(_actIndex)],
									_selected = _actIndex == _menu.menu_y;
									
									if(_menu.link_panel.txt[0] == "party/equip/act/.."){
										_actIndex = ps_actSelected;
										_selected = (_hb_order[_i] + _hb_iOffset) == ps_actSelected;
										
										if(_selected){
											_drawAct = _menu.grd_equipSrc[# _menu.menu_x,_menu.menu_y];
										}
									}
									
									draw_set_color(_selected ? c_ltgray : c_dkgray);
									
									scr_drawDiamond(_drawX,_drawY,_hb_size,_hb_size,-30);
									
									if(scr_exists(_drawAct,asset_object)){
										draw_sprite_ext(_drawAct.icon,0,_drawX,_drawY,1,1,-30,_selected ? c_white : c_dkgray,1);
										
										switch _drawAct.ele{
											case CHAR_VAR_ELE_FIR:
												draw_set_color(CC_FIRRED);
												break;
											case CHAR_VAR_ELE_ICE:
												draw_set_color(CC_ICEBLUE);
												break;
											case CHAR_VAR_ELE_NAT:
												draw_set_color(CC_NATGREEN);
												break;
											case CHAR_VAR_ELE_ELC:
												draw_set_color(CC_ELCYELLOW);
												break;
											case CHAR_VAR_ELE_DRK:
												draw_set_color(CC_DRKVIOLET);
												break;
											case CHAR_VAR_ELE_LGT:
												draw_set_color(CC_LGTBEIGE);
												break;
											default:
												draw_set_color(c_white);
												break;
										}
										
										if(draw_get_colour() != c_white){
											draw_sprite_ext(spr_icon_eleFrame,0,_drawX,_drawY,1,1,-30,draw_get_colour(),_selected ? 1 : .5);
										}
									}
									
									_hb_angle += -90;
								}
								
								_hb_x += lengthdir_x(_hb_size + 50,-30);
								_hb_y += lengthdir_y(_hb_size + 50,-30);
								_hb_iOffset += 4;
							}
							
						}else if(
							(_menu.menu_y < 10 && _menu.link_panel.txt[0] == "party/equip/..") ||
							(_menu.menu_y < ds_list_size(global.lst_inv_arms) && _menu.link_panel.txt[0] == "party/equip/armor/..")
						){
							
							var _arm = _menu.link_panel.txt[0] == "party/equip/armor/.." ?
								global.lst_inv_arms[| _menu.menu_y] :
								ps_equipMem.src[? "char_var_arm" + string(_menu.menu_y + -8)];
							
							ps_tgtPortX = ps_equipMem.src[? CHAR_VAR_PSDO_ARM_X];
        					ps_tgtPortY = ps_equipMem.src[? CHAR_VAR_PSDO_ARM_Y];
							scr_menuUI_drawEquipStats(_arm);
							
						}else if(
							(_menu.menu_y < ds_grid_height(_menu.grd_txt) + -1 && _menu.link_panel.txt[0] == "party/equip/..") ||
							(_menu.menu_y < ds_list_size(global.lst_inv_classes) && _menu.link_panel.txt[0] == "party/equip/class/..")
						){
							
							var _cls = _menu.link_panel.txt[0] == "party/equip/class/.." ?
								global.lst_inv_classes[| _menu.menu_y] :
								_mem.class[_menu.menu_y + -10];
							
							ps_tgtPortX = ps_equipMem.src[? CHAR_VAR_PSDO_CLS_X];
        					ps_tgtPortY = ps_equipMem.src[? CHAR_VAR_PSDO_CLS_Y];
							scr_menuUI_drawEquipStats(_cls);
							
						}else{
							draw_set_alpha(0);
							
							if(_menu.link_panel.txt[0] == "party/equip/.."){
								ps_tgtPortX = 0;
								ps_tgtPortY = 0;
							}
						}
						
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
						draw_set_color(c_dkgray);
						draw_set_font(ft_menuSub);
						
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
			}else if(
				scr_exists(_menu,asset_object) && _menu.menu_y < ds_grid_height(_menu.grd_txt) + -1 &&
				(_menu.link_panel.txt[0] == "menu/market/armor/.." || _menu.link_panel.txt[0] == "menu/market/weapon/..")
			){
				//market stat preview
				var _obj = global.buyLst[| _menu.menu_y];
				
				scr_menuUI_drawEquipStats(_obj);
			}
			
		#endregion
		
		#region //status portrait
		
			if(scr_exists(ps_portStatus,asset_object) && txt_title == "STATUS"){
				var
				_menu = ds_stack_top(global.stk_menu),
				_memX = global.lst_activePartySlots[| _menu.menu_x],
				_mem = global.grd_party_player[# _memX % 3,_memX > 2],
				_portCenterX = 600;
				
				if(ps_portStatus.sprite_index != _mem.src[? CHAR_VAR_SPR_NEUTRAL]){
					ps_portStatus.sprite_index = _mem.src[? CHAR_VAR_SPR_NEUTRAL];
					ps_portStatus.image_alpha = 0;
				}
				
				draw_set_alpha(ps_portStatus.image_alpha);
				
				draw_sprite(ps_portStatus.sprite_index,1,_portCenterX,720);
				
				var
				_vx = 0,
				_vy = 65,
				_vw = 450,
				_vh = 650,
				_va = 10;
			
				draw_set_color(c_dkgray);
				draw_set_alpha(.9 * ps_portStatus.image_alpha)
				draw_primitive_begin(pr_trianglefan);
				
				draw_vertex(_vx,_vy);
				
				_vx += _vw * ps_portStatus.image_alpha;
				
				draw_vertex(_vx,_vy);
				
				_vx += lengthdir_x(_vh,-(90 + _va));
				_vy += lengthdir_y(_vh,-(90 + _va));
				
				draw_vertex(_vx,_vy);
				
				_vx = 0;
				_vy = room_height;
				
				draw_vertex(_vx,_vy);
				draw_vertex(0,65);
				
				draw_primitive_end();
				
				_vx = room_width;
				_vy = room_height;
				
				draw_set_color(c_ltgray);
				draw_primitive_begin(pr_trianglefan);
				
				draw_vertex(_vx,_vy);
				
				_vx += -_vw * ps_portStatus.image_alpha * 1.1;
				
				draw_vertex(_vx,_vy);
				
				_vx += lengthdir_x(_vh,90 + -_va);
				_vy += lengthdir_y(_vh,90 + -_va);
				
				draw_vertex(_vx,_vy);
				
				_vx = room_width;
				_vy = 65;
				
				draw_vertex(_vx,_vy);
				draw_vertex(room_width,room_height);
				
				draw_primitive_end();
				
				draw_set_color(c_white);
				draw_set_halign(fa_left);
				draw_set_valign(fa_bottom);
				draw_set_font(ft_menuTitle);
				
				draw_text_transformed(_vw * ps_portStatus.image_alpha * .78,room_height + -30,"EQUIPMENT",1,1,90 + -_va);
				
				draw_set_halign(fa_right);
				draw_set_valign(fa_top);
				draw_set_color(c_dkgray);
				
				draw_text_transformed(room_width + -(_vw * ps_portStatus.image_alpha * .76 * 1.1),65 + 30,"STATS",1,1,90 + -_va);
				
				#region //stat hex
					var
					_hex_ox = 980 + 150 + (200 * (1 + -ps_portStatus.image_alpha)),
					_hex_oy = 200,
					_hex_size = 80,
					_hex_yGap = (_hex_size * 2) + 40,
					_hex_xGap = -150,
					_hex_stats = [_mem.mAtk,_mem.fAtk,_mem.sAtk,_mem.mDef,_mem.fDef,_mem.sDef],
					_hex_txt = ["M-ATK","F-ATK","S-ATK","M-DEF","F-DEF","S-DEF"],
					_hex_max = 60,
					_hex_min = 0,
					_hex_range = 30,
					_hex_angle = 90 + 60;
					
					draw_set_font(ft_dungeonBold);
					draw_set_halign(fa_center);
					draw_set_valign(fa_middle);
					
					//hex 1
					for(var _i = 0;_i < 6;_i++){
						_hex_min = min(_hex_min,_hex_stats[_i]);
						_hex_max = max(_hex_max,_hex_stats[_i]);
					}
					
					_hex_range = _hex_max + -_hex_min;
					
					draw_set_color(c_gray);
					draw_set_alpha(.9 * ps_portStatus.image_alpha);
					draw_primitive_begin(pr_trianglefan);
					
					draw_vertex(_hex_ox,_hex_oy);
					
					for(var _i = 0;_i < 7;_i++){
						draw_vertex(_hex_ox + lengthdir_x(_hex_size,_hex_angle),_hex_oy + lengthdir_y(_hex_size,_hex_angle));
						
						_hex_angle += -60;
					}
					
					draw_primitive_end();
					
					draw_set_color(c_white);
					draw_set_alpha(1 * ps_portStatus.image_alpha);
					draw_primitive_begin(pr_trianglefan);
					_hex_angle = 90 + 60;
					
					draw_vertex(_hex_ox,_hex_oy);
					
					for(var _i = 0;_i < 7;_i++){
						var
						_len = max((_hex_stats[_i % 6] + -_hex_min) / _hex_range,.1);
						
						draw_vertex(_hex_ox + lengthdir_x(_len * _hex_size,_hex_angle),_hex_oy + lengthdir_y(_len * _hex_size,_hex_angle));
						
						if(_i < 6){
							ktk_scr_draw_text_stroke(_hex_ox + lengthdir_x(_hex_size + 10,_hex_angle),_hex_oy + lengthdir_y(_hex_size + 10,_hex_angle) + 5,_hex_txt[_i % 6] + "\n" + string(round(_hex_stats[_i % 6])),c_dkgray,c_ltgray,2,10);
						}
						
						_hex_angle += -60;
					}
					
					draw_primitive_end();
					
					_hex_oy += _hex_yGap;
					_hex_ox += _hex_xGap;
					_hex_stats = [_mem.hpMax,_mem.acc,_mem.spd,_mem.enMax,_mem.eva,_mem.misc];
					_hex_txt = ["HP","ACC","SPD","EN","EVA","MISC"];
					_hex_max = 60;
					_hex_min = 0;
					_hex_angle = 90 + 60;
					
					//hex 2
					for(var _i = 0;_i < 6;_i++){
						if(_i % 3 == 0){
							_hex_min = min(_hex_min,(_hex_stats[_i] + -1000) / 200);
							_hex_max = max(_hex_max,(_hex_stats[_i] + -1000) / 200);
						}else{
							_hex_min = min(_hex_min,_hex_stats[_i]);
							_hex_max = max(_hex_max,_hex_stats[_i]);
						}
					}
					
					_hex_range = _hex_max + -_hex_min;
					
					draw_set_color(c_gray);
					draw_set_alpha(.9 * ps_portStatus.image_alpha);
					draw_primitive_begin(pr_trianglefan);
					
					draw_vertex(_hex_ox,_hex_oy);
					
					for(var _i = 0;_i < 7;_i++){
						draw_vertex(_hex_ox + lengthdir_x(_hex_size,_hex_angle),_hex_oy + lengthdir_y(_hex_size,_hex_angle));
						
						_hex_angle += -60;
					}
					
					draw_primitive_end();
					
					draw_set_color(c_white);
					draw_set_alpha(1 * ps_portStatus.image_alpha);
					draw_primitive_begin(pr_trianglefan);
					_hex_angle = 90 + 60;
					
					draw_vertex(_hex_ox,_hex_oy);
					
					for(var _i = 0;_i < 7;_i++){
						var
						_len = max((_hex_stats[_i % 6] + -_hex_min) / _hex_range,.1);
						
						if(_i % 3 == 0){
							var _adjLen = (_hex_stats[_i % 6] + -1000) / 200;
							
							_len = max((_adjLen + -_hex_min) / _hex_range,.1);
						}
						
						draw_vertex(_hex_ox + lengthdir_x(_len * _hex_size,_hex_angle),_hex_oy + lengthdir_y(_len * _hex_size,_hex_angle));
						
						if(_i < 6){
							ktk_scr_draw_text_stroke(_hex_ox + lengthdir_x(_hex_size + 10,_hex_angle),_hex_oy + lengthdir_y(_hex_size + 10,_hex_angle) + 5,_hex_txt[_i % 6] + "\n" + string(round(_hex_stats[_i % 6])),c_dkgray,c_ltgray,2,10);
						}
						
						_hex_angle += -60;
					}
					
					draw_primitive_end();
					
					_hex_oy += _hex_yGap;
					_hex_ox += -_hex_xGap;
					_hex_stats = [_mem.ele_fir,_mem.ele_nat,_mem.ele_lgt,_mem.ele_ice,_mem.ele_elc,_mem.ele_drk];
					_hex_txt = ["FIR","NAT","LGT","ICE","ELC","DRK"];
					_hex_max = 60;
					_hex_min = 0;
					_hex_angle = 90 + 60;
					
					//hex 3
					for(var _i = 0;_i < 6;_i++){
						_hex_min = min(_hex_min,_hex_stats[_i]);
						_hex_max = max(_hex_max,_hex_stats[_i]);
					}
					
					_hex_range = _hex_max + -_hex_min;
					
					draw_set_color(c_gray);
					draw_set_alpha(.9 * ps_portStatus.image_alpha);
					draw_primitive_begin(pr_trianglefan);
					
					draw_vertex(_hex_ox,_hex_oy);
					
					for(var _i = 0;_i < 7;_i++){
						draw_vertex(_hex_ox + lengthdir_x(_hex_size,_hex_angle),_hex_oy + lengthdir_y(_hex_size,_hex_angle));
						
						_hex_angle += -60;
					}
					
					draw_primitive_end();
					
					draw_set_color(c_white);
					draw_set_alpha(1 * ps_portStatus.image_alpha);
					draw_primitive_begin(pr_trianglefan);
					_hex_angle = 90 + 60;
					
					draw_vertex(_hex_ox,_hex_oy);
					
					for(var _i = 0;_i < 7;_i++){
						var
						_len = max((_hex_stats[_i % 6] + -_hex_min) / _hex_range,.1);
						
						draw_vertex(_hex_ox + lengthdir_x(_len * _hex_size,_hex_angle),_hex_oy + lengthdir_y(_len * _hex_size,_hex_angle));
						
						if(_i < 6){
							ktk_scr_draw_text_stroke(_hex_ox + lengthdir_x(_hex_size + 10,_hex_angle),_hex_oy + lengthdir_y(_hex_size + 10,_hex_angle) + 5,_hex_txt[_i % 6] + "\n" + string(round(_hex_stats[_i % 6])),c_dkgray,c_ltgray,2,10);
						}
						
						_hex_angle += -60;
					}
					
					draw_primitive_end();
				#endregion
				
				#region //equip list
					draw_set_color(c_white);
					draw_set_alpha(1 * ps_portStatus.image_alpha);
					draw_set_font(ft_dungeonBold);
					draw_set_halign(fa_left);
					draw_set_valign(fa_top);
					
					var _str = "ACTS\n";
					
					for(var _i = 0;_i < 8;_i++){
						var _o = _mem.act[_i];
						_str += "\n      " + (scr_exists(_o,asset_object) ? _o.name : "--------");
					}
					
					_str += "\n\n\n\nARMORS\n";
					
					for(var _i = 0;_i < 2;_i++){
						var _o = _mem.src[? "char_var_arm" + string(_i)];
						_str += "\n      " + (scr_exists(_o,asset_object) ? _o.name : "--------");
					}
					
					_str += "\n\n\n\nCLASS\n";
					
					for(var _i = 0;_i < 1;_i++){
						var _o = _mem.src[? "char_var_cls" + string(_i)];
						_str += "\n      " + (scr_exists(_o,asset_object) ? _o.name : "--------");
					}
					
					var
					_x = 80 * ps_portStatus.image_alpha,
					_y = 150;
					
					draw_text(_x,_y,_str);
				#endregion
			}
		
		#endregion
		
		draw_set_color(c_white);
		draw_set_alpha(1);
	
	#endregion
	
	#region //quest screen
	
		if(scr_exists(ps_portStatus,asset_object) && txt_title == "QUEST"){
			var
			_vx = room_width,
			_vy = room_height,
			_vw = 550,
			_vh = 640,
			_va = 5;
		
			draw_set_color(c_dkgray);
			draw_set_alpha(.9 * ps_portStatus.image_alpha)
			draw_primitive_begin(pr_trianglefan);
			
			draw_vertex(_vx,_vy);
			
			_vx += -_vw * ps_portStatus.image_alpha * 1.1;
			
			draw_vertex(_vx,_vy);
			
			_vx += lengthdir_x(_vh,90 + -_va);
			_vy += lengthdir_y(_vh,90 + -_va);
			
			draw_vertex(_vx,_vy);
			
			_vx = room_width;
			_vy = 65;
			
			draw_vertex(_vx,_vy);
			draw_vertex(room_width,room_height);
			
			draw_primitive_end();
			
			draw_set_color(c_white);
			draw_set_alpha(ps_portStatus.image_alpha);
			draw_set_font(ft_menuButton);
			draw_set_halign(fa_right);
			draw_set_valign(fa_top);
			
			if(!_m.submenu && _m.menu_y < ds_grid_height(_m.grd_txt) + -1){
				var _map = _m.grd_equipSrc[# _m.menu_x,_m.menu_y];
				
				questDesc = scr_quest_buildDesc(_map[? Q_VAR_ID]);
			}
			
			draw_text_ext(1250,160,questDesc,-1,_vw + -20);
		}
		
		draw_set_color(c_white);
		draw_set_alpha(1);
	
	#endregion
	
	#region //formation screen
	
		if(scr_exists(soc_formation,asset_object)){
			var
			_y = 500,
			_yGap = 50,
			_h = 50 * soc_formation.image_alpha,
			_xGap = 25,
			_tw = _h * 1.5,
			_x1 = (room_width / 2) + -_xGap,
			_x2 = (room_width / 2) + _xGap,
			_ph = _h * 1.2,
			_pw = 180,
			_px,
			_py;
		
			draw_set_color(c_dkgray);
			draw_set_alpha(.95 * soc_formation.image_alpha);
			
			draw_rectangle(0,_y + -_h,_x1,_y + _h,false);
			draw_triangle(_x1,_y + -_h + -1,_x1 + _tw,_y + -_h + -1,_x1,_y + _h,false);
			
			_y += _yGap;
			
			draw_rectangle(room_width,_y + -_h,_x2,_y + _h,false);
			draw_triangle(_x2 + -1,_y + _h,_x2 + -_tw + -1,_y + _h,_x2 + -1,_y + -_h,false);
			
			draw_set_color(c_white);
			draw_set_alpha(.2 * soc_formation.image_alpha);
			draw_set_halign(fa_right);
			draw_set_valign(fa_top);
			draw_set_font(ft_menuTitle);
			
			draw_text(_x1 + (_tw * .4),_y + -_yGap + -(_h * .85),"VANGUARD");
			
			draw_set_halign(fa_left);
			
			draw_text(_x2 + 5,_y + -(_h * .85),"RESERVE");
			
			_y += -_yGap;
			
			draw_set_alpha(soc_formation.image_alpha);
			draw_set_halign(fa_right);
			draw_set_valign(fa_bottom);
			draw_set_font(ft_dungeonBold);
			_px = _x1 + -_pw;
			_py = _y + -(_ph * .3);
			
			for(var _i = 2;_i >= 0;_i--){
				draw_set_color(c_gray);
				
				draw_rectangle(_px,_py,_px + _pw,_py + _ph,false);
				
				draw_set_color(c_white);
				
				if(_i < ds_list_size(global.lst_newFormation)){
					var
					_id = global.lst_newFormation[| _i],
					_map = scr_data_getMap(global.grd_chars,_id);
					
					draw_sprite_part_ext(_map[? CHAR_VAR_SPR_NEUTRAL],0,-_map[? CHAR_VAR_ABDO_X],_map[? CHAR_VAR_ABDO_Y],_pw * 2,_ph * 2,_px,_py,0.5,0.5,c_white,draw_get_alpha());
					ktk_scr_draw_text_stroke(_px + _pw + -3,_py + _ph + 5,_map[? CHAR_VAR_NAMEDISP],c_white,c_dkgray,1,10);
					
					draw_rectangle(_px,_py,_px + _pw,_py + _ph,true);
				}
				
				_px += -_pw + -10;
			}
			
			_y += _yGap;
			
			draw_set_halign(fa_right);
			draw_set_valign(fa_bottom);
			_px = _x2;
			_py = _y + -(_ph * .3);
			
			for(var _i = 3;_i < 6;_i++){
				draw_set_color(c_gray);
				
				draw_rectangle(_px,_py,_px + _pw,_py + _ph,false);
				
				draw_set_color(c_white);
				
				if(_i < ds_list_size(global.lst_newFormation)){
					var
					_id = global.lst_newFormation[| _i],
					_map = scr_data_getMap(global.grd_chars,_id);
					
					draw_sprite_part_ext(_map[? CHAR_VAR_SPR_NEUTRAL],0,-_map[? CHAR_VAR_ABDO_X],_map[? CHAR_VAR_ABDO_Y],_pw * 2,_ph * 2,_px,_py,0.5,0.5,c_white,draw_get_alpha());
					ktk_scr_draw_text_stroke(_px + _pw + -3,_py + _ph + 5,_map[? CHAR_VAR_NAMEDISP],c_white,c_dkgray,1,10);
					
					draw_rectangle(_px,_py,_px + _pw,_py + _ph,true);
				}
				
				_px += _pw + 10;
			}
		}
		
		draw_set_color(c_white);
		draw_set_alpha(1);
	
	#endregion
	
	#region //title bar
	
		draw_set_font(ft_menuTitle);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		
		if(scr_exists(ps_portStatus,asset_object) && txt_title == "STATUS"){
			txt_titleDesc = _m.grd_txt[# _m.menu_x,0];
		}
		
		var
		_titleW = string_width(txt_title) + 15,
		_titleH = string_height(txt_title),
		_ctrlH = 22,
		_titleY = (_titleH + _ctrlH + 20) * (transCurr + -1);
		
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
		
		//title shadow
		draw_set_color(c_black);
		gpu_set_blendmode(bm_subtract);
		
		draw_rectangle_color(0,_titleY + _titleH + _ctrlH,1280,_titleY + _titleH + _ctrlH + 6,c_white,c_white,c_black,c_black,false);
		
		gpu_set_blendmode(bm_normal);
		
		draw_set_color(c_white);
		draw_set_font(ft_menuSub);
		
		var
		_s = "",
		_ctrlArr = ["[Z]","[X]","[C]","[BkSpc]"];
		
		if(scr_exists(_m,asset_object) && !_m.submenu){
			switch _m.extra_function{
				case noone:
					txt_ctrl[2] = "Party";
					break;
					
				case -1:
					txt_ctrl[2] = "";
					break;
					
				default:
					txt_ctrl[2] = "Sub";
					break;
			}
		}
		
		for(var _i = 0;_i < 4;_i++){
			if(txt_ctrl[_i] != ""){
				_s += _ctrlArr[_i] + ":" + txt_ctrl[_i] + "    ";
			}
		}
		
		ktk_scr_draw_text_shadow(8,_titleY + _titleH + 2,_s,c_white,c_dkgray,2);
		
		draw_set_halign(fa_right);
		draw_set_font(ft_menuButton);
		draw_set_color(c_white);
		
		var
		_x1 = 1130,
		_y1 = _titleH,
		_x2 = _x1,
		_y2 = _y1 + string_height("SAMPLE"),
		_x3 = _x1 + -20,
		_y3 = _y1;
	
		draw_rectangle(1280,_titleY + _y1,_x1,_titleY + _y2,false);
		draw_triangle(_x1,_titleY + _y1,_x2 + -1,_titleY + _y2,_x3,_titleY + _y3,false);
		
		draw_set_color(c_dkgray);
		
		ktk_scr_draw_text_shadow(room_width + -20,_titleY + _titleH + -1,string(global.heldGold) + "g",c_dkgray,c_ltgray,1);
		
		draw_set_font(ft_menuButton);
		draw_set_color(c_white);
		
		ktk_scr_draw_text_shadow(1270,_titleY + 5,txt_titleDesc,c_white,c_gray,1);
	
	#endregion
	
	#region //bottom bar
	
		draw_set_font(ft_menuDesc);
		draw_set_halign(fa_left);
		draw_set_color(c_dkgray);
		draw_set_alpha(global.set_winTrans / 100);
		
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
}

draw_set_color(c_white);
draw_set_alpha(1);