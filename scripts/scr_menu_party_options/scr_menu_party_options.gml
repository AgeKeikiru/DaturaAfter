global.playerControl = false;

with(obj_handler_menuUI){
	with ds_stack_top(global.stk_menu){
	    visible = false;
	}
	
	txt_desc = "";
	txt_descLabel = "";
	txt_title = "OPTION";
	txt_titleDesc = "Adjust gameplay settings";
}

var SV_m = scr_createMenuPanel(80,110,500,-1,"party/option/..");

with SV_m{
	extra_function = -1;
	
	var
	SV_i = 0;
	
	ds_grid_resize(grd_txt,1,11);
	scr_menu_matchGrids(id,true);
	
	scr_menu_party_options_tog_volBgm(true,true);
	grd_desc[# 0,SV_i] = "Adjust volume of ingame music.";
	grd_descLabel[# 0,SV_i] = "Sound Settings";
	grd_scr[# 0,SV_i] = scr_menu_party_options_tog_volBgm;
	grd_toggle[# 0,SV_i] = true;
	
	menu_y = ++SV_i;
	
	scr_menu_party_options_tog_volSfx(true,true);
	grd_desc[# 0,SV_i] = "Adjust volume of ingame sound effects.";
	grd_descLabel[# 0,SV_i] = "Sound Settings";
	grd_scr[# 0,SV_i] = scr_menu_party_options_tog_volSfx;
	grd_toggle[# 0,SV_i] = true;
	
	menu_y = ++SV_i;
	
	scr_menu_party_options_tog_atbSpeed(true,true);
	grd_desc[# 0,SV_i] = "Adjust the rate at which Acts recharge for allies and enemies. Reduce this option if battles become overwhelming.";
	grd_descLabel[# 0,SV_i] = "Game Settings";
	grd_scr[# 0,SV_i] = scr_menu_party_options_tog_atbSpeed;
	grd_toggle[# 0,SV_i] = true;
	
	menu_y = ++SV_i;
	
	scr_menu_party_options_tog_atbMod(true,true);
	grd_desc[# 0,SV_i] = "An additional modifier that affects ATB Speed while a party member's Act Menu is open. Reduce this option if battles become overwhelming.";
	grd_descLabel[# 0,SV_i] = "Game Settings";
	grd_scr[# 0,SV_i] = scr_menu_party_options_tog_atbMod;
	grd_toggle[# 0,SV_i] = true;
	
	menu_y = ++SV_i;
	
	scr_menu_party_options_tog_altDown(true,true);
	grd_desc[# 0,SV_i] = "Adjust the behavior of the [Down] button when targetting to either normal (deselect target) or alternate (middle target).";
	grd_descLabel[# 0,SV_i] = "Game Settings";
	grd_scr[# 0,SV_i] = scr_menu_party_options_tog_altDown;
	grd_toggle[# 0,SV_i] = true;
	
	menu_y = ++SV_i;
	
	scr_menu_party_options_tog_txtSpeed(true,true);
	grd_desc[# 0,SV_i] = "Adjust the rate at which text crawls during dialogue.";
	grd_descLabel[# 0,SV_i] = "Game Settings";
	grd_scr[# 0,SV_i] = scr_menu_party_options_tog_txtSpeed;
	grd_toggle[# 0,SV_i] = true;
	
	menu_y = ++SV_i;
	
	grd_txt[# 0,SV_i] = "Key Bindings";
	grd_desc[# 0,SV_i] = "Change keyboard control bindings.";
	grd_descLabel[# 0,SV_i] = "Game Settings";
	grd_scr[# 0,SV_i] = scr_menu_party_options_keyBind;
	
	menu_y = ++SV_i;
	
	scr_menu_party_options_tog_winTrans(true,true);
	grd_desc[# 0,SV_i] = "Adjust the transparency of menu panels and dialogue boxes.";
	grd_descLabel[# 0,SV_i] = "Graphics Settings";
	grd_scr[# 0,SV_i] = scr_menu_party_options_tog_winTrans;
	grd_toggle[# 0,SV_i] = true;
	
	menu_y = ++SV_i;
	
	scr_menu_party_options_tog_mmSize(true,true);
	grd_desc[# 0,SV_i] = "Adjust the size of the minimap. Reducing this option can improve performance during missions.";
	grd_descLabel[# 0,SV_i] = "Graphics Settings";
	grd_scr[# 0,SV_i] = scr_menu_party_options_tog_mmSize;
	grd_toggle[# 0,SV_i] = true;
	
	menu_y = ++SV_i;
	
	scr_menu_party_options_tog_mapZoom(true,true);
	grd_desc[# 0,SV_i] = "Toggle the viewable surrounding area. Setting this option to [ZOOM] can improve performance during missions.";
	grd_descLabel[# 0,SV_i] = "Graphics Settings";
	grd_scr[# 0,SV_i] = scr_menu_party_options_tog_mapZoom;
	grd_toggle[# 0,SV_i] = true;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = "Return";
	grd_desc[# 0,SV_i] = "Return to previous menu.";
	grd_descLabel[# 0,SV_i] = "Back";
	grd_scr[# 0,SV_i] = scr_menu_back;
	
	menu_y = 0;
	
	scr_cEvent_id(id,EVENT_MENU_RESIZEPANEL);
}