var
SV_menu = ds_stack_top(global.stk_menu),
SV_lst = global.lst_shop_items;

global.itemBuy = SV_lst[| SV_menu.menu_y];

scr_menu_confirmWindow("message/confirm/..","Buy " + global.map_item_name[? global.itemBuy] + " for " + string(global.map_item_price[? global.itemBuy]) + "g?",scr_menu_market_itemConfirm_yes,scr_menu_backNoRefresh);