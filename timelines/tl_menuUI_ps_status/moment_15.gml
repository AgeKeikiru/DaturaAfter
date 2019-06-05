
txt_desc = "";
txt_descLabel = "";
txt_title = "STATUS";
txt_titleDesc = "View the stats of party members";

ps_portStatus = instance_create_depth(0,0,0,obj_fpo_parent);
with ps_portStatus{
    visible = false;
    tween_alpha = true;
    image_alpha = 0;
    tgt_alpha = 1;
}

var SV_m = scr_createMenuPanel(-999,-999,500,-1,"party/status/..");

with SV_m{
	ds_grid_resize(grd_txt,ds_list_size(global.lst_activePartySlots),1);
	ds_grid_resize(grd_scr,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	ds_grid_resize(grd_desc,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	ds_grid_resize(grd_descLabel,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	
	for(var SV_i = 0;SV_i < ds_list_size(global.lst_activePartySlots);SV_i++){ //menu x
    	var
    	SV_memX = global.lst_activePartySlots[| SV_i],
    	SV_mem = global.grd_party_player[# SV_memX,0];
    	
    	grd_txt[# SV_i,0] = SV_mem.name;
    	//grd_desc[# SV_i,0] = "Nothing equipped.";
    	//grd_descLabel[# SV_i,0] = SV_mem.name;
    	grd_scr[# SV_i,0] = scr_menu_back;
	}
	
	//scr_cEvent(id,EVENT_MENU_RESIZEPANEL);
}