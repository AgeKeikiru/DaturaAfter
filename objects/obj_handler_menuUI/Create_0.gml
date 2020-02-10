/// @description Insert description here
alarm[0] = room_speed * 5;
alarm[1] = room_speed * 2;

if(instance_number(obj_handler_menuUI) > 1){
	global.tempInt = id;
	
	with obj_handler_menuUI{
		if(id != global.tempInt){
			instance_destroy();
		}
	}
}else{
	layer = global.ly_obj[2];
	ds_grid_set_region(grd_ps_xDraw,0,0,3,1,1); //x positions for drawing menu fill, 0-1 for bottom layer, 2-3 for top layer
}

compareItem = noone;
rndTxt_tgt = "";
rndTxt_draw = 0;
rndTxt_ft = ft_menuSub;

lst_titlePattern = ds_list_create();

enum en_tPattern{
    x,
    y,
    gap,
    length,
    width,
    color,
    alpha,
    speed,
    offset
}

//fat
repeat(5){
    ds_list_add(lst_titlePattern,[
        random_range(200,800),
        random_range(0,720),
        random_range(10,100),
        random_range(100,700),
        random_range(50,100),
        choose(c_gray,c_black,CC_ENBLUE),
        random_range(0.02,0.2),
        random_range(0.1,1),
        random_range(0,1000)
    ]);
}

//thin
repeat(5){
    ds_list_add(lst_titlePattern,[
        random_range(0,1280),
        random_range(0,720),
        random_range(10,100),
        random_range(100,700),
        random_range(2,10),
        choose(c_gray,c_black,CC_ENBLUE),
        random_range(0.02,0.2),
        random_range(0.8,2),
        random_range(0,1000)
    ]);
}

#region //shader uniforms

	suni_silhouette_col = shader_get_uniform(shd_silhouette,"v4_col");
	suni_silhouette_col2 = shader_get_uniform(shd_silhouette,"v4_col2");
	suni_silhouette_grad = shader_get_uniform(shd_silhouette,"gradient");
	suni_silhouette_bounds = shader_get_uniform(shd_silhouette,"v2_bounds");
	suni_silhouette_boundMod = shader_get_uniform(shd_silhouette,"boundMod");
	
	suni_glitch_region = shader_get_uniform(shd_glitch, "region");
	suni_glitch_uvs = shader_get_uniform(shd_glitch, "uvs");
	suni_glitch_texel = shader_get_uniform(shd_glitch, "texel");

#endregion