///@arg increase
///@arg *refresh

var
SV_m = ds_stack_top(global.stk_menu);

if(argument_count <= 1 || !argument[1]){
    scr_menu_toggleBasic(argument[0],"set_mapZoom",1,0,1);
}

var SV_arr = ["NORMAL","ZOOM"];

SV_m.grd_txt[# SV_m.menu_x,SV_m.menu_y] = scr_stringGapFormat("Camera Dist.:","<- " + SV_arr[global.set_mapZoom] + " ->",25);

if(surface_exists(global.sfc_map)){
    surface_free(global.sfc_map);
}

scr_dungeon_refreshMap();