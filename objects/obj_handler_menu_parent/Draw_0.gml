/// @description Insert description here

draw_set_alpha(image_alpha);

if(scr_exists(link_panel,asset_object) && visible && (!fancyMenu || submenu)){
	with link_panel{
		event_perform(ev_draw,0);
	}
}

if(btn_draw){
	var
	_ix = page_x,
	_iy = page_y,
	_iyStart = _iy,
	_highlight = false,
	_drawX = x,
	_drawY = y,
	_ui = instance_find(obj_handler_menuUI,0),
	_fancy = fancyMenu && scr_exists(_ui,asset_object) && !submenu;
	
	if(_fancy){
		_drawX = _ui.menuBG_tgt * 0.6;
		y = 160;
		page_h = 10;
	}
	
	if(scr_exists(link_panel,asset_object)){
		if(fancyMenu && submenu){
			_drawX = 0;
			btn_w = room_width / ds_grid_width(grd_txt);
			btn_gapX = 0;
			
			y = link_panel.y + link_panel.image_yscale + -btn_h;
			btn_gapY = 0;
		}
		
		if(ds_grid_height(grd_txt) > page_h){
			var
			_sb_y = _fancy ? (y + 10) : (link_panel.y + 25),
			_sb_x = link_panel.x + 4,
			_sb_y2 = _fancy ? (y + 440) : (link_panel.y + link_panel.image_yscale + -10),
			_sb_h = _sb_y2 + -_sb_y,
			_sb2_y = _sb_y + (_sb_h * (page_y / ds_grid_height(grd_txt))),
			_sb2_y2 = _sb_y + (_sb_h * ((page_y + page_h) / ds_grid_height(grd_txt)));
			
			draw_line_width_color(_sb_x,_sb_y,_sb_x,_sb_y2,2,c_gray,c_gray);
			draw_line_width_color(_sb_x,_sb2_y,_sb_x,_sb2_y2,2,c_white,c_white);
		}
	}
	
	draw_set_font(menu_font);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	
	if(_fancy){
		draw_set_halign(fa_right);
	}
	
	repeat(min(page_w,ds_grid_width(grd_txt))){
		_iy = _iyStart;
		_drawY = y;
		
		repeat(min(page_h,ds_grid_height(grd_txt))){
			_highlight = _ix == menu_x && _iy == menu_y;
			
			if(_fancy){
				var _btnW = _ui.menuBG_tgt + 10 + (_drawY * 0.37);
				
				draw_set_color(c_white);
				draw_set_alpha((!_highlight ? .1 : .8) * image_alpha);
				
				draw_rectangle(0,_drawY,_btnW,_drawY + btn_h,false);
				
				draw_set_color(_highlight ? c_dkgray : c_white);
				draw_set_alpha((grd_scr[# _ix,_iy] != noone ? 1 : .5) * image_alpha);
				
				draw_text(_btnW + -50,_drawY,grd_txt[# _ix,_iy]);
			}else{
				draw_set_color((fancyMenu && submenu) ? c_dkgray : c_white);
				draw_set_alpha((!_highlight ? .1 : .8) * image_alpha);
				
				var _yOff = -10 * (_highlight && fancyMenu && submenu);
				
				draw_rectangle(_drawX,_drawY + _yOff,_drawX + btn_w,_drawY + btn_h,false);
				
				if(fancyMenu && submenu){
					_highlight = !_highlight;
				}
				
				draw_set_color(_highlight ? c_dkgray : c_white);
				draw_set_alpha((grd_scr[# _ix,_iy] != noone ? 1 : .5) * image_alpha);
				
				draw_text(_drawX + (btn_w / 2),_drawY,grd_txt[# _ix,_iy]);
			}
			
			_iy++;
			_drawY += btn_h + btn_gapY;
		}
		
		_ix++;
		_drawX += btn_w + btn_gapX;
	}
}

image_alpha = ktk_scr_tween(image_alpha,1,3,-1);

draw_set_alpha(1);
draw_set_color(c_white);