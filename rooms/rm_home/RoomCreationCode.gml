scr_roomSetup();

if(!DEBUG || 1){
	scr_menu_title();
}

with instance_create_depth(0,0,0,obj_handler_menuUI){
	if(DEBUG && 0){
		title = false;
		
		scr_runTimeline(tl_menuMain_loadIn);
	}
}