var
SV_menu = ds_stack_top(global.stk_menu),
SV_lst = global.buyingWpn ? global.lst_shop_acts : global.lst_shop_arms;

global.itemBuy = SV_lst[| SV_menu.menu_y];

scr_menu_confirmWindow("message/confirm/..","Buy " + global.itemBuy.name + " for " + string(global.itemBuy.price) + "g?",scr_menu_market_wpnArmConfirm_yes,scr_menu_backNoRefresh);