global.playerControl = false;

ds_list_clear(global.lst_newFormation);

for(var SV_i = 0;SV_i < 6;SV_i++){
    var
    SV_x = SV_i % 3,
    SV_y = SV_i > 2,
    SV_o = global.grd_party_player[# SV_x,SV_y];
    
    if(scr_exists(SV_o,asset_object)){
        var SV_map = SV_o.src;
        
        ds_list_add(global.lst_newFormation,SV_map[? CHAR_VAR_ID]);
    }
}

with scr_createSubmenu(500){
	y += -100;
	link_panel.y += -100;
	
	scr_refreshFormation();
	
	scr_cEvent(id,EVENT_MENU_RESIZEPANEL);
}

with obj_handler_menuUI{
    soc_formation = instance_create_depth(0,0,0,obj_fpo_parent);
    with soc_formation{
        visible = false;
        tween_alpha = true;
        image_alpha = 0;
        tgt_alpha = 1;
    }
}