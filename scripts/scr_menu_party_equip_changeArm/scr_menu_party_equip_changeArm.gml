with ds_stack_top(global.stk_menu){
    visible = false;
}

var SV_m = scr_createMenuPanel(20,105,500,-1,"party/equip/armor/..");

global.buyLst = global.lst_inv_arms;

with SV_m{
    page_h = 8;
    extra_function = scr_menu_party_equip_extra;
    
	scr_refreshInv(global.buyLst);
	
	scr_cEvent_id(id,EVENT_MENU_RESIZEPANEL);
}