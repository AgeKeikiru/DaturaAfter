var
SV_menu = ds_stack_top(global.stk_menu);

scr_menu_confirmWindow("message/confirm/..","Sell " + global.itemBuy.name + " for " + string(global.itemBuy.price * SELLPRICE) + "g?",scr_menu_party_equip_sell_confirm,scr_menu_backNoRefresh);