///@arg increase
///@arg *refresh

var
SV_m = ds_stack_top(global.stk_menu),
SV_key = global.lst_simAreas[| global.simArea],
SV_max = DEBUG ? 16 : global.map_flags[? SIM_FG_STATUS + SV_key];

if(argument_count <= 1 || !argument[1]){
    scr_menu_toggleBasic(argument[0],"simFloor",1,0,SV_max);
}

SV_m.grd_txt[# SV_m.menu_x,SV_m.menu_y] = scr_stringGapFormat("Zone:","<- " + string(global.simFloor) + " ->",20);