/// @description Insert description here
// You can write your code in this editor
global.playerControl = false;

ds_list_add(global.lst_listeners,id);

layer = global.ly_obj[3];

btn_draw = false;
ds_stack_push(global.stk_menu,id);
alarm[0] = 10;

global.temp = id;

with obj_handler_menu_parent{
	if(id != global.temp){
		depth += 3;
	}
}

rebindMode = false;