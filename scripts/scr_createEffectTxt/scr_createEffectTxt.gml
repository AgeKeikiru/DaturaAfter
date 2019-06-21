///@arg obj
///@arg txt

var
SV_obj = argument0,
SV_r = instance_create_depth(SV_obj.x + random_range(-60,60),SV_obj.y + random_range(-30,30) + -70,-999,obj_fpo_parent);

SV_r.txt[0] = argument1;
SV_r.txt_shadow[0] = true;
SV_r.txt_ft[0] = ft_dungeonBoldLarge;
SV_r.txt_col[0] = c_white;
SV_r.txt_col2[0] = c_dkgray;
SV_r.txt_xScale[0] = 1.3;
SV_r.txt_yScale[0] = SV_r.txt_xScale[0];
SV_r.txt_weight[0] = 4;
SV_r.txt_halign[0] = fa_center;
SV_r.vspeed = -2;
SV_r.alarm[0] = 70;
SV_r.alarm[1] = 60;
SV_r.layer = global.ly_obj[4];

return SV_r;