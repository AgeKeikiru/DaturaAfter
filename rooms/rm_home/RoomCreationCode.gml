scr_roomSetup();

with instance_create_depth(0,0,0,obj_handler_menuUI){
	timeline_index = tl_menuMain_loadIn;
	timeline_running = true;
}