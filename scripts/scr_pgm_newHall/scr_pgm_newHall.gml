///@arg point1
///@arg point2

var
SV_p1 = argument0,
SV_p2 = argument1,
SV_grd = global.grd_dMap_terrain;

//draw horizontal hall
ds_grid_set_region(SV_grd,SV_p1[0] + -1,SV_p1[1] + -1,SV_p2[0] + 1,SV_p1[1] + 1,DMAP_TER_FLOOR);

//draw vertical hall
ds_grid_set_region(SV_grd,SV_p2[0] + -1,SV_p1[1] + -1,SV_p2[0] + 1,SV_p2[1] + 1,DMAP_TER_FLOOR);