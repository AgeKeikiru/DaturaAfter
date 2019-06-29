scr_menu_back(false);

var
SV_menu = ds_stack_top(global.stk_menu),
SV_lst = global.buyLst == global.lst_shop_acts ? global.lst_inv_acts : (global.buyLst == global.lst_shop_arms ? global.lst_inv_arms : global.lst_inv_classes),
SV_lst2 = global.buyLst;

global.heldGold += -global.itemBuy.price;

if(global.buyLst == global.lst_shop_classes){
    ds_list_add(SV_lst,
        instance_create_depth(0,0,0,global.itemBuy.object_index)
    );
}else{
    ds_list_add(SV_lst,global.itemBuy);
    
    SV_lst2[| SV_menu.menu_y] = noone;
    
    SV_menu.grd_txt[# 0,SV_menu.menu_y] = scr_stringGapFormat("SOLD OUT","",string_length(SV_menu.grd_txt[# 0,0]));
    SV_menu.grd_desc[# 0,SV_menu.menu_y] = "";
    SV_menu.grd_scr[# 0,SV_menu.menu_y] = noone;
}