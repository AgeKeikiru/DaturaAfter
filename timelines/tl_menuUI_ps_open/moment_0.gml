
global.playerControl = false;
ds_grid_set_region(grd_ps_xDraw,0,0,3,1,1);
grd_ps_xDraw[# 0,1] = 0;
transTgt = -.5;
transCurr = transTgt;
visible = true;

//scr_playSfx(sfx_tick4);

with obj_handler_menu_parent{
    depthMem = depth;
    layer = global.ly_obj[2];
}

txt_titleMem = txt_title;
txt_titleDescMem = txt_titleDesc;
txt_ctrlMem = txt_ctrl;

ds_list_clear(global.lst_activePartySlots);
    
for(var SV_i = 0;SV_i < 6;SV_i++){
	var
	SV_x = SV_i % 3,
	SV_y = SV_i > 2;
	
    if(instance_exists(global.grd_party_player[# SV_x,SV_y])){
        ds_list_add(global.lst_activePartySlots,SV_i);
    }
}