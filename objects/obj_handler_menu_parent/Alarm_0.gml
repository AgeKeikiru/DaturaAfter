/// @description Insert description here
// You can write your code in this editor
io_clear();
global.playerControl = true;

btn_draw = true;
image_alpha = 0;

if(!submenu){
	scr_cEvent_id(id,EVENT_MENU_REFRESHMENUUI);
}