/// @description Insert description here
// You can write your code in this editor

if(ds_stack_top(global.stk_menu) == id && visible){
	if(scr_checkInput(IC_CHECK_DOWN,IC_KEY_UP)){
		if(scr_checkInput(IC_CHECK_PRESS,IC_KEY_UP)){
			io_clear();
		}
	
		menu_y--;
	}else if(scr_checkInput(IC_CHECK_DOWN,IC_KEY_DOWN)){
		if(scr_checkInput(IC_CHECK_PRESS,IC_KEY_DOWN)){
			io_clear();
		}
	
		menu_y++;
	}else if(scr_checkInput(IC_CHECK_DOWN,IC_KEY_LEFT)){
		if(scr_checkInput(IC_CHECK_PRESS,IC_KEY_LEFT)){
			io_clear();
		}
	
		menu_x--;
	}else if(scr_checkInput(IC_CHECK_DOWN,IC_KEY_RIGHT)){
		if(scr_checkInput(IC_CHECK_PRESS,IC_KEY_RIGHT)){
			io_clear();
		}
	
		menu_x++;
	}else if(scr_checkInput(IC_CHECK_PRESS,IC_KEY_MENUACCEPT)){
		io_clear();
	
		if(script_exists(grd_scr[# menu_x,menu_y])){
			script_execute(grd_scr[# menu_x,menu_y]);
		}
	}else if(scr_checkInput(IC_CHECK_PRESS,IC_KEY_MENUBACK)){
		io_clear();
	
		if(script_exists(back_function)){
			script_execute(back_function);
		}
	}

	menu_x = (menu_x + ds_grid_width(grd_txt)) mod ds_grid_width(grd_txt);
	menu_y = (menu_y + ds_grid_height(grd_txt)) mod ds_grid_height(grd_txt);
	
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
		scr_cEvent(id,EVENT_MENU_REFRESHMENUUI);
	}
}