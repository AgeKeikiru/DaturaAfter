with obj_handler_menuUI{
	var _menu = ds_stack_top(global.stk_menu);
	
	compareItem = ps_equipMem.act[_menu.menu_y % array_length_1d(ps_equipMem.act)];
}

with ds_stack_top(global.stk_menu){
	global.tempInt = menu_y;
	
	with obj_handler_menuUI{
		ps_actSelected = global.tempInt;
	}
	
    visible = false;
    global.tempInt = global.lst_activePartySlots[| menu_x];
}

global.buyLst = global.lst_inv_acts;

var SV_m = scr_createMenuPanel(20,105,500,-1,"party/equip/act/..");

with SV_m{
    page_h = 8;
    extra_function = scr_menu_party_equip_extra;
    
	scr_refreshInv(global.lst_inv_acts);
	
	scr_cEvent_id(id,EVENT_MENU_RESIZEPANEL);
}