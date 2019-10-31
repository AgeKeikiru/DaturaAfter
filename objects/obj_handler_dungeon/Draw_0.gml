/// @description Insert description here
// You can write your code in this editor

var
_pDraw_x = 1280 / 2, //where to draw the player icon on screen
_pDraw_y = 300,
_gridH = DH_MGRID_H, //how large to draw map grid squares
_gridW = _gridH * 2,
_gridGap = DH_MGRID_GAP; //how much space is between map grid squares

#region //draw map grid

	var
	_deltaX = global.dMap_xPos + -global.dMap_xPosTgt,
	_deltaY = global.dMap_yPos + -global.dMap_yPosTgt,
	_gridOffX = -250 + -((_deltaX + -sign(_deltaX)) * (_gridW + _gridGap)),
	_gridOffY = -250 + -((_deltaY + -sign(_deltaY)) * (_gridH + _gridGap));

	draw_set_alpha(1);
	
	draw_surface(global.sfc_map,_gridOffX,_gridOffY);

#endregion

#region //draw player icon
	
	draw_set_alpha(.5);
	draw_set_color(c_black);
	
	draw_ellipse(_pDraw_x + -(_gridW / 4),_pDraw_y + -(_gridH / 4),_pDraw_x + (_gridW / 4),_pDraw_y + (_gridH / 4),false);
	
	draw_set_alpha(1);
	draw_set_color(c_white);

	draw_sprite_ext(pIcon,-1,_pDraw_x,_pDraw_y,1,1,0,c_white,1);

#endregion

