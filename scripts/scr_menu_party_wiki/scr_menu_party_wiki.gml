global.playerControl = false;

with(obj_handler_menuUI){
	for(var SV_i = 0;SV_i < ds_list_size(lst_ps_slots);SV_i++){
        lst_ps_slots[| SV_i].tgt_alpha = 0;
    }
	
	with ds_stack_top(global.stk_menu){
	    visible = false;
	}
	
	ps_wikiPanel = create(obj_fpo_parent);
    with ps_wikiPanel{
        visible = false;
        tween_alpha = true;
        image_alpha = 0;
        tgt_alpha = 1;
    }
	
	txt_desc = "";
	txt_descLabel = "";
	txt_title = "WIKI";
	txt_titleDesc = "View information on the world of Babel XR";
}

var _m = scr_createMenuPanel(50,200,450,500,"party/wiki/..");

with _m{
    extra_function = -1;
    
	ds_grid_resize(grd_txt,1,5);
	scr_menu_matchGrids(id,true);
	
	var SV_i = 0;
	
	grd_txt[# 0,SV_i] = "Tutorial";
	grd_desc[# 0,SV_i] = "Information on gameplay elements and strategies.";
	grd_scr[# 0,SV_i] = scr_menu_party_wiki_entry;
	grd_equipSrc[# 0,SV_i] = WIKI_TUT;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = "Characters";
	grd_desc[# 0,SV_i] = "Information on characters met.";
	grd_scr[# 0,SV_i] = scr_menu_party_wiki_entry;
	grd_equipSrc[# 0,SV_i] = WIKI_CHAR;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = "Bestiary";
	grd_desc[# 0,SV_i] = "Information on enemies encountered.";
	grd_scr[# 0,SV_i] = noone;
	grd_equipSrc[# 0,SV_i] = WIKI_ENEMY;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = "Organizations";
	grd_desc[# 0,SV_i] = "Information on the various groups that request missions and provide goods/services for adventurers.";
	grd_scr[# 0,SV_i] = scr_menu_party_wiki_entry;
	grd_equipSrc[# 0,SV_i] = WIKI_ORG;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = "Atlas";
	grd_desc[# 0,SV_i] = "Information on the various locations missions take place in.";
	grd_scr[# 0,SV_i] = noone;
	grd_equipSrc[# 0,SV_i] = WIKI_LOC;
	
	scr_cEvent_id(id,EVENT_MENU_RESIZEPANEL);
}

return _m;