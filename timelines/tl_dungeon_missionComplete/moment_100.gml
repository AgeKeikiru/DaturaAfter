
map_results[? MCS_GOLD] = instance_create_depth(MCS_ALIGNX + -20,MCS_STARTY + (MCS_GAPY * 4.3),0,obj_fpo_panel);
with map_results[? MCS_GOLD]{
    layer = global.ly_obj[4];
    crosshair_alpha = 0;
    
    tween_xPos = true;
    x += 350;
    
    tween_xScale = true;
    tween_yScale = false;
    image_xscale = 200;
    tgt_xScale = image_xscale + 350;
    image_yscale = 3;
    
    tween_alpha = true;
    tgt_alpha = 1;
    image_alpha = 0;
    
    fill_col = c_dkgray;
    fill_alpha = 1;
    
    txt[0] = "REWARD";
    txt_ft[0] = ft_menuButton;
    txt_x[0] = 5;
    txt_y[0] = 5;
    txt_xScale[0] = 1;
    txt_yScale[0] = 1;
    txt_col[0] = c_dkgray;
    
    txt_ft[1] = ft_dungeonBoldLarge;
    txt_x[1] = txt_x[0] + 540;
    txt_y[1] = txt_y[0] + 5;
    txt_valign[1] = fa_bottom;
    txt_halign[1] = fa_right;
    txt_col[1] = c_dkgray;
}