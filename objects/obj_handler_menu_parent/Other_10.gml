/// @description Insert description here
// You can write your code in this editor

switch(cEvent){
	case EVENT_MENU_RESIZEPANEL:
		if(instance_exists(link_panel)){
			link_panel.tgt_yScale = ((btn_h + btn_gapY) * min(page_h,ds_grid_height(grd_txt))) + -btn_gapY + (DEFAULT_PANEL_BEZEL * 4);
			link_panel.tgt_xScale = ((btn_w + btn_gapX) * min(page_w,ds_grid_width(grd_txt))) + -btn_gapX + (DEFAULT_PANEL_BEZEL * 2);
			
			scr_playSfx(sfx_menuOpen);
		}
		
		break;
	case EVENT_MENU_REFRESHMENUUI:
		if(instance_exists(obj_handler_menuUI)){
			var _m = instance_find(obj_handler_menuUI,0);
		
			_m.txt_desc = grd_desc[# menu_x,menu_y];
			_m.txt_descLabel = grd_descLabel[# menu_x,menu_y];
		}
		
		break;
}