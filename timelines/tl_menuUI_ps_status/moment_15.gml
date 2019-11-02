
txt_desc = "";
txt_descLabel = "";
txt_title = "STATUS";
txt_titleDesc = "View the stats of party members";

ps_portStatus = create(obj_fpo_parent);
with ps_portStatus{
    visible = false;
    tween_alpha = true;
    image_alpha = 0;
    tgt_alpha = 1;
}

var SV_m = scr_createMenuPanel(-999,-999,500,-1,"party/status/..");

with SV_m{
	ds_grid_resize(grd_txt,ds_list_size(global.lst_activePartySlots),1);
	scr_menu_matchGrids(id,true);
	
	for(var SV_i = 0;SV_i < ds_list_size(global.lst_activePartySlots);SV_i++){ //menu x
    	var
    	SV_pos = global.lst_activePartySlots[| SV_i],
    	SV_memX = SV_pos % 3,
    	SV_memY = SV_pos > 2,
    	SV_mem = global.grd_party_player[# SV_memX,SV_memY];
    	
    	grd_txt[# SV_i,0] = SV_mem.name;
    	//grd_desc[# SV_i,0] = "Nothing equipped.";
    	//grd_descLabel[# SV_i,0] = SV_mem.name;
    	grd_scr[# SV_i,0] = scr_menu_back;
	}
	
	//scr_cEvent_id(id,EVENT_MENU_RESIZEPANEL);
}