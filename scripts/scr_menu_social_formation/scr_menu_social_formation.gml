global.playerControl = false;

ds_grid_copy(global.grd_newFormation,global.grd_party_player);

with scr_createSubmenu(500){
	scr_refreshFormation();
	
	scr_cEvent_id(id,EVENT_MENU_RESIZEPANEL);
	
	tween_yPos = false;
	link_panel.tween_yPos = false;
	y += -80;
	link_panel.y = y + -20;
}

with obj_handler_menuUI{
    soc_formation = instance_create_depth(0,0,0,obj_fpo_parent);
    with soc_formation{
        visible = false;
        tween_alpha = true;
        image_alpha = 0;
        tgt_alpha = 1;
    }
}