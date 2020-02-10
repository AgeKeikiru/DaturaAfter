/*view_enabled = true;
view_set_visible(0, true);
view_set_wport(0, 1280);
view_set_hport(0, 720);
*/
window_set_caption((CANARY ? "[CANARY] " : "") + "Datura After " + GAMEVER);

global.lyid_bg[0] = layer_create(10000);
global.lyid_bg[1] = layer_create(9000);

global.ly_bg[0] = layer_background_create(global.lyid_bg[0],bg_city);
global.ly_bg[1] = layer_background_create(global.lyid_bg[1],noone);

layer_background_alpha(global.ly_bg[0],1);
layer_background_alpha(global.ly_bg[1],0);

layer_background_get_id(global.ly_bg[0]);

layer_x(global.lyid_bg[0],0);
layer_y(global.lyid_bg[0],0);
layer_x(global.lyid_bg[1],0);
layer_y(global.lyid_bg[1],0);

global.ly_obj[0] = layer_create(-1000);
global.ly_obj[1] = layer_create(-2000);
global.ly_obj[2] = layer_create(-3000);
global.ly_obj[3] = layer_create(-4000);
global.ly_obj[4] = layer_create(-5000);
global.ly_obj[5] = layer_create(-6000);

if(variable_global_exists("stk_menu")){
	ds_stack_clear(global.stk_menu);
}

scr_bgManip_reset();