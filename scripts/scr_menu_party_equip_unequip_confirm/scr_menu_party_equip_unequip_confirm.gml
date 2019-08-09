scr_menu_back(false,false);
scr_menu_back(false,false);

with global.itemBuy.src{
    var SV_key = "";
    
    switch global.buyLst{
        case global.lst_inv_acts: SV_key = CHAR_VAR_HB; break;
        case global.lst_inv_arms: SV_key = CHAR_VAR_ARM; break;
        case global.lst_inv_classes: SV_key = CHAR_VAR_CLS; break;
    }
    
    for(var SV_i = 0;ds_map_exists(src,SV_key + string(SV_i));SV_i++){
        if(src[? SV_key + string(SV_i)] == global.itemBuy){
            src[? SV_key + string(SV_i)] = noone;
        }
    }
}

global.itemBuy.src = noone;

scr_refreshEquips();
scr_refreshInv(global.buyLst);