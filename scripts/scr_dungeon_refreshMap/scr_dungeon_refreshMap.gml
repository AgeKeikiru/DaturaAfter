if(!surface_exists(global.sfc_map)){
    global.sfc_map = surface_create(room_width + 500,room_height + 500);
}

surface_set_target(global.sfc_map);
draw_clear_alpha(c_white,0);

var
_pDraw_x = surface_get_width(global.sfc_map) / 2, //where to draw the player icon on screen
_pDraw_y = 250 + 300,
_gridH = 70, //how large to draw map grid squares
_gridW = 140,
_gridGap = 20; //how much space is between map grid squares

#region //draw map grid

	var
	_drawDist = 4,
	_gridOffX = _pDraw_x + -(_drawDist * (_gridW + _gridGap)),
	_gridOffY = _pDraw_y + -(_drawDist * (_gridH + _gridGap)),
	_ixMin = floor(global.dMap_xPos) + -_drawDist,
	_ixMax = floor(global.dMap_xPos) + _drawDist + 1,
	_iyMin = floor(global.dMap_yPos) + -_drawDist,
	_iyMax = floor(global.dMap_yPos) + _drawDist + 1,
	_gridStartX = _gridOffX;

	for(var _iy = _iyMin;_iy < _iyMax;_iy++){
	
		_gridOffX = _gridStartX;
	
		for(var _ix = _ixMin;_ix < _ixMax;_ix++){
			//only draw if the tile is on screen
			if(
				clamp(_ix,0,ds_grid_width(global.grd_dMap_terrain) + -1) == _ix
				&& clamp(_iy,0,ds_grid_height(global.grd_dMap_terrain) + -1) == _iy
			){
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
						if(_ix > 0 && global.grd_dMap_terrain[# _ix + -1,_iy] != noone){
							draw_line_width(_gridOffX,_gridOffY,_gridOffX + -(_gridW + _gridGap) / 2,_gridOffY,5);
							
							draw_triangle(_x1 + -(_gridGap * .4),_gridOffY,_gridOffX + -(_gridW * .35),_y1 + (_gridH * .25),_gridOffX + -(_gridW * .35),_y2 + -(_gridH * .25),false);
						}
						
						//right
						if(_ix < ds_grid_width(global.grd_dMap_terrain) + -1 && global.grd_dMap_terrain[# _ix + 1,_iy] != noone){
							draw_line_width(_gridOffX,_gridOffY,_gridOffX + (_gridW + _gridGap) / 2,_gridOffY,5);
							
							draw_triangle(_x2 + (_gridGap * .4),_gridOffY,_gridOffX + (_gridW * .35),_y1 + (_gridH * .25),_gridOffX + (_gridW * .35),_y2 + -(_gridH * .25),false);
						}
						
						//top
						if(_iy > 0 && global.grd_dMap_terrain[# _ix,_iy + -1] != noone){
							draw_line_width(_gridOffX,_gridOffY,_gridOffX,_gridOffY + -(_gridH + _gridGap) / 2,5);
							
							draw_triangle(_gridOffX,_y1 + -(_gridGap * .2),_gridOffX + -(_gridW * .25),_y1 + (_gridH * .15),_gridOffX + (_gridW * .25),_y1 + (_gridH * .15),false);
						}
						
						//bottom
						if(_iy < ds_grid_height(global.grd_dMap_terrain) + -1 && global.grd_dMap_terrain[# _ix,_iy + 1] != noone){
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
						
						if(global.grd_dMap_terrain[# _ix,_iy] == DMAP_TER_LOOT){
							draw_set_color(c_yellow);
						}
						
						_x1 = _gridOffX + -(_gridW / 2.5);
						_x2 = _gridOffX + (_gridW / 2.5);
						_y1 = _gridOffY + -(_gridH / 2.5);
						_y2 = _gridOffY + (_gridH / 2.5);
						
						draw_triangle(_x1,_gridOffY,_gridOffX,_y1,_gridOffX,_y2,false);
						draw_triangle(_x2,_gridOffY,_gridOffX,_y1,_gridOffX,_y2,false);
					}
				}
			}
		
			_gridOffX += _gridW + _gridGap;
		}
	
		_gridOffY += _gridH + _gridGap;
	}

#endregion

surface_reset_target();
	
#region //draw minimap

	var
	_mm_size = 4,
	_mm_len = 30,
	_mm_x = 0,
	_mm_y = 0,
	_mm_xStart = _mm_x,
	_mm_yStart = _mm_y,
	_mm_a = .8,
	_mm_ix = clamp(round(global.dMap_xPos) + -15,0,max(ds_grid_width(global.grd_dMap_terrain) + -30,0)),
	_mm_iy = clamp(round(global.dMap_yPos) + -15,0,max(ds_grid_height(global.grd_dMap_terrain) + -30,0));
	
	if(!surface_exists(global.sfc_minimap)){
        global.sfc_minimap = surface_create(_mm_size * _mm_len,_mm_size * _mm_len);
    }
    
    surface_set_target(global.sfc_minimap);
    draw_clear_alpha(c_white,0);
	
	draw_set_alpha(_mm_a);
	
	for(var _ix = _mm_ix;_ix < _mm_ix + _mm_len;_ix++){
		for(var _iy = _mm_iy;_iy < _mm_iy + _mm_len;_iy++){
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

surface_reset_target();