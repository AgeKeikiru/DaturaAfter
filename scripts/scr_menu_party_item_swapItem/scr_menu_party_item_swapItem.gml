if(object_index == obj_handler_menu_parent){
    with obj_handler_menuUI{
        scr_menu_party_item_swapItem();
    }
}else{
    globalvar G_tmp;
    G_tmp = "";
    
    var
    SV_menu = ds_stack_top(global.stk_menu),
    SV_grd = scr_getItemMenuInfo();
    
    if(SV_menu.menu_y < ds_grid_height(SV_grd)){
        G_tmp = SV_grd[# 3,SV_menu.menu_y];
    }

    scr_menu_back();
    
    var
    SV_menu = ds_stack_top(global.stk_menu),
    SV_y = SV_menu.menu_y,
    SV_item = scr_data_map_findKey(global.map_item_name,global.arr_itemSet[SV_y]);
    
    if(!is_undefined(SV_item)){
        global.map_item_held[? SV_item] = global.map_item_held[? SV_item] + 1;
    }
    
    SV_menu.grd_txt[# SV_menu.menu_x,SV_menu.menu_y] = "ITEM" + string(SV_y) + ": ";
    
    if(G_tmp != ""){
        global.map_item_held[? G_tmp] = global.map_item_held[? G_tmp] + -1;
        global.arr_itemSet[SV_y] = (G_tmp == "" ? G_tmp : global.map_item_name[? G_tmp]);
        
	    SV_menu.grd_txt[# SV_menu.menu_x,SV_menu.menu_y] += global.map_item_name[? G_tmp];
	    SV_menu.grd_desc[# SV_menu.menu_x,SV_menu.menu_y] = global.map_item_desc[? G_tmp];
	}else{
	    SV_menu.grd_txt[# SV_menu.menu_x,SV_menu.menu_y] += "-none-";
	    SV_menu.grd_desc[# SV_menu.menu_x,SV_menu.menu_y] = "Nothing equipped.";
	}
}