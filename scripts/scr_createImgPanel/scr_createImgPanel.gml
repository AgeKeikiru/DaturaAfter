///@arg x
///@arg y
///@arg img
///@arg imgScale
///@arg borderSize

var
SV_r = instance_create_layer(argument0,argument1,global.ly_obj[4],obj_fpo_panel),
SV_img = argument2,
SV_scale = argument3,
SV_b = argument4;

SV_r.image_xscale = 0;
SV_r.image_yscale = 0;

SV_r.txt_ft[0] = ft_menuSub;
SV_r.txt_x[0] = 4;
SV_r.txt_y[0] = 2;
SV_r.txt_xScale[0] = .5;
SV_r.txt_yScale[0] = SV_r.txt_xScale[0];

if(sprite_exists(SV_img)){
    var SV_r2 = instance_create_depth(SV_r.x + SV_b,SV_r.y + SV_b,SV_r.depth + -2,obj_fpo_parent);
    SV_r2.sprite_index = SV_img;
    
    SV_r2.image_xscale = 0;
    SV_r2.image_yscale = 0;
    
    SV_r2.tween_xScale = true;
    SV_r2.tween_yScale = true;
    
    SV_r2.tgt_xScale = SV_scale;
    SV_r2.tgt_yScale = SV_scale;
    
    SV_r2.tween_xPos = true;
    SV_r2.tween_yPos = true;
    
    SV_r2.tgt_xPos = SV_r2.x + (sprite_get_xoffset(SV_img) * SV_scale);
    SV_r2.tgt_yPos = SV_r2.y + (sprite_get_yoffset(SV_img) * SV_scale);
    
    SV_r.tween_xScale = true;
    SV_r.tween_yScale = true;
    
    SV_r.tgt_xScale = (sprite_get_width(SV_img) * SV_scale) + (SV_b * 2);
    SV_r.tgt_yScale = (sprite_get_height(SV_img) * SV_scale) + (SV_b * 2);
    
    SV_r.link_img = SV_r2;
}

return SV_r;