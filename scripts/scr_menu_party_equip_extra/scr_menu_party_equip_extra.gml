var SV_mh = ds_stack_top(global.stk_menu);

if(SV_mh.menu_y < ds_grid_height(SV_mh.grd_txt) + -2){
    global.playerControl = false;
    
    global.itemBuy = SV_mh.grd_equipSrc[# SV_mh.menu_x,SV_mh.menu_y];
    global.tempBool = (!scr_exists(global.itemBuy.src,asset_object));
    
    if(global.buyLst == global.lst_inv_acts && !global.itemBuy.object_index == obj_handler_act){
        global.tempBool = false;
    }
    
    with scr_createSubmenu(140){
    	var
    	SV_i = 0;
    	
    	ds_grid_resize(grd_txt,1,2);
    	scr_menu_matchGrids(id,true);
    	
    	grd_txt[# 0,SV_i] = "Sell";
    	grd_scr[# 0,SV_i] = global.tempBool ? scr_menu_party_equip_sell : noone;
    	
    	SV_i++;
    	
    	grd_txt[# 0,SV_i] = "Sort...";
    	grd_scr[# 0,SV_i] = noone;
    	
    	scr_cEvent_id(id,EVENT_MENU_RESIZEPANEL);
    }
}