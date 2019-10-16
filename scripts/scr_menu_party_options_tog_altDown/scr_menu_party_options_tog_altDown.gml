///@arg increase
///@arg *refresh

var
SV_m = ds_stack_top(global.stk_menu);

if(argument_count <= 1 || !argument[1]){
    scr_menu_toggleBasic(argument[0],"set_altDownTgt",1,0,1);
}

var SV_arr = ["NORMAL","ALTERNATE"];

SV_m.grd_txt[# SV_m.menu_x,SV_m.menu_y] = scr_stringGapFormat("Target Type:","<- " + SV_arr[global.set_altDownTgt] + " ->",25);

scr_dungeon_refreshMap();