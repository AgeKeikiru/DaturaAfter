global.buying = "";
global.tempArr = ["Weapon","Armor","Class"];
global.buyLst = global.lst_shop_acts;

with ds_stack_top(global.stk_menu){
    visible = false;
    
    global.buying = global.tempArr[menu_y];
    
    global.tempArr = [global.lst_shop_acts,global.lst_shop_arms,global.lst_shop_classes];
    global.buyLst = global.tempArr[menu_y];
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
SV_m = scr_createMenuPanel(20,105,520,-1,"menu/market/" + string_lower(global.buying) + "/.."),
SV_lst = global.buyLst;

with SV_m{
	ds_grid_resize(grd_txt,1,ds_list_size(SV_lst) + 1);
	scr_menu_matchGrids(id,true);
	
	var SV_i = 0;
	
	for(SV_i = 0;SV_i < ds_list_size(SV_lst);SV_i++){
	    var SV_o = SV_lst[| SV_i];
	    
    	grd_txt[# 0,SV_i] = scr_stringGapFormat(SV_o.name,string(SV_o.price) + "g",30);
    	grd_desc[# 0,SV_i] = SV_o.desc;
    	grd_descLabel[# 0,SV_i] = global.buying + " Chip";
    	grd_scr[# 0,SV_i] = scr_menu_market_wpnArmConfirm;
    }
    
	grd_txt[# 0,SV_i] = "Return";
	grd_desc[# 0,SV_i] = "Return to previous menu.";
	grd_descLabel[# 0,SV_i] = "Back";
	grd_scr[# 0,SV_i] = scr_menu_back;
	
	scr_cEvent(id,EVENT_MENU_RESIZEPANEL);
}