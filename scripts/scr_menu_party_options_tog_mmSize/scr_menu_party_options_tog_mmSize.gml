///@arg increase
///@arg *refresh

var
SV_m = ds_stack_top(global.stk_menu);

if(argument_count <= 1 || !argument[1]){
    scr_menu_toggleBasic(argument[0],"set_mmSize",10,0,30);
}

var SV_arr = ["OFF","SMALL","MID","LARGE"];

SV_m.grd_txt[# SV_m.menu_x,SV_m.menu_y] = scr_stringGapFormat("Minimap Size:","<- " + SV_arr[global.set_mmSize / 10] + " ->",25);

if(surface_exists(global.sfc_minimap)){
    surface_free(global.sfc_minimap);
}

scr_dungeon_refreshMap();