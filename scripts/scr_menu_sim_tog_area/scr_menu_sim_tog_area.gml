///@arg increase
///@arg *refresh

var
SV_m = ds_stack_top(global.stk_menu);

if(argument_count <= 1 || !argument[1]){
    scr_menu_toggleBasic(argument[0],"simArea",1,0,ds_list_size(global.lst_simAreas) + -1);
    
    global.simFloor = 0;
    SV_m.menu_y++;
    scr_menu_sim_tog_floor(true,true);
    SV_m.menu_y--;
}

SV_m.grd_txt[# SV_m.menu_x,SV_m.menu_y] = scr_stringGapFormat("Area:","<- " + global.lst_simAreas[| global.simArea] + " ->",20);