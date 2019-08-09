var SV_mh = ds_stack_top(global.stk_menu);

if(SV_mh.menu_y < ds_grid_height(SV_mh.grd_txt) + -2){
    global.playerControl = false;
    
    global.itemBuy = global.buyLst[| SV_mh.menu_y];
    global.tempInt = !scr_exists(global.itemBuy.src,asset_object);
    
    with scr_createSubmenu(140){
    	var
    	SV_i = 0;
    	
    	ds_grid_resize(grd_txt,1,2);
    	scr_menu_matchGrids(id,true);
    	
    	grd_txt[# 0,SV_i] = "Sell";
    	grd_scr[# 0,SV_i] = global.tempInt ? scr_menu_party_equip_sell : noone;
    	
    	SV_i++;
    	
    	grd_txt[# 0,SV_i] = "Sort...";
    	grd_scr[# 0,SV_i] = noone;
    	
    	scr_cEvent(id,EVENT_MENU_RESIZEPANEL);
    }
}