/// @description Insert description here
// You can write your code in this editor
if(rebindMode){
	var _key = scr_keyToString(keyboard_lastkey);
	
	if(_key == ""){
		link_panel.txt[1] = "Invalid character.";
		grd_txt[# 0,0] = "OK";
		grd_scr[# 0,0] = scr_menu_backNoRefresh;
		rebindMode = false;
	}else{
		global.tempObj.grd_txt[# 0,global.tempInt] = scr_stringGapFormat(global.grd_controls[# global.tempInt,2],_key,25);
		global.tempArr[global.tempInt] = keyboard_lastkey;
		
		scr_menu_backNoRefresh();
	}
}else if(ds_stack_top(global.stk_menu) == id && visible){
	var
	_sfx = noone,
	_xPressed = false,
	_yPressed = false;
	
	if(scr_checkInput(en_ic_check.down,en_ic_key.up)){
		if(scr_checkInput(en_ic_check.press,en_ic_key.up)){
			io_clear();
			global.autoScrollDelay = AUTOSCROLLTHRESH;
			_yPressed = true;
		}
		
		if(global.autoScrollDelay == 0){
			global.autoScrollDelay = AUTOSCROLLTHRESH;
		}
	
		if(global.autoScrollDelay == AUTOSCROLLTHRESH){
			if(ds_grid_height(grd_txt) > 1){
				_sfx = SFX_SCROLLTICK;
			}
			
			menu_y--;
		}
	}else if(scr_checkInput(en_ic_check.down,en_ic_key.down)){
		if(scr_checkInput(en_ic_check.press,en_ic_key.down)){
			io_clear();
			global.autoScrollDelay = AUTOSCROLLTHRESH;
			_yPressed = true;
		}
		
		if(global.autoScrollDelay == 0){
			global.autoScrollDelay = AUTOSCROLLTHRESH;
		}
		
		if(global.autoScrollDelay == AUTOSCROLLTHRESH){
			if(ds_grid_height(grd_txt) > 1){
				_sfx = SFX_SCROLLTICK;
			}
		
			menu_y++;
		}
	}else if(scr_checkInput(en_ic_check.down,en_ic_key.left)){
		if(scr_checkInput(en_ic_check.press,en_ic_key.left)){
			io_clear();
			global.autoScrollDelay = AUTOSCROLLTHRESH;
			_xPressed = true;
		}
		
		if(global.autoScrollDelay == 0){
			global.autoScrollDelay = AUTOSCROLLTHRESH;
		}
		
		if(global.autoScrollDelay == AUTOSCROLLTHRESH){
			if(ds_grid_width(grd_txt) > 1){
				_sfx = SFX_SCROLLTICK;
			}
		
			if(
				script_exists(grd_scr[# menu_x,menu_y])
				&& menu_x < ds_grid_width(grd_toggle)
				&& menu_y < ds_grid_height(grd_toggle)
				&& grd_toggle[# menu_x,menu_y]
			){
				script_execute(grd_scr[# menu_x,menu_y],false);
				_sfx = SFX_SCROLLTICK;
			}else{
				menu_x--;
				
				if(
					variable_global_exists("labMenu") &&
					scr_exists(global.labMenu,asset_object) &&
					(menu_x == clamp(menu_x,0,ds_grid_width(grd_txt) + -1) || _xPressed)
				){
					global.labMenu.link_panel.x += -200;
					global.labMenu.link_panel.image_xscale = 0;
				}
			}
		}
	}else if(scr_checkInput(en_ic_check.down,en_ic_key.right)){
		if(scr_checkInput(en_ic_check.press,en_ic_key.right)){
			io_clear();
			global.autoScrollDelay = AUTOSCROLLTHRESH;
			_xPressed = true;
		}
		
		if(global.autoScrollDelay == 0){
			global.autoScrollDelay = AUTOSCROLLTHRESH;
		}
		
		if(global.autoScrollDelay == AUTOSCROLLTHRESH){
			if(ds_grid_width(grd_txt) > 1){
				_sfx = SFX_SCROLLTICK;
			}
		
			if(
				script_exists(grd_scr[# menu_x,menu_y])
				&& menu_x < ds_grid_width(grd_toggle)
				&& menu_y < ds_grid_height(grd_toggle)
				&& grd_toggle[# menu_x,menu_y]
			){
				script_execute(grd_scr[# menu_x,menu_y],true);
				_sfx = SFX_SCROLLTICK;
			}else{
				menu_x++;
				
				if(
					variable_global_exists("labMenu") &&
					scr_exists(global.labMenu,asset_object) &&
					(menu_x == clamp(menu_x,0,ds_grid_width(grd_txt) + -1) || _xPressed)
				){
					global.labMenu.link_panel.x += 200;
					global.labMenu.link_panel.image_xscale = 0;
				}
			}
		}
	}else if(scr_checkInput(en_ic_check.press,en_ic_key.menuAccept)){
		io_clear();
		
		if(!script_exists(grd_scr[# menu_x,menu_y])){
			_sfx = sfx_deny;
		}
	
		if(
			script_exists(grd_scr[# menu_x,menu_y])
			&& (
				menu_x >= ds_grid_width(grd_toggle)
				|| menu_y >= ds_grid_height(grd_toggle)
				|| !grd_toggle[# menu_x,menu_y]
			)
		){
			script_execute(grd_scr[# menu_x,menu_y]);
			_sfx = SFX_ACCEPTTICK;
		}
	}else if(scr_checkInput(en_ic_check.press,en_ic_key.menuBack)){
		io_clear();
	
		if(script_exists(back_function)){
			script_execute(back_function);
		}
	}

	if(_xPressed){
		menu_x = (menu_x + ds_grid_width(grd_txt)) mod ds_grid_width(grd_txt);
	}else{
		if(menu_x != clamp(menu_x,0,ds_grid_width(grd_txt) + -1)){
			_sfx = noone;
		}
		
		menu_x = clamp(menu_x,0,ds_grid_width(grd_txt) + -1);
	}
	
	if(_yPressed){
		menu_y = (menu_y + ds_grid_height(grd_txt)) mod ds_grid_height(grd_txt);
	}else{
		if(menu_y != clamp(menu_y,0,ds_grid_height(grd_txt) + -1)){
			_sfx = noone;
		}
		
		menu_y = clamp(menu_y,0,ds_grid_height(grd_txt) + -1);
	}
	
	
	scr_playSfx(_sfx);
	
	if(menu_x > page_x + page_w + -1){
		page_x = menu_x + -page_w + 1;
	}
	
	if(menu_x < page_x){
		page_x = menu_x;
	}
	
	if(menu_y > page_y + page_h + -1){
		page_y = menu_y + -page_h + 1;
	}
	
	if(menu_y < page_y){
		page_y = menu_y;
	}
	
	if(!submenu){
		scr_cEvent_id(id,EVENT_MENU_REFRESHMENUUI);
	}
}