global.playerControl = false;

//banner
map_results[? MCS_BG] = instance_create_depth(0,room_height / 2,0,obj_fpo_panel);
with map_results[? MCS_BG]{
    layer = global.ly_obj[4];
    
    image_xscale = room_width;
    image_yscale = 0;
    
    tween_xScale = false;
    tween_yScale = true;
    tween_yPos = true;
    tween_alpha = false;
    tgt_yScale = 60;
    tgt_yPos = y + -(tgt_yScale / 2);
    
    fill_col = c_black;
    fill_alpha = 1;
    crosshair_alpha = 0;
}

//"mission failed"
map_results[? MCS_TITLE] = instance_create_depth(room_width / 2,(room_height / 2) + 10,0,obj_fpo_parent);
with map_results[? MCS_TITLE]{
    layer = global.ly_obj[4];
    
    tween_xPos = true;
    tween_yPos = true;
    x += 400;
    
    tween_alpha = true;
    tgt_alpha = 1;
    image_alpha = 0;
    
    txt[0] = "MISSION FAILED";
    txt_col[0] = c_white;
    txt_halign[0] = fa_center;
    txt_valign[0] = fa_middle;
    txt_ft[0] = ft_menuTitle;
}