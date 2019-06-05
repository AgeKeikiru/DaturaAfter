with obj_fpo_parent{
	scr_cEvent(id,EVENT_FPO_FADEKILL);
}

link_load.alarm[0] = 60;

instance_create_depth(0,0,0,obj_handler_dungeon);