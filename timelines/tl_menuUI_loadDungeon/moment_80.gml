for(var SV_i = 0;SV_i < ds_list_size(lst_link_loadExtra);SV_i++){
	var SV_o = lst_link_loadExtra[| SV_i];
	
	switch SV_i{
		case 0:
			SV_o.tgt_yScale = 0;
			SV_o.tgt_xPos += -200;
			
			break;
		default:
			SV_o.tgt_xPos += -100;
	}
}

ds_list_clear(lst_link_loadExtra);

with obj_fpo_parent{
	scr_cEvent(id,EVENT_FPO_FADEKILL);
}

link_load.alarm[0] = 60;

instance_destroy(obj_handler_dungeon);
instance_destroy(obj_handler_mission_parent);

with instance_create_depth(0,0,0,obj_handler_dungeon){
	scr_dungeon_refreshMap();
}