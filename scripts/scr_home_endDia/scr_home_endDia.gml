global.playerControl = false;

with obj_handler_menuUI{
    transTgt = 1;
}

with ds_stack_top(global.stk_menu){
	alarm[0] = 10;
	btn_draw = false;
	visible = true;
	
	with link_panel{
		image_xscale = 0;
		image_yscale = 0;
	}
}

instance_destroy(obj_handler_dialogue);