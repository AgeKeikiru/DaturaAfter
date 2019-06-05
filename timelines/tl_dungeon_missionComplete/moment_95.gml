
map_results[? MCS_TGT_BONUS] = round(map_results[? MCS_TGT_BONUS]);
map_results[? MCS_TGT_GOLD] += map_results[? MCS_TGT_BONUS];

global.heldGold += map_results[? MCS_TGT_GOLD];

map_results[? MCS_BONUS] = instance_create_depth(MCS_ALIGNX,MCS_STARTY + (MCS_GAPY * 3),0,obj_fpo_panel);
with map_results[? MCS_BONUS]{
    layer = global.ly_obj[4];
    crosshair_alpha = 0;
    
    tween_xPos = true;
    x += 200;
    
    tween_xScale = true;
    tween_yScale = false;
    image_xscale = 200;
    tgt_xScale = image_xscale + 200;
    image_yscale = 2;
    
    tween_alpha = true;
    tgt_alpha = 1;
    image_alpha = 0;
    
    fill_col = c_gray;
    fill_alpha = 1;
    
    txt[0] = "TOTAL BONUS";
    txt_ft[0] = ft_menuSub;
    txt_x[0] = 5;
    txt_y[0] = 3;
    txt_col[0] = c_gray;
    
    txt_ft[1] = ft_dungeonBoldLarge;
    txt_x[1] = txt_x[0] + 390;
    txt_y[1] = txt_y[0] + 5;
    txt_valign[1] = fa_bottom;
    txt_halign[1] = fa_right;
    txt_col[1] = c_gray;
}

if(map_results[? MCS_TGT_BONUS] < 0){
    map_results[? MCS_BONUS].txt_col[1] = c_red;
}