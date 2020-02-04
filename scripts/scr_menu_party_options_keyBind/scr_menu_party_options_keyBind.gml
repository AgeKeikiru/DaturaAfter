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