if(!state_event && !state_results){
	
	#region //draw minimap
	
		draw_set_alpha(1);
		
		if(global.set_mmSize && surface_exists(global.sfc_minimap)){
			draw_surface(global.sfc_minimap,5,5);
		}
	
	#endregion
	
	#region //draw timer

		var
	    _timeT = missionTime / room_speed,
	    _timeM = string_format(floor(_timeT / 60),2,0),
	    _timeS = string_format(_timeT mod 60,2,2),
	    _timeDebug = DEBUG ? string(missionDmg) : "",
	    _icDebug = DEBUG ? ("ic:" + string(instance_count)) : "";
	    
	    draw_set_font(ft_dungeonBold);
	    draw_set_halign(fa_left);
	    draw_set_valign(fa_top);
	    
	    ktk_scr_draw_text_stroke(10,150,string_replace_all(_timeM," ","0") + ":" + string_replace_all(_timeS," ","0") + "\n" + _timeDebug + "\n" + _icDebug,c_white,c_dkgray,2,10);
	
	#endregion
	
	draw_set_color(c_black);
	draw_set_alpha(.7);
	draw_rectangle(0,550 * battleTrans,1280,720,false);
	
	#region //draw enemies
	
		var
		_gap = 380,
		_x = 640 + -_gap,
		_y = 380,
		_ch_offX = 0, //crosshair
		_ch_offY = -100,
		_ch_size = 30,
		_ch_w1 = 4, //weight
		_ch_w2 = 2,
		_tg_y = -200, //target grid
		_tg_size = 0,
		_tg_gap = 2;
	
		for(var _i = 0;_i < 3;_i++){
			var _o = global.grd_party_enemy[# _i,0];
			
			draw_set_color(c_white);
			
			if(instance_exists(_o) && sprite_exists(_o.src[? CHAR_VAR_SPR_BATTLEPORT])){
				var
				_sh_rx = sprite_get_width(_o.src[? CHAR_VAR_SPR_BATTLEPORT]) * .45,
				_sh_ry = 15;
				
				draw_set_alpha(_o.image_alpha * .8);
				draw_set_color(c_black);
				
				draw_ellipse(_o.x + -_sh_rx,_o.y + -_sh_ry,_o.x + _sh_rx,_o.y + _sh_ry,false);
				
				draw_set_alpha(1);
				draw_set_color(c_white);
				
				draw_sprite_ext(_o.src[? CHAR_VAR_SPR_BATTLEPORT],0,_x + (sin(_o.direction) * _o.hurtShake * 20),_y + ((1 + -_o.image_alpha) * -150) + (cos(_o.direction) * _o.hurtShake * 20) + ((_o.image_yscale + -1) * sprite_get_height(_o.src[? CHAR_VAR_SPR_BATTLEPORT]) * .5),_o.image_xscale,_o.image_yscale,0,make_color_rgb(255,255 * (1 + -_o.hurtShake),255 * (1 + -_o.hurtShake)),_o.image_alpha);
				
				_o.image_alpha = ktk_scr_tween(_o.image_alpha,1,5,.2);
				
				if(_o.hpCurr > 0){
					scr_cEvent_id(_o,EVENT_BATTLM_ICONDRAW);
					
					var
					_fill = ceil(360 * (_o.enemyWait / _o.enemyWaitMax)),
					_a = 0,
					_r = 15,
					_x2 = _x + -130,
					_y2 = _y + -60;
					
					repeat(360){
						draw_set_color(_a < _fill ? c_dkgray : c_white);
						
						draw_line(_x2,_y2,_x2 + (cos(degtorad(_a + -90)) * _r),_y2 + (sin(degtorad(_a + -90)) * _r));
						
						_a++;
					}
					
					//draw crosshair if targetted by handler
					if(tgtSlot == _i){
						draw_set_color(c_white);
						
						var _off = 0;
						
						repeat(_ch_w1){
							draw_circle(_x + _ch_offX,_y + _ch_offY,_ch_size + _off,true);
							draw_circle(_x + _ch_offX,_y + _ch_offY,_ch_size + -_off,true);
							
							_off += .5;
						}
						
						draw_set_color(c_yellow);
						
						repeat(_ch_w2){
							draw_circle(_x + _ch_offX,_y + _ch_offY,_ch_size + _off,true);
							draw_circle(_x + _ch_offX,_y + _ch_offY,_ch_size + -_off,true);
							
							_off += .5;
						}
						
						var _ch_a = (current_time / 10) mod 360;
						
						repeat(3){
							draw_set_color(c_yellow);
							
							draw_line_width(_x + _ch_offX + lengthdir_x(_ch_size * .5,_ch_a),_y + _ch_offY + lengthdir_y(_ch_size * .5,_ch_a),_x + _ch_offX + lengthdir_x(_ch_size * 1.25,_ch_a),_y + _ch_offY + lengthdir_y(_ch_size * 1.25,_ch_a),_ch_w1 + _ch_w2);
							
							draw_set_color(c_white);
							
							draw_line_width(_x + _ch_offX + lengthdir_x(_ch_size * .5,_ch_a),_y + _ch_offY + lengthdir_y(_ch_size * .5,_ch_a),_x + _ch_offX + lengthdir_x(_ch_size * 1.25,_ch_a),_y + _ch_offY + lengthdir_y(_ch_size * 1.25,_ch_a),_ch_w1);
							
							_ch_a += 120;
						}
						
						draw_set_color(c_white);
						draw_set_alpha(1);
					}
					
					//draw target grid if targetted by act
					draw_set_alpha(0);
					
					repeat(2){
						var _a = 180;
						
						for(var _i2 = 0;_i2 < 3;_i2++){
							draw_set_color(c_yellow);
							_tg_size = 20;
							
							var
							_tg_offX = _x + lengthdir_x((_tg_size) + _tg_gap,_a),
							_tg_offY = _y + _tg_y + lengthdir_y((_tg_size) + _tg_gap,_a);
							
							draw_triangle(_tg_offX + -_tg_size,_tg_offY,_tg_offX,_tg_offY + -_tg_size,_tg_offX,_tg_offY + _tg_size,false);
							draw_triangle(_tg_offX + _tg_size,_tg_offY,_tg_offX,_tg_offY + -_tg_size,_tg_offX,_tg_offY + _tg_size,false);
							
							var _bm = global.grd_party_player[# _i2,0];
							
							if(instance_exists(_bm) && _bm.tgtIndex == _i && _bm.tgtEnemy){
								draw_set_alpha(1);
							}else{
								draw_set_color(c_dkgray);
								_tg_size += -2;
								
								draw_triangle(_tg_offX + -_tg_size,_tg_offY,_tg_offX,_tg_offY + -_tg_size,_tg_offX,_tg_offY + _tg_size,false);
								draw_triangle(_tg_offX + _tg_size,_tg_offY,_tg_offX,_tg_offY + -_tg_size,_tg_offX,_tg_offY + _tg_size,false);
							}
							
							_a += -90;
						}
					}
				}
				
				draw_set_color(c_white);
				draw_set_alpha(1);
			}
			
			_x += _gap;
		}
	
	#endregion
}

if(!state_event && !state_results){
	#region //vignette effects
	
		var _ve_b = 200;
		
		global.tempBool = false;
		
		with(obj_handler_actEffect_shd){
			if(scr_exists(src,asset_object) && src.allyParty == global.grd_party_player){
				global.tempBool = true;
			}
		}
		
		ve_tgtCol = global.tempBool ? CC_ENBLUE : c_black;
		
		ve_col = make_color_rgb(
			ktk_scr_tween(color_get_red(ve_col),color_get_red(ve_tgtCol),3,-1),
			ktk_scr_tween(color_get_green(ve_col),color_get_green(ve_tgtCol),3,-1),
			ktk_scr_tween(color_get_blue(ve_col),color_get_blue(ve_tgtCol),3,-1),
		);
		
		gpu_set_blendmode(bm_add);
		draw_set_alpha(ve_tgtCol == CC_ENBLUE ? .5 : 1);
		
		draw_rectangle_color(-_ve_b,-_ve_b,room_width / 2,room_height / 2,ve_col,ve_col,c_black,ve_col,false);
		draw_rectangle_color(room_width + _ve_b,-_ve_b,room_width / 2,room_height / 2,ve_col,ve_col,ve_col,c_black,false);
		draw_rectangle_color(room_width + _ve_b,room_height + _ve_b,room_width / 2,room_height / 2,c_black,ve_col,ve_col,ve_col,false);
		draw_rectangle_color(-_ve_b,room_height + _ve_b,room_width / 2,room_height / 2,ve_col,c_black,ve_col,ve_col,false);
		
		gpu_set_blendmode(bm_normal);
		draw_set_alpha(1);
	
	#endregion
	
	#region //objective meter
	
		var _h = instance_find(obj_handler_mission_parent,0);
		
		if(scr_exists(_h,asset_object) && _h.specMax > 0){
			draw_set_font(ft_dungeonBold);
			draw_set_halign(fa_center);
			draw_set_valign(fa_top);
			
			var
			_om_str = "OBJECTIVE",
			_om_w = 500,
			_om_w2 = _om_w * (_h.specCurr / _h.specMax),
			_om_h = 15,
			_om_b = 2,
			_om_x = (room_width + -_om_w) / 2,
			_om_y = 20,
			_om_tw = string_width(_om_str),
			_om_th = string_height(_om_str),
			_om_tx1 = (room_width + -_om_tw) / 2,
			_om_tx2 = (room_width + _om_tw) / 2,
			_om_ty1 = _om_y + _om_h + _om_b,
			_om_ty2 = _om_y + _om_h + _om_b + _om_th;
			
			draw_set_color(c_white);
			
			draw_rectangle(_om_x + -_om_b,_om_y + -_om_b,_om_x + _om_w + _om_b,_om_y + _om_h + _om_b,false);
			draw_rectangle(_om_tx1,_om_ty1,_om_tx2,_om_ty2,false);
			draw_triangle(_om_tx1,_om_ty1,_om_tx1,_om_ty2,_om_tx1 + -25,_om_ty1,false);
			draw_triangle(_om_tx2,_om_ty1,_om_tx2,_om_ty2,_om_tx2 + 25,_om_ty1,false);
			
			draw_set_color(c_dkgray);
			
			draw_rectangle(_om_x,_om_y,_om_x + _om_w,_om_y + _om_h,false);
			draw_text(room_width / 2,_om_y + _om_h + _om_b + 5,_om_str);
			
			draw_set_color(c_orange);
			
			draw_rectangle(_om_x,_om_y,_om_x + _om_w2,_om_y + _om_h,false);
		}
	
	#endregion
	
	#region //draw party
	
		var
		_uiDrawX = 200,
		_uiDrawY = 480,
		_portX = _uiDrawX + -25,
		_portY = _uiDrawY + 184,
		_partyI = 0,
		_highlight = -1, //if >=0, draw highlighted character menu;
		_uiCol = [
			c_white,
			c_dkgray
		];
		
		if(!surface_exists(sfc_highlighted)){
			sfc_highlighted = surface_create(100,100);
		}
		
		surface_set_target(sfc_highlighted);
		draw_clear_alpha(c_white,0);
		
		surface_reset_target();
		
		repeat(3){
			if(!surface_exists(sfc_party)){
				sfc_party = surface_create(300,300);
			}
			
			surface_set_target(sfc_party);
			draw_clear_alpha(c_white,0);
		
			var
			_hbSize = 35,
			_hbGap = 5,
			_portW = 75,
			_portH = 115,
			_barH = 16,
			_barGap = 8,
			_barBS = 30, //side border
			_barBB = 4, //bottom border
			_drawX = 0,
			_drawY = _hbSize + _hbGap + 20,
			_drawSideX = 5,
			_drawSideY = 5,
			_drawW = _portW,
			_drawH = _portH,
			_mem = global.grd_party_player[# _partyI,0];
			
			if(instance_exists(_mem)){
				_uiCol[0] = make_color_rgb(255,255 * (1 + -(_mem.hurtShake)),255 * (1 + -(_mem.hurtShake)));
			}
			
			draw_set_color(_mem != noone ? _uiCol[0] : _uiCol[1]);
			draw_set_alpha(1);
		
			//portrait
			draw_rectangle(_drawX,_drawY,_drawX + _drawW,_drawY + _drawH,false);
			
			draw_set_font(ft_dungeonBold);
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			
			if(scr_exists(_mem,asset_object)){
				var _name = _mem.src[? CHAR_VAR_NAMEDISP];
				
				if(_mem.aggro != 0){
					_name += "\n" + (_mem.aggro > 0 ? "+" : "") + string(_mem.aggro);
				}
				
				draw_text(_drawX,_drawY + _portH + _hbGap,_name);
			}
		
			_drawX += _portW + _hbGap;
			_drawY = 20;
			_drawW = _hbSize;
			_drawH = _drawW;
		
			#region //hotbar
				var
				_i = 0,
				_act = noone; //used for fetching hotbar skills
			
				//draw for party ui
				repeat(2){
					repeat(2){
						repeat(2){
							var _using = false;
							
							if(instance_exists(_mem)){
								_act = _mem.act[_i];
								
								_using = (scr_exists(_act,asset_object) && _mem.actUsing == _act);
							}
							
							scr_drawActIcon(_drawX,_drawY,_drawW,_act,_uiCol[0],_uiCol[1],0,_using);
						
							draw_set_alpha(1);
					
							_drawY += _hbSize + _hbGap;
					
							_i++;
						}
			
						_drawY += -(_hbSize + _hbGap) * 2;
						_drawX += _hbSize + _hbGap;
					}
				}
			
				//draw for highlighted character ui
				if(
					_highlight == -1
					&& scr_checkInput(en_ic_check.down,en_ic_key.party1 + _partyI)
					&& _mem != noone
					&& _mem.hpCurr > 0
					&& state_battle
				){
					_i = scr_checkInput(en_ic_check.down,en_ic_key.partyShift) * 4;
					_highlight = _partyI;
					surface_reset_target();
					surface_set_target(sfc_highlighted);
					
					repeat(2){
						repeat(2){
							//draw for party ui
							
							if(instance_exists(_mem)){
								_act = _mem.act[_i];
								
								_using = (scr_exists(_act,asset_object) && _mem.actUsing == _act);
							}
							
							scr_drawActIcon(_drawSideX,_drawSideY,_drawW,_act,_uiCol[0],_uiCol[1],0,_using);
						
							draw_set_alpha(1);
	
							_drawSideY += _hbSize + _hbGap;
					
							_i++;
						}
	
						_drawSideY += -(_hbSize + _hbGap) * 2;
						_drawSideX += _hbSize + _hbGap;
					}
					
					surface_reset_target();
					surface_set_target(sfc_party);
				}
				
			#endregion
			
			draw_set_color(_mem != noone ? _uiCol[0] : _uiCol[1]);
	
			#region //hp/en
			
				_drawX += -(_hbSize + _hbGap) * 4;
				_drawY += _barGap + -_hbGap + ((_hbGap + _hbSize) * 2);
				_drawW = ((_hbSize + _hbGap) * 4) + -_hbGap;
				_drawH = _barH;
				
				draw_rectangle(_drawX,_drawY,_drawX + _drawW,_drawY + _drawH,false);
				
				if(_mem != noone){
					var _hpRatio = clamp(_mem.hpCurr / _mem.hpMax,0,1);
					
					_mem.hpBarOver = min(_hpRatio,ktk_scr_tween(_mem.hpBarOver,_hpRatio,1,0.007));
					_mem.hpBarUnder = max(_hpRatio,ktk_scr_tween(_mem.hpBarUnder,_hpRatio,1,0.007));
					
					draw_set_color(_uiCol[1]);
				
					draw_rectangle(_drawX + _barBS,_drawY,_drawX + _drawW,_drawY + _drawH + -_barBB,false);
					
					draw_set_color(_mem.hpBarOver == _hpRatio ? c_red : c_white);
					
					draw_rectangle(_drawX + _barBS,_drawY,_drawX + _barBS + ((_drawW + -_barBS) * _mem.hpBarUnder),_drawY + _drawH + -_barBB,false);
					
					draw_set_color(CC_HPGREEN);
				
					draw_rectangle(_drawX + _barBS,_drawY,_drawX + _barBS + ((_drawW + -_barBS) * _mem.hpBarOver),_drawY + _drawH + -_barBB,false);
				
					draw_set_color(_uiCol[1]);
					draw_set_halign(fa_left);
					
					draw_text(_drawX + 3,_drawY + 3,"HP");
					
					draw_set_halign(fa_right);
					
					ktk_scr_draw_text_stroke(_drawX + _drawW + -3,_drawY + -2,string(ceil(_mem.hpCurr)),c_white,c_dkgray,1,20);
					
					draw_set_color(_uiCol[0]);
					
					var
					_tx1 = _drawX + _barBS + -1,
					_ty1 = _drawY + -1,
					_tx2 = _tx1,
					_ty2 = _ty1 + _barH + -_barBB + 1,
					_tx3 = _tx1 + 8,
					_ty3 = _ty2;
					
					draw_triangle(_tx1,_ty1,_tx2,_ty2,_tx3,_ty3,false);
				}
				
				_drawY += _barH + _barGap;
				
				draw_rectangle(_drawX,_drawY,_drawX + _drawW,_drawY + _drawH,false);
				
				if(_mem != noone){
					draw_set_color(_uiCol[1]);
				
					draw_rectangle(_drawX + _barBS,_drawY,_drawX + _drawW,_drawY + _drawH + -_barBB,false);
					
					draw_set_color(CC_ENBLUE);
				
					draw_rectangle(_drawX + _barBS,_drawY,_drawX + _barBS + ((_drawW + -_barBS) * (_mem.enCurr / _mem.enMax)),_drawY + _drawH + -_barBB,false);
					
					draw_set_color(_uiCol[1]);
					draw_set_halign(fa_left);
					
					draw_text(_drawX + 3,_drawY + 3,"EN");
					
					draw_set_halign(fa_right);
					
					ktk_scr_draw_text_stroke(_drawX + _drawW + -3,_drawY + -2,string(floor(_mem.enCurr)),c_white,c_dkgray,1,20);
					
					draw_set_color(_uiCol[0]);
					
					var
					_tx1 = _drawX + _barBS + -1,
					_ty1 = _drawY + -1,
					_tx2 = _tx1,
					_ty2 = _ty1 + _barH + -_barBB + 1,
					_tx3 = _tx1 + 8,
					_ty3 = _ty2;
					
					draw_triangle(_tx1,_ty1,_tx2,_ty2,_tx3,_ty3,false);
				}
				
				if(instance_exists(_mem) && _mem.hpCurr <= 0){
					image_blend = c_gray;
				}
			
			#endregion
			
			#region //stance
			
				draw_set_color(_uiCol[0]);
				
				if(scr_exists(_mem,asset_object) && scr_exists(_mem.stance,asset_object)){
					_drawY += _barH + _barGap;
					
					draw_rectangle(_drawX,_drawY,_drawX + (_drawW * .65),_drawY + (_drawH * 1.5),false);
					scr_cEvent_id(_mem.stance,EVENT_EFFECT_STANCEDRAW,_drawX,_drawY,_uiCol[0]);
				}
			
			#endregion
			
			surface_reset_target();
			draw_set_color(c_white);
			
			var
			_shakeX = 0,
			_shakeY = 0;
			
			if(instance_exists(_mem)){
				_shakeX = (sin(_mem.direction) * _mem.hurtShake * 20);
				_shakeY = (cos(_mem.direction) * _mem.hurtShake * 20);
			}
		
			draw_surface_ext(sfc_party,_uiDrawX + _shakeX,_uiDrawY + _shakeY,1,1,-30,image_blend,1);
			
			if(scr_exists(_mem,asset_object) && ds_map_exists(_mem.src,CHAR_VAR_SPR_BATTLEPORT)){
				draw_set_alpha((_mem.iFrames > 0 && ceil(current_time / 10) mod 2 == 0) ? .6 : 1);
				
				draw_sprite_ext(_mem.src[? CHAR_VAR_SPR_BATTLEPORT],0,_portX + _shakeX,_portY + _shakeY,1,1,0,image_blend,draw_get_alpha());
				
				draw_set_alpha(1);
				
				var
				_ch_offX = 0,
				_ch_offY = -70,
				_ch_size = 15,
				_ch_w1 = 3, //weight
				_ch_w2 = 2,
				_tg_y = -150, //target grid
				_tg_size = 0,
				_tg_gap = 2;
				
				scr_cEvent_id(_mem,EVENT_BATTLM_ICONDRAW);
				
				if(_partyI == tgtSlot){
					draw_set_color(c_white);
					
					var _off = 0;
					
					repeat(_ch_w1){
						draw_circle(_portX + _ch_offX,_portY + _ch_offY,_ch_size + _off,true);
						draw_circle(_portX + _ch_offX,_portY + _ch_offY,_ch_size + -_off,true);
						
						_off += .5;
					}
					
					draw_set_color(c_yellow);
					
					repeat(_ch_w2){
						draw_circle(_portX + _ch_offX,_portY + _ch_offY,_ch_size + _off,true);
						draw_circle(_portX + _ch_offX,_portY + _ch_offY,_ch_size + -_off,true);
						
						_off += .5;
					}
					
					var _ch_a = (current_time / 10) mod 360;
					
					repeat(3){
						draw_set_color(c_yellow);
						
						draw_line_width(_portX + _ch_offX + lengthdir_x(_ch_size * .5,_ch_a),_portY + _ch_offY + lengthdir_y(_ch_size * .5,_ch_a),_portX + _ch_offX + lengthdir_x(_ch_size * 1.25,_ch_a),_portY + _ch_offY + lengthdir_y(_ch_size * 1.25,_ch_a),_ch_w1 + _ch_w2);
						
						draw_set_color(c_white);
						
						draw_line_width(_portX + _ch_offX + lengthdir_x(_ch_size * .5,_ch_a),_portY + _ch_offY + lengthdir_y(_ch_size * .5,_ch_a),_portX + _ch_offX + lengthdir_x(_ch_size * 1.25,_ch_a),_portY + _ch_offY + lengthdir_y(_ch_size * 1.25,_ch_a),_ch_w1);
						
						_ch_a += 120;
					}
					
					draw_set_color(c_white);
				}
				
				//draw target grid if targetted by act
				draw_set_alpha(0);
				
				repeat(2){
					var _a = 180;
					
					for(var _i2 = 0;_i2 < 3;_i2++){
						draw_set_color(c_yellow);
						_tg_size = 15;
						
						var
						_tg_offX = _portX + lengthdir_x((_tg_size) + _tg_gap,_a),
						_tg_offY = _portY + _tg_y + lengthdir_y((_tg_size) + _tg_gap,_a);
						
						draw_triangle(_tg_offX + -_tg_size,_tg_offY,_tg_offX,_tg_offY + -_tg_size,_tg_offX,_tg_offY + _tg_size,false);
						draw_triangle(_tg_offX + _tg_size,_tg_offY,_tg_offX,_tg_offY + -_tg_size,_tg_offX,_tg_offY + _tg_size,false);
						
						var _bm = global.grd_party_player[# _i2,0];
						
						if(instance_exists(_bm) && _bm.tgtIndex == _partyI && !_bm.tgtEnemy){
							draw_set_alpha(1);
						}else{
							draw_set_color(c_dkgray);
							_tg_size += -2;
							
							draw_triangle(_tg_offX + -_tg_size,_tg_offY,_tg_offX,_tg_offY + -_tg_size,_tg_offX,_tg_offY + _tg_size,false);
							draw_triangle(_tg_offX + _tg_size,_tg_offY,_tg_offX,_tg_offY + -_tg_size,_tg_offX,_tg_offY + _tg_size,false);
						}
						
						_a += -90;
					}
				}
				
				draw_set_color(c_white);
				draw_set_alpha(1);
			}
			
			image_blend = c_white;
			
			if(_highlight == _partyI){	
				var
				_i = scr_checkInput(en_ic_check.down,en_ic_key.partyShift) * 4,
				_a = 105,
				_actArr = [0,1,3,2,4,5,7,6],
				_crossX = _uiDrawX + 50,
				_crossY = _uiDrawY + 60,
				_crossR = 70;
				
				draw_surface_ext(sfc_highlighted,_crossX + -15,_crossY + -155,1,1,-30,c_white,1);
				
				repeat(4){
					var
					_x = _crossX + lengthdir_x(_crossR,_a),
					_y = _crossY + -90 + lengthdir_y(_crossR,_a),
					_currAct = _mem.act[_actArr[_i]];
					
					draw_set_font(ft_dungeonBold);
					draw_set_valign(fa_middle);
					draw_set_halign(((_i + 2) mod 4) < 2 ? fa_left : fa_right);
					
					if(_currAct != noone){
						ktk_scr_draw_text_shadow(_x,_y,_currAct.name,c_white,c_dkgray,2);
					}
					
					_i++;
					_a += 90;
				}
			}
			
			_uiDrawX += 380;
			_portX += 380;
			_partyI++;
		}
		
		#region //tutorial info
		
			if(state_battle && global.map_flags[? FG_PROLOGUE]){
				draw_set_font(ft_menuSub);
				draw_set_halign(fa_right);
				draw_set_valign(fa_bottom);
				
				var
				_str =
				"Select Party Member 1/2/3:" +
				"\nHold [Z]/[X]/[C]" +
				
				"\n\nSelect Act:" +
				"\n(with party member selected) [U/D/L/R Arrow Keys]" +
				"\n*Hold [Shift] to access Acts 5-8" +
				
				"\n\nManual Target:" +
				"\n(without party member selected) [U/L/R Arrow Keys]" +
				
				"\n\nAuto Target:" +
				"\n(without party member selected) [D Arrow Key]",
				
				_w = room_width + -string_width(_str) + -10,
				_h = room_height + -string_height(_str) + -20,
				_colA = make_color_hsv(0,0,255 * .8);
				
				gpu_set_blendmode(bm_subtract);
				
				draw_rectangle_color(room_width,room_height,_w,_h,_colA,_colA,_colA,_colA,false);
				draw_rectangle_color(_w + 1,_h + 1,_w + -100,room_height,c_black,_colA,_colA,c_black,false);
				
				gpu_set_blendmode(bm_normal);
				
				ktk_scr_draw_text_shadow(room_width + -10,room_height + -10,_str,c_white,c_dkgray,2);
			}
		
		#endregion

	#endregion
	
}

//testing
if(DEBUG){
	for(var _i = 0;_i < 3;_i++){
		var _o = global.grd_party_enemy[# _i,0];
		
		if(instance_exists(_o)){
			draw_set_font(ft_dungeonBold);
			draw_set_halign(fa_center);
			draw_set_valign(fa_top);
			
			ktk_scr_draw_text_shadow(_o.x,_o.y,"Lv." + string(_o.level) + "\n" + string(_o.hpCurr) + "/" + string(_o.hpMax),c_white,c_dkgray,2);
		}
	}
}

draw_set_alpha(1);
draw_set_color(c_white);