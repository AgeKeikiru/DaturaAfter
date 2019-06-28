if(instance_exists(obj_handler_dungeon)){
	instance_destroy(obj_handler_dungeon);
	instance_destroy(obj_handler_mission_parent);
}

visible = true;

txt_desc = "";
txt_descLabel = "";

switch(menuNext){
	case 0: //request misison
		layer_background_sprite(global.ly_bg[0],bg_forest);
		break;
	case 2: //market
		layer_background_sprite(global.ly_bg[0],bg_shop);
		break;
	case 3: //chip lab
		layer_background_sprite(global.ly_bg[0],bg_lab);
		break;
	default: //home
		layer_background_sprite(global.ly_bg[0],bg_city);
		break;
}

scr_bgManip_reset();

scr_cEvent(link_load,EVENT_FPO_FADEKILL);