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
			case "CHIP LAB":
				_spr = spr_npc_tear;
				break;
		}
		
		if(scr_exists(_spr,asset_sprite)){
			draw_sprite_ext(_spr,0,_leadX + -10,720,1,1,0,c_black,transCurr * .8); //drop shadow
			draw_sprite_ext(_spr,0,_leadX,720,1,1,0,c_white,transCurr);
		}
	
	#endregion
	
	#region //shop screen
	
		if(txt_title == "MARKET" || txt_title == "CHIP LAB"){
			var
			_h_x = 250,
			_h_y1 = 80,
			_h_y2 = _h_y1 + 40,
			_h_c = color_get_value(c_ltgray);
			
			gpu_set_blendmode(bm_subtract);
			draw_set_color(make_color_hsv(0,0,_h_c * transCurr));
			draw_set_alpha(transCurr);
			
			draw_rectangle(room_width,_h_y1,room_width + -_h_x,_h_y2,false);
			draw_rectangle_color(room_width + -_h_x,_h_y1,room_width + -(_h_x * 1.5),_h_y2,c_black,draw_get_colour(),draw_get_colour(),c_black,false);
			
			gpu_set_blendmode(bm_add);
			draw_set_color(make_color_hsv(0,0,255 * transCurr));
			
			draw_line_width(room_width,_h_y2,room_width + -_h_x,_h_y2,2);
			draw_line_width_color(room_width + -_h_x,_h_y2,room_width + -(_h_x * 1.5),_h_y2,2,draw_get_colour(),c_black);
			
			gpu_set_blendmode(bm_normal);
			draw_set_font(ft_dungeonBoldLarge);
			draw_set_halign(fa_right);
			draw_set_valign(fa_top);
			
			ktk_scr_draw_text_shadow(room_width + -40,_h_y1 + 8,string(global.heldGold) + "g",c_white,c_gray,2);
		}
		
		draw_set_color(c_white);
		draw_set_alpha(1);
	
	#endregion
	
	#region //class upgrade screen
	
		if(
			scr_exists(_m,asset_object)
			&& (
				_m.link_panel.txt[0] == "menu/lab/class1/upgrade/.."
				|| _m.link_panel.txt[0] == "menu/lab/class1/upgrade/confirm/.."
			)
			&& variable_global_exists("labObj")
			&& scr_exists(global.labObj,asset_object)
		){
			var
			_d_xStart = 190,
			_d_yStart = 360,
			_d_x = _d_xStart,
			_d_y = _d_yStart,
			_d_xGap = 180,
			_d_yGap = 80,
			_d_b = 10,
			_d_tx1 = 0,
			_d_ty1 = 20,
			_d_tx2 = 30,
			_d_ty2 = 0,
			_d_tx3 = 30,
			_d_ty3 = 40,
			_d_a = _m.link_panel.txt[0] == "menu/lab/class1/upgrade/.." ? (_m.link_panel.image_xscale / _m.link_panel.tgt_xScale) : 1,
			_d_hx = 50,
			_d_hy = 120,
			_d_hy2 = _d_hy + 42,
			_d_hw = 280,
			_d_hh = 160,
			_ix = 0,
			_iy = 0,
			_str = "";
			
			if(highlight_x == 0){
				highlight_x = _d_xStart;
				highlight_y = _d_yStart;
			}
			
			if(_m.link_panel.txt[0] == "menu/lab/class1/upgrade/.."){
				highlight_x = ktk_scr_tween(highlight_x,_d_xStart + (_d_xGap * _m.menu_x),2,-1);
				highlight_y = ktk_scr_tween(highlight_y,_d_yStart + (_d_yGap * _m.menu_y),2,-1);
			}
			
			gpu_set_blendmode(bm_subtract);
			draw_set_color(c_ltgray);
			
			draw_rectangle(0,_d_hy,_d_hw,_d_hy + _d_hh,false);
			draw_rectangle_color(_d_hw + 1,_d_hy,_d_hw + 200,_d_hy + _d_hh,c_ltgray,c_black,c_black,c_ltgray,false);
			
			gpu_set_blendmode(bm_add);
			draw_set_color(c_white);
			
			draw_line_width(0,_d_hy2,_d_hw,_d_hy2,2);
			draw_line_width_color(_d_hw,_d_hy2,_d_hw + 200,_d_hy2,2,c_white,c_black);
			
			gpu_set_blendmode(bm_normal);
			draw_set_alpha(1 * _d_a);
			draw_set_font(ft_dungeonBoldLarge);
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			_str = global.labObj.name;
			
			ktk_scr_draw_text_shadow(_d_hx,_d_hy + 10,_str,c_white,c_gray,3);
			
			var _skills = 0;
								
			for(var _xx = 0;_xx < ds_grid_width(global.labObj.grd_skills);_xx++){
				for(var _yy = 0;_yy < ds_grid_height(global.labObj.grd_skills);_yy++){
					_skills += sign(global.labObj.grd_skills[# _xx,_yy]);
				}
			}
			
			draw_set_font(ft_dungeonBold);
			_str = "lv." + string(global.labObj.level) + "/30\n"
			+ "\n\"" + global.labObj.cName + "\""
			+ "\nSkills: " + string(_skills)
			+ "\nNext Level: " + string(scr_calcLevelupCost(global.labObj)) + "g";
			
			ktk_scr_draw_text_shadow(_d_hx,_d_hy + 55,_str,c_white,c_gray,2);
			
			draw_set_font(ft_dungeonBold);
			draw_set_halign(fa_center);
			
			for(var _i = 0;_i < ds_grid_width(global.labObj.grd_skills) + 1;_i++){
				var
				_r = 25,
				_x1 = _d_xStart + (_d_xGap * _i) + -_d_b,
				_y1 = _d_yStart + -0 + -_r,
				_x2 = _x1 + _d_xGap + -(_d_b * 2),
				_y2 = _y1 + (_d_yGap * 3) + -30 + (_r * 2);
				
				draw_set_alpha(.9 * _d_a);
				draw_set_color(c_dkgray);
				
				draw_roundrect_ext(_x1,_y1,_x2,_y2,_r,_r,false);
				
				draw_set_alpha(1 * _d_a);
				draw_set_color(c_white);
				
				for(var _s = 0;_s < 2;_s += .5){
					draw_roundrect_ext(_x1 + -_s,_y1 + -_s,_x2 + _s,_y2 + _s,_r,_r,true);
				}
				
				if(_i > 1){
					_str = "Lv." + string((_i + -1) * 5);
					
					ktk_scr_draw_text_stroke(mean(_x1,_x2),_y1 + -6,_str,c_dkgray,c_white,2,10);
				}
			}
			
			draw_set_color(c_gray);
			draw_set_halign(fa_left);
			draw_set_font(ft_menuSub);
			
			draw_rectangle(highlight_x + 1 + -_d_b,highlight_y + -_d_b,highlight_x + _d_xGap + -(_d_b * 3),highlight_y + 50 + _d_b,false);
			
			draw_set_alpha(1 * _d_a);
			draw_set_color(c_white);
			
			_str = string_replace(global.labObj.ms_name," ","\n");
			
			draw_rectangle(_d_x,_d_y,_d_x + 35,_d_y + 35,false);
			draw_sprite(global.labObj.ms_icon,0,_d_x,_d_y);
			ktk_scr_draw_text_shadow(_d_x + 40,_d_y,_str,c_white,c_dkgray,1);
			ktk_scr_draw_text_shadow(_d_x + 40,_d_y,_str,c_white,c_dkgray,2);
			
			_str = "Main";
			
			ktk_scr_draw_text_shadow(_d_x,_d_y + 38,_str,c_white,c_dkgray,1);
			ktk_scr_draw_text_shadow(_d_x,_d_y + 38,_str,c_white,c_dkgray,2);
			
			_d_y += _d_yGap;
			_str = string_replace(global.labObj.ss_name," ","\n");
			
			draw_rectangle(_d_x,_d_y,_d_x + 35,_d_y + 35,false);
			draw_sprite(global.labObj.ss_icon,0,_d_x,_d_y);
			ktk_scr_draw_text_shadow(_d_x + 40,_d_y,_str,c_white,c_dkgray,1);
			ktk_scr_draw_text_shadow(_d_x + 40,_d_y,_str,c_white,c_dkgray,2);
			
			_str = string(global.labObj.ss_level) + "/30";
			
			ktk_scr_draw_text_shadow(_d_x,_d_y + 38,_str,c_white,c_dkgray,1);
			ktk_scr_draw_text_shadow(_d_x,_d_y + 38,_str,c_white,c_dkgray,2);
			
			_d_y += _d_yGap;
			_str = "Return";
			
			draw_sprite(spr_backIcon,0,_d_x,_d_y);
			ktk_scr_draw_text_shadow(_d_x + 40,_d_y,_str,c_white,c_dkgray,1);
			ktk_scr_draw_text_shadow(_d_x + 40,_d_y,_str,c_white,c_dkgray,2);
			
			_d_y = _d_yStart;
			_d_x += _d_xGap;
			
			for(_ix = 0;_ix < ds_grid_width(global.labObj.grd_skills);_ix++){
				_d_y = _d_yStart;
				
				for(_iy = 0;_iy < ds_grid_height(global.labObj.grd_skills);_iy++){
					_str = string_replace(global.labObj.grd_skillName[# _ix,_iy]," ","\n");
					
					image_blend = (global.labObj.level >= _ix * 5) ? c_white : c_gray;
					draw_set_color(image_blend);
					
					draw_rectangle(_d_x,_d_y,_d_x + 35,_d_y + 35,false);
					draw_sprite_ext(global.labObj.grd_skillIcon[# _ix,_iy],0,_d_x,_d_y,1,1,0,image_blend,draw_get_alpha());
					ktk_scr_draw_text_shadow(_d_x + 40,_d_y,_str,image_blend,c_dkgray,1);
					ktk_scr_draw_text_shadow(_d_x + 40,_d_y,_str,image_blend,c_dkgray,2);
					
					_str = string(global.labObj.grd_skills[# _ix,_iy]) + "/5";
					
					ktk_scr_draw_text_shadow(_d_x,_d_y + 38,_str,image_blend,c_dkgray,1);
					ktk_scr_draw_text_shadow(_d_x,_d_y + 38,_str,image_blend,c_dkgray,2);
					
					image_blend = c_white;
					draw_set_color(image_blend);
					
					_d_y += _d_yGap;
				}
				
				_d_x += _d_xGap;
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
							(_menu.menu_y < ds_grid_height(_menu.grd_equipSrc) + -2 && _menu.link_panel.txt[0] == "party/equip/act/..")
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
								"---", //enCost
								"---", //cd
								"---", //typ
								"---", //tgt
								"---" //ele
							];
							_str = "";
							_label = " PWR:\n ACC:\nCOST:\n  CD:\n TYP:\n TGT:\n ELE:";
							
							var _act = ps_equipMem.act[_menu.menu_y % array_length_1d(ps_equipMem.act)];
							
							if(_menu.link_panel.txt[0] == "party/equip/act/.."){
								_act = _menu.grd_equipSrc[# 0,_menu.menu_y];
							}
							
							if(_act != undefined && instance_exists(_act)){
								_name = _act.name;
								
								if(_act.pwr > 0){
									_strArr[0] = string(round(_act.pwr)) + "x" + string(_act.hitCount * _act.hitSimul);
								}
								
								if(_act.acc <= 100){
									_strArr[1] = string(round(_act.acc));
								}
								
								if(_act.enCost > 0){
									_strArr[2] = string(round(_act.enCost));
								}
								
								if(_act.cdAdd > 0){
									_strArr[3] = string(round(_act.cdAdd));
								}
								
								switch(_act.atkScale){
									case CHAR_VAR_MATK:
										_strArr[4] = "M"
										
										break;
									case CHAR_VAR_FATK:
										_strArr[4] = "F"
										
										break;
									case CHAR_VAR_SATK:
										_strArr[4] = "S"
										
										break;
								}
								
								if(_act.tgtEnemy){
									switch(_act.defScale){
										case CHAR_VAR_MDEF:
											_strArr[4] += "vM"
											
											break;
										case CHAR_VAR_FDEF:
											_strArr[4] += "vF"
											
											break;
										case CHAR_VAR_SDEF:
											_strArr[4] += "vS"
											
											break;
									}
								}
								
								switch(_act.tgtType){
									case ACT_TGT_SINGLE:
										_strArr[5] = "SINGLE"
										
										break;
									case ACT_TGT_WIDE:
										_strArr[5] = "WIDE"
										
										break;
									case ACT_TGT_RANDOM:
										_strArr[5] = "RANDOM"
										
									case ACT_TGT_SELF:
										_strArr[5] = "SELF"
										
										break;
								}
								
								switch(_act.ele){
									case CHAR_VAR_ELE_FIR:
										_strArr[6] = "FIRE"
										
										break;
									case CHAR_VAR_ELE_ICE:
										_strArr[6] = "ICE"
										
										break;
									case CHAR_VAR_ELE_DRK:
										_strArr[6] = "DARK"
										
										break;
									case CHAR_VAR_ELE_LGT:
										_strArr[6] = "LIGHT"
										
										break;
									case CHAR_VAR_ELE_ELC:
										_strArr[6] = "ELEC"
										
										break;
									case CHAR_VAR_ELE_NAT:
										_strArr[6] = "NATURE"
										
										break;
								}
							}
							
							for(var _i = 0;_i < 7;_i++){
								_str += _strArr[_i] + "\n";
							}
						
							//hotbar
							var
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
	
	#region //title bar
	
		draw_set_font(ft_menuTitle);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		
		if(scr_exists(ps_portStatus,asset_object)){
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