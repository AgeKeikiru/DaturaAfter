/// @description Insert description here
// You can write your code in this editor

var
_pDraw_x = 1280 / 2, //where to draw the player icon on screen
_pDraw_y = 300,
_gridH = 70, //how large to draw map grid squares
_gridW = 140,
_gridGap = 20; //how much space is between map grid squares

#region //calculate offset for drawing map to keep player icon centered

	var
	_gridOffX = _pDraw_x + -(global.dMap_xPos * (_gridW + _gridGap)),
	_gridOffY = _pDraw_y + -(global.dMap_yPos * (_gridH + _gridGap));

#endregion

#region//draw map grid

	var
	_gridStartX = _gridOffX;

	for(var _iy = 0;_iy < ds_grid_height(global.grd_dMap_terrain);_iy++){
	
		_gridOffX = _gridStartX;
	
		for(var _ix = 0;_ix < ds_grid_width(global.grd_dMap_terrain);_ix++){
			//only draw if the tile is on screen
			if(
				_gridOffX <= 1280 + _gridW
				&& 0 + -_gridW <= _gridOffX
				&& _gridOffY <= 720 + _gridH
				&& 0 + -_gridH <= _gridOffY)
			{
				draw_set_alpha(1);
			
				var
				_x1 = _gridOffX + -(_gridW / 2),
				_x2 = _gridOffX + (_gridW / 2),
				_y1 = _gridOffY + -(_gridH / 2),
				_y2 = _gridOffY + (_gridH / 2);
			
				if(global.grd_dMap_visible[# _ix,_iy]){
					if(global.grd_dMap_terrain[# _ix,_iy] != noone){
						//arrows
						draw_set_color(c_gray);
						
						//left
						if(global.grd_dMap_terrain[# _ix + -1,_iy] != noone){
							draw_line_width(_gridOffX,_gridOffY,_gridOffX + -(_gridW + _gridGap) / 2,_gridOffY,5);
							
							draw_triangle(_x1 + -(_gridGap * .4),_gridOffY,_gridOffX + -(_gridW * .35),_y1 + (_gridH * .25),_gridOffX + -(_gridW * .35),_y2 + -(_gridH * .25),false);
						}
						
						//right
						if(global.grd_dMap_terrain[# _ix + 1,_iy] != noone){
							draw_line_width(_gridOffX,_gridOffY,_gridOffX + (_gridW + _gridGap) / 2,_gridOffY,5);
							
							draw_triangle(_x2 + (_gridGap * .4),_gridOffY,_gridOffX + (_gridW * .35),_y1 + (_gridH * .25),_gridOffX + (_gridW * .35),_y2 + -(_gridH * .25),false);
						}
						
						//top
						if(global.grd_dMap_terrain[# _ix,_iy + -1] != noone){
							draw_line_width(_gridOffX,_gridOffY,_gridOffX,_gridOffY + -(_gridH + _gridGap) / 2,5);
							
							draw_triangle(_gridOffX,_y1 + -(_gridGap * .2),_gridOffX + -(_gridW * .25),_y1 + (_gridH * .15),_gridOffX + (_gridW * .25),_y1 + (_gridH * .15),false);
						}
						
						//bottom
						if(global.grd_dMap_terrain[# _ix,_iy + 1] != noone){
							draw_line_width(_gridOffX,_gridOffY,_gridOffX,_gridOffY + (_gridH + _gridGap) / 2,5);
							
							draw_triangle(_gridOffX,_y2 + (_gridGap * .2),_gridOffX + -(_gridW * .25),_y2 + -(_gridH * .15),_gridOffX + (_gridW * .25),_y2 + -(_gridH * .15),false);
						}
						
						//border
						draw_set_color(c_dkgray);
						
						draw_triangle(_x1,_gridOffY,_gridOffX,_y1,_gridOffX,_y2,false);
						draw_triangle(_x2,_gridOffY,_gridOffX,_y1,_gridOffX,_y2,false);
						
						//fill
						draw_set_color(c_white);
						
						if(instance_exists(obj_handler_mission_parent)){
							var _mh = instance_find(obj_handler_mission_parent,0);
							
							for(var _i = 0;_i < ds_grid_width(_mh.grd_events);_i++){
								if(_mh.grd_events[# _i,MHE_VAR_X] == _ix && _mh.grd_events[# _i,MHE_VAR_Y] == _iy && _mh.grd_events[# _i,MHE_VAR_VIS]){
									draw_set_color(c_green);
								}
							}
						}
						
						_x1 = _gridOffX + -(_gridW / 2.5);
						_x2 = _gridOffX + (_gridW / 2.5);
						_y1 = _gridOffY + -(_gridH / 2.5);
						_y2 = _gridOffY + (_gridH / 2.5);
						
						draw_triangle(_x1,_gridOffY,_gridOffX,_y1,_gridOffX,_y2,false);
						draw_triangle(_x2,_gridOffY,_gridOffX,_y1,_gridOffX,_y2,false);
					}else{
						draw_set_color(c_black);
						draw_set_alpha(.7);
						
						//draw_rectangle(_x1,_y1,_x2,_y2,false);
					}
				}
			}
		
			_gridOffX += _gridW + _gridGap;
		}
	
		_gridOffY += _gridH + _gridGap;
	}

#endregion

#region //draw player icon
	
	draw_set_alpha(.5);
	draw_set_color(c_black);
	
	draw_ellipse(_pDraw_x + -(_gridW / 4),_pDraw_y + -(_gridH / 4),_pDraw_x + (_gridW / 4),_pDraw_y + (_gridH / 4),false);
	
	draw_set_alpha(1);
	draw_set_color(c_white);

	draw_sprite_ext(pIcon,-1,_pDraw_x,_pDraw_y,4,4,0,c_white,1);

#endregion

if(!state_event && !state_results){
	#region //draw minimap
	
		var
		_mm_size = 4,
		_mm_x = 5,
		_mm_y = 5,
		_mm_xStart = _mm_x,
		_mm_yStart = _mm_y,
		_mm_a = .8,
		_mm_ix = clamp(round(global.dMap_xPos) + -15,0,max(ds_grid_width(global.grd_dMap_terrain) + -31,0)),
		_mm_iy = clamp(round(global.dMap_yPos) + -15,0,max(ds_grid_height(global.grd_dMap_terrain) + -31,0));
		
		draw_set_alpha(_mm_a);
		
		for(var _ix = _mm_ix;_ix < _mm_ix + 30;_ix++){
			for(var _iy = _mm_iy;_iy < _mm_iy + 30;_iy++){
				if(_ix < ds_grid_width(global.grd_dMap_terrain) && _iy < ds_grid_height(global.grd_dMap_terrain)){
					draw_set_color(global.grd_dMap_terrain[# _ix,_iy] == DMAP_TER_FLOOR ? c_white : c_black);
					
					if(!global.grd_dMap_visible[# _ix,_iy]){
						draw_set_color(c_gray);
					}
					
					if(instance_exists(obj_handler_mission_parent)){
						var _mh = instance_find(obj_handler_mission_parent,0);
					
						for(var _i = 0;_i < ds_grid_width(_mh.grd_events);_i++){
							if(_mh.grd_events[# _i,MHE_VAR_X] == _ix && _mh.grd_events[# _i,MHE_VAR_Y] == _iy && _mh.grd_events[# _i,MHE_VAR_VIS]){
								draw_set_color(c_lime);
							}
						}
					}
					
					if(_ix == round(global.dMap_xPos) && _iy == round(global.dMap_yPos)){
						draw_set_color(c_red);
					}
					
					draw_rectangle(_mm_x + ((_ix + -_mm_ix) * _mm_size),_mm_y + ((_iy + -_mm_iy) * _mm_size),_mm_x + ((_ix + -_mm_ix + 1) * _mm_size),_mm_y + ((_iy + -_mm_iy + 1) * _mm_size),false);
				}
			}
		}
		
		draw_set_alpha(1);
	
	#endregion
	
	#region //draw timer

		var
	    _timeT = missionTime / room_speed,
	    _timeM = string_format(floor(_timeT / 60),2,0),
	    _timeS = string_format(_timeT mod 60,2,2),
	    _timeDebug = CANARY ? string(missionDmg) : "";
	    
	    draw_set_font(ft_dungeonBold);
	    draw_set_halign(fa_left);
	    draw_set_valign(fa_top);
	    
	    ktk_scr_draw_text_stroke(10,150,string_replace_all(_timeM," ","0") + ":" + string_replace_all(_timeS," ","0") + "\n" + _timeDebug,c_white,c_dkgray,2,10);
	
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
				draw_sprite_ext(_o.src[? CHAR_VAR_SPR_BATTLEPORT],0,_x + (sin(_o.direction) * _o.hurtShake * 20),_y + (cos(_o.direction) * _o.hurtShake * 20),1,1,0,make_color_rgb(255,255 * (1 + -_o.hurtShake),255 * (1 + -_o.hurtShake)),1);
				
				var
				_fill = ceil(360 * (_o.enemyWait / _o.enemyWaitMax)),
				_a = 0,
				_r = 15,
				_x2 = _x + -100,
				_y2 = _y;
				
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
				
				draw_set_color(c_white);
				draw_set_alpha(1);
			}
			
			_x += _gap;
		}
	
	#endregion
}

if(!state_event && !state_results){
	#region//draw party
	
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
			_drawSideX = 0,
			_drawSideY = 0,
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
			
			if(_mem != noone){
				draw_text(_drawX,_drawY + _portH + _hbGap,_mem.src[? CHAR_VAR_NAMEDISP]);
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
							
							if(instance_exists(_mem)){
								_act = _mem.act[_i];
							}
							
							draw_set_color(instance_exists(_act) ? _uiCol[0] : _uiCol[1]);
							
							if(instance_exists(_act)){
								draw_set_color(_act.enCost > _mem.enCurr ? c_red : _uiCol[0]);
							}else{
								draw_set_color(_uiCol[1]);
							}
							
							draw_rectangle(_drawX,_drawY,_drawX + _drawW,_drawY + _drawH,false);
							
							if(instance_exists(_act)){
								draw_set_color(c_black);
								draw_set_alpha(.5);
							
								draw_rectangle(_drawX,_drawY,_drawX + _drawW,_drawY + (_drawH * (_act.cdCurr / _act.cdMax)),false);
								
								if(_mem.actUsing == _act){
									var
									_glowAlpha = ((sin(current_time / 100) + 1) / 20) + .8,
									_glowSize = 1;
									
									draw_set_color(c_yellow);
									
									repeat(5){
										draw_set_alpha(_glowAlpha);
										
										draw_rectangle(_drawX + -_glowSize,_drawY + -_glowSize,_drawX + _drawW + _glowSize,_drawY + _drawH + _glowSize,true);
										
										_glowAlpha += -.1;
										_glowSize++;
									}
								}
							
								draw_set_alpha(1);
							}
					
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
					&& scr_checkInput(IC_CHECK_DOWN,IC_KEY_PARTY1 + _partyI)
					&& _mem != noone
					&& _mem.hpCurr > 0
					&& state_battle
				){
					_i = scr_checkInput(IC_CHECK_DOWN,IC_KEY_PARTYSHIFT) * 4;
					_highlight = _partyI;
					surface_reset_target();
					surface_set_target(sfc_highlighted);
					
					repeat(2){
						repeat(2){
							//draw for party ui
							
							if(instance_exists(_mem)){
								_act = _mem.act[_i];
							}
							
							draw_set_color(instance_exists(_act) ? _uiCol[0] : _uiCol[1]);
							
							draw_rectangle(_drawSideX,_drawSideY,_drawSideX + _drawW,_drawSideY + _drawH,false);
							
							if(instance_exists(_act)){
								draw_set_color(c_black);
								draw_set_alpha(.5);
							
								draw_rectangle(_drawSideX,_drawSideY,_drawSideX + _drawW,_drawSideY + (_drawH * (_act.cdCurr / _act.cdMax)),false);
							
								draw_set_alpha(1);
							}
	
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
	
			//hp/en
			_drawX += -(_hbSize + _hbGap) * 4;
			_drawY += _barGap + -_hbGap + ((_hbGap + _hbSize) * 2);
			_drawW = ((_hbSize + _hbGap) * 4) + -_hbGap;
			_drawH = _barH;
			
			draw_rectangle(_drawX,_drawY,_drawX + _drawW,_drawY + _drawH,false);
			
			if(_mem != noone){
				draw_set_color(_uiCol[1]);
			
				draw_rectangle(_drawX + _barBS,_drawY,_drawX + _drawW,_drawY + _drawH + -_barBB,false);
				
				draw_set_color(CC_HPGREEN);
			
				draw_rectangle(_drawX + _barBS,_drawY,_drawX + _barBS + ((_drawW + -_barBS) * (_mem.hpCurr / _mem.hpMax)),_drawY + _drawH + -_barBB,false);
			
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
			
			if(_mem != noone && ds_map_exists(_mem.src,CHAR_VAR_SPR_BATTLEPORT)){
				draw_sprite_ext(_mem.src[? CHAR_VAR_SPR_BATTLEPORT],0,_portX + _shakeX,_portY + _shakeY,1,1,0,image_blend,1);
				
				var
				_ch_offX = 0,
				_ch_offY = -70,
				_ch_size = 15,
				_ch_w1 = 3, //weight
				_ch_w2 = 2,
				_tg_y = -150, //target grid
				_tg_size = 0,
				_tg_gap = 2;
				
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
				_i = scr_checkInput(IC_CHECK_DOWN,IC_KEY_PARTYSHIFT) * 4,
				_a = 105,
				_actArr = [0,1,3,2,4,5,7,6],
				_crossX = 640,
				_crossY = _uiDrawY + 60,
				_crossR = 70;
				
				draw_surface_ext(sfc_highlighted,_crossX + -15,_crossY + -150,1,1,-30,c_white,1);
				
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

	#endregion
}

//testing
if(CANARY){
	for(var _i = 0;_i < 3;_i++){
		var _o = global.grd_party_enemy[# _i,0];
		
		if(instance_exists(_o)){
			draw_set_font(ft_dungeonBold);
			draw_set_halign(fa_center);
			draw_set_valign(fa_top);
			
			ktk_scr_draw_text_shadow(_o.x,_o.y,string(_o.hpCurr) + "/" + string(_o.hpMax),c_white,c_dkgray,5);
		}
	}
}

draw_set_alpha(1);
draw_set_color(c_white);