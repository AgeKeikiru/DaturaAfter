///@arg increase
///@arg *refresh

var
SV_m = ds_stack_top(global.stk_menu);

if(argument_count <= 1 || !argument[1]){
    scr_menu_toggleBasic(argument[0],"set_txtSpeed",1,1,20);
}

SV_m.grd_txt[# SV_m.menu_x,SV_m.menu_y] = scr_stringGapFormat("Text Speed:","<- " + string(global.set_txtSpeed) + " ->",25);