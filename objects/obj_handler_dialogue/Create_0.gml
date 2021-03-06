/// @description Insert description here
ds_list_add(global.lst_listeners,id);

layer = global.ly_obj[3];

global.playerControl = false;

with obj_handler_menuUI{
	transTgt = 0;
}

with obj_handler_menu_parent{
	visible = false;
}

alarm[0] = 30;
alarm[1] = 1;

talkbox = instance_create_layer((room_width / 2) + -(tb_width / 2),room_height + -tb_height + -20,global.ly_obj[1],obj_fpo_panel);
ds_list_add(lst_panels,talkbox);
talkbox.layer = global.ly_obj[5];
talkbox.visible = false;
talkbox.fixedAlpha = false;

talkbox.tween_xScale = true;
talkbox.tween_yScale = true;
talkbox.tween_yPos = false;

talkbox.tgt_xScale = tb_width;
talkbox.tgt_yScale = tb_height;

//body text
talkbox.txt_ft[0] = ft_menuDesc;
talkbox.txt_x[0] = 25;
talkbox.txt_y[0] = 25;
talkbox.txt_w[0] = tb_width + -(talkbox.txt_x[0] * 2) + -60;
talkbox.txt_xScale[0] = 1;
talkbox.txt_yScale[0] = talkbox.txt_xScale[0];

//portraits
tb_obj_r = instance_create_layer(0,720,global.ly_obj[2],obj_fpo_parent);
tb_obj_r.tween_xPos = true;
tb_obj_r.tween_yPos = false;
tb_obj_r.tween_alpha = true;
tb_obj_r.persistent = true;
tb_obj_r.visible = false;

tb_obj_l = instance_create_layer(0,720,global.ly_obj[2],obj_fpo_parent);
tb_obj_l.tween_xPos = true;
tb_obj_l.tween_yPos = false;
tb_obj_l.tween_alpha = true;
tb_obj_l.persistent = true;
tb_obj_l.image_xscale = -1;
tb_obj_l.visible = false;

#region //shader uniforms

	suni_blur_size = shader_get_uniform(shd_blur,"size");
	
#endregion