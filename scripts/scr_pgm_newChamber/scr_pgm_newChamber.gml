///@arg x
///@arg y
///@arg minSize
///@arg maxSize
///@arg *square
///@arg *blisterCount

var
SV_x = argument[0],
SV_y = argument[1],
SV_r = irandom_range(argument[2],argument[3]),
SV_square = (argument_count > 4) ? argument[4] : false,
SV_blisters = (argument_count > 5) ? argument[5] : 0,
SV_grd = global.grd_dMap_terrain,
SV_point = [SV_x,SV_y];

ds_grid_set_disk(SV_grd,SV_x,SV_y,SV_r,DMAP_TER_FLOOR);

if(SV_r > 3){
    repeat(SV_blisters){
        var
        SV_a = random(359),
        SV_bx = SV_x + lengthdir_x(SV_r,SV_a),
        SV_by = SV_y + lengthdir_y(SV_r,SV_a);
        
        ds_grid_set_disk(SV_grd,SV_bx,SV_by,irandom_range(SV_r * .2,SV_r * .8),DMAP_TER_FLOOR);
    }
}

return SV_point;