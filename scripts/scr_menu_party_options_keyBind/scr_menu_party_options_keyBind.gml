global.playerControl = false;
global.tempArr = array_create(en_ic_key.JOY_ALT,noone);

for(var _i = 0;_i < en_ic_key.JOY_ALT;_i++){
    global.tempArr[_i] = global.grd_controls[# _i,0];
}

with(obj_handler_menuUI){
	with ds_stack_top(global.stk_menu){
	    visible = false;
	}
}

var
_m = scr_createMenuPanel(80,110,500,-1,"party/option/.."),
_i = 0;

_m.extra_function = -1;
ds_grid_resize(_m.grd_txt,1,en_ic_key.JOY_ALT + 2);
scr_menu_matchGrids(_m,true);

for(_i = 0;_i < en_ic_key.JOY_ALT;_i++){
    _m.grd_txt[# 0,_i] = scr_stringGapFormat(global.grd_controls[# _i,2],scr_keyToString(global.grd_controls[# _i,0]),25);
    _m.grd_desc[# 0,_i] = global.grd_controls[# _i,3];
	_m.grd_descLabel[# 0,_i] = "Key Bindings";
	_m.grd_scr[# 0,_i] = scr_menu_party_options_keyBind_prompt;
}

_m.grd_txt[# 0,_i] = "Confirm";
_m.grd_desc[# 0,_i] = "Save changes.";
_m.grd_descLabel[# 0,_i] = "Key Bindings";
_m.grd_scr[# 0,_i] = scr_menu_party_options_keyBind_confirm;

_i++;

_m.grd_txt[# 0,_i] = "Cancel";
_m.grd_desc[# 0,_i] = "Discard changes.";
_m.grd_descLabel[# 0,_i] = "Key Bindings";
_m.grd_scr[# 0,_i] = scr_menu_back;

scr_cEvent_id(_m,EVENT_MENU_RESIZEPANEL);

/*
with _m{
	extra_function = -1;
	submenu = true;
	
	var
	SV_i = 0;
	
	ds_grid_resize(grd_txt,1,en_ic_key.JOY_ALT + 2);
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
	grd_scr[# 0,SV_i] = scr_menu_party_options_tog_txtSpeed;
	
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