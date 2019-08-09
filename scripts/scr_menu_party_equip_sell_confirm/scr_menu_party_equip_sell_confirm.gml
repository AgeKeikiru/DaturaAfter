scr_menu_back(false);
scr_menu_back(false);

var
SV_m = ds_stack_top(global.stk_menu);

global.heldGold += global.itemBuy.price * SELLPRICE;

instance_destroy(global.itemBuy);

scr_refreshInv(global.buyLst);