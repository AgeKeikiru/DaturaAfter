global.playerControl = false;

var
_m = ds_stack_pop(global.stk_menu),
_x = _m.menu_x,
_y = _m.menu_y,
_swapX = ds_grid_value_x(global.grd_newFormation,0,0,2,1,global.tempObj),
_swapY = ds_grid_value_y(global.grd_newFormation,0,0,2,1,global.tempObj),
_swapObj = global.grd_newFormation[# _x,_y];

global.grd_newFormation[# _x,_y] = global.tempObj;

if(_swapX >= 0 && _swapY >= 0){
    global.grd_newFormation[# _swapX,_swapY] = _swapObj;
}

with ds_stack_top(global.stk_menu){
    scr_refreshFormation();
}

ds_stack_push(global.stk_menu,_m);

scr_menu_back(false,false);