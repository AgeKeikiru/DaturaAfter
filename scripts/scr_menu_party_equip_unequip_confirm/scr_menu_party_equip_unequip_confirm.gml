scr_menu_back(false,false);
scr_menu_back(false,false);

with global.itemBuy.src{
    for(var SV_i = en_charVar.hb0;SV_i <= en_charVar.clsU;SV_i++){
        if(src[? SV_i] == global.itemBuy){
            src[? SV_i] = noone;
        }
    }
}

global.itemBuy.src = noone;

scr_refreshEquips();
scr_refreshInv(global.buyLst);