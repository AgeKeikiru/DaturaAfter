/// @description Insert description here
// You can write your code in this editor

if(ds_stack_top(global.stk_menu) == id && visible){
	var
	_sfx = noone,
	_xPressed = false,
	_yPressed = false;
	
	if(scr_checkInput(IC_CHECK_DOWN,IC_KEY_UP)){
		if(scr_checkInput(IC_CHECK_PRESS,IC_KEY_UP)){
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
	}else if(scr_checkInput(IC_CHECK_DOWN,IC_KEY_DOWN)){
		if(scr_checkInput(IC_CHECK_PRESS,IC_KEY_DOWN)){
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
	}else if(scr_checkInput(IC_CHECK_DOWN,IC_KEY_LEFT)){
		if(scr_checkInput(IC_CHECK_PRESS,IC_KEY_LEFT)){
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
	}else if(scr_checkInput(IC_CHECK_DOWN,IC_KEY_RIGHT)){
		if(scr_checkInput(IC_CHECK_PRESS,IC_KEY_RIGHT)){
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
	}else if(scr_checkInput(IC_CHECK_PRESS,IC_KEY_MENUACCEPT)){
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
	}else if(scr_checkInput(IC_CHECK_PRESS,IC_KEY_MENUBACK)){
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