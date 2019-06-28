var
SV_menu = ds_stack_top(global.stk_menu);

global.itemBuy = global.buyLst[| SV_menu.menu_y];

scr_menu_confirmWindow("message/confirm/..","Buy " + global.itemBuy.name + " for " + string(global.itemBuy.price) + "g?",scr_menu_market_wpnArmConfirm_yes,scr_menu_backNoRefresh);