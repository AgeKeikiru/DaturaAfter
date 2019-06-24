///@arg x
///@arg y
///@arg w
///@arg h
///@arg angle

var
SV_w = argument2,
SV_h = argument3,
SV_a = argument4,
SV_px = [0,0,0,0],
SV_py = [0,0,0,0];

SV_px[0] = argument0;
SV_py[0] = argument1;
SV_px[1] = SV_px[0] + lengthdir_x(SV_w,SV_a);
SV_py[1] = SV_py[0] + lengthdir_y(SV_w,SV_a);
SV_px[2] = SV_px[1] + lengthdir_x(SV_h,SV_a + -90);
SV_py[2] = SV_py[1] + lengthdir_y(SV_h,SV_a + -90);
SV_px[3] = SV_px[2] + lengthdir_x(SV_w,SV_a + -180);
SV_py[3] = SV_py[2] + lengthdir_y(SV_w,SV_a + -180);

draw_primitive_begin(pr_trianglefan);

for(var SV_i = 0;SV_i < 5;SV_i++){
    draw_vertex(SV_px[SV_i % 4],SV_py[SV_i % 4]);
}

draw_primitive_end();