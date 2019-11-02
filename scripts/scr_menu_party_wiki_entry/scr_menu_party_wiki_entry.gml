global.playerControl = false;

with(obj_handler_menuUI){
    with ds_stack_top(global.stk_menu){
	    visible = false;
	    
	    global.tempStr = grd_equipSrc[# 0,menu_y];
	}
	
	txt_desc = "";
	txt_descLabel = "";
	//txt_title = "OPTION";
	//txt_titleDesc = "Adjust gameplay settings";
}

var _m = scr_createMenuPanel(50,110,450,-1,"party/wiki/" + global.tempStr + "/..");

with _m{
	extra_function = -1;
	
	var
	_i = 0,
	_len = global.map_wiki[? global.tempStr];
	
	ds_grid_resize(grd_txt,1,_len + 1);
	scr_menu_matchGrids(id,true);
	
	for(_i = 0;_i < _len;_i++){
	    menu_y = _i;
	    
    	var _key = global.tempStr + string(_i);
    
        if(ds_map_exists(global.map_wiki,_key)){
            var _arr = global.map_wiki[? _key];
            
            grd_txt[# 0,_i] = _arr[0];
        }
    	
    	//grd_desc[# 0,_i] = "Adjust volume of ingame music.";
    	//grd_descLabel[# 0,_i] = "Sound Settings";
    	grd_scr[# 0,_i] = scr_menu_party_wiki_tog_page;
    	grd_toggle[# 0,_i] = true;
    	grd_equipSrc[# 0,_i] = global.tempStr;
    	scr_menu_party_wiki_tog_page(true,true);
	}
	
	grd_txt[# 0,_i] = "Return";
	grd_desc[# 0,_i] = "Return to previous menu.";
	grd_descLabel[# 0,_i] = "Back";
	grd_scr[# 0,_i] = scr_menu_back;
	
	menu_y = 0;
	
	scr_cEvent_id(id,EVENT_MENU_RESIZEPANEL);
}