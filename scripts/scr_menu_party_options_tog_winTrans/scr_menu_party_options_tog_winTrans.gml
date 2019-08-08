///@arg increase
///@arg *refresh

var
SV_m = ds_stack_top(global.stk_menu);

if(argument_count <= 1 || !argument[1]){
    scr_menu_toggleBasic(argument[0],"set_winTrans",1,10,100);
}

SV_m.grd_txt[# SV_m.menu_x,SV_m.menu_y] = scr_stringGapFormat("Window Opac.:","<- " + string(global.set_winTrans) + "% ->",25);