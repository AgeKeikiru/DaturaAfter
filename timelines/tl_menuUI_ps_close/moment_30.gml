
instance_destroy(ps_bg);

global.playerControl = true;
ds_grid_set_region(grd_ps_xDraw,0,0,3,1,1);

if(!instance_exists(obj_handler_dungeon)){
    scr_save();
}