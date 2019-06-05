with ds_stack_top(global.stk_menu){
    visible = false;
    
    global.buyingWpn = menu_y == 0;
}

for(var SV_i = ds_list_size(global.lst_shop_acts) + -1;SV_i >= 0;SV_i--){
	if(!scr_exists(global.lst_shop_acts[| SV_i],asset_object)){
		ds_list_delete(global.lst_shop_acts,SV_i);
	}
}

for(var SV_i = ds_list_size(global.lst_shop_arms) + -1;SV_i >= 0;SV_i--){
	if(!scr_exists(global.lst_shop_arms[| SV_i],asset_object)){
		ds_list_delete(global.lst_shop_arms,SV_i);
	}
}

var
SV_top = ds_stack_top(global.stk_menu),
SV_m = scr_createMenuPanel(20,105,520,-1,"menu/market/" + (global.buyingWpn ? "weapon" : "armor") + "/.."),
SV_lst = global.buyingWpn ? global.lst_shop_acts : global.lst_shop_arms;

with SV_m{
	ds_grid_resize(grd_txt,1,ds_list_size(SV_lst) + 1);
	ds_grid_resize(grd_scr,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	ds_grid_resize(grd_desc,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	ds_grid_resize(grd_descLabel,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	
	var SV_i = 0;
	
	for(SV_i = 0;SV_i < ds_list_size(SV_lst);SV_i++){
	    var SV_act = SV_lst[| SV_i];
	    
    	grd_txt[# 0,SV_i] = scr_stringGapFormat(SV_act.name,string(SV_act.price) + "g",30);
    	grd_desc[# 0,SV_i] = SV_act.desc;
    	grd_descLabel[# 0,SV_i] = (global.buyingWpn ? "Act" : "Armor") + " Chip";
    	grd_scr[# 0,SV_i] = scr_menu_market_wpnArmConfirm;
    }
    
	grd_txt[# 0,SV_i] = "Return";
	grd_desc[# 0,SV_i] = "Return to previous menu.";
	grd_descLabel[# 0,SV_i] = "Back";
	grd_scr[# 0,SV_i] = scr_menu_back;
	
	scr_cEvent(id,EVENT_MENU_RESIZEPANEL);
}