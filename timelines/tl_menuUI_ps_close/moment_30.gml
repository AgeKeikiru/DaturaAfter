
scr_menuUI_clearPsElements();

global.playerControl = true;
ds_grid_set_region(grd_ps_xDraw,0,0,3,1,1);

if(!instance_exists(obj_handler_dungeon)){
    scr_save();
}else{
    visible = false;
}