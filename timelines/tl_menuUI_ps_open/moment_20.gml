
if(ds_list_size(lst_ps_slots) < 3){
    var
    SV_w = 150,
    SV_gap = 25;
    SV_o = instance_create_depth(700 + ((SV_w + SV_gap) * ds_list_size(lst_ps_slots)),0,0,obj_fpo_panel);
    SV_o.visible = false;
    SV_o.fill_alpha = 1;
    SV_o.fill_col = c_dkgray;
    SV_o.crosshair_alpha = 0;
    
    SV_o.tween_xScale = false;
    SV_o.image_xscale = SV_w;
    
    SV_o.tween_yScale = false;
    SV_o.image_yscale = room_height;
    
    SV_o.tween_alpha = true;
    SV_o.image_alpha = 0;
    SV_o.tgt_alpha = 1;
    
    ds_list_add(lst_ps_slots,SV_o);

    timeline_position += -5;
}