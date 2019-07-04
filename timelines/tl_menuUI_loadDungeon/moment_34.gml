
var SV_map = scr_data_getMap(global.grd_missions,global.missionCurr);

if(load_step = 0){
	var SV_o = instance_create_depth(100,600,0,obj_fpo_loadBanner);
	
	with SV_o{
		layer = global.ly_obj[5];
		
		image_xscale = room_width;
		image_yscale = 0;
		
		tween_xPos = true;
		x += 200;
		
		tween_yPos = true;
		y += tgt_yScale / 2;
		
		fill_col = c_white;
		
		tween_alpha = true;
		tgt_alpha = 1;
		image_alpha = 0;
		
		//tweenSpd = 7;
	}
	
	ds_list_add(lst_link_loadExtra,SV_o);
}

load_step++;

var
SV_x = 1000,
SV_yStart = 95,
SV_yGap = 95;

switch load_step{
	case 3:
		var SV_o = instance_create_depth(SV_x,SV_yStart + (SV_yGap * 0),0,obj_fpo_parent);
		
		with SV_o{
			layer = global.ly_obj[5];
			
			txt[0] = "-Operation-";
			txt[1] = SV_map[? MSN_VAR_OPNAME];
			
			txt_halign[0] = fa_right;
			txt_halign[1] = fa_right;
			
			txt_valign[0] = fa_bottom;
			txt_valign[1] = fa_top;
			
			txt_ft[0] = ft_dungeonBold;
			txt_ft[1] = ft_dungeonBoldLarge;
			
			tween_xPos = true;
			x += 100;
			
			tween_alpha = true;
			image_alpha = 0;
			tgt_alpha = 1;
		}
		
		ds_list_add(lst_link_loadExtra,SV_o);
		
		break;
		
	case 4:
		var SV_o = instance_create_depth(SV_x,SV_yStart + (SV_yGap * 1),0,obj_fpo_parent);
		
		with SV_o{
			layer = global.ly_obj[5];
			
			txt[0] = "-Client-";
			txt[1] = SV_map[? MSN_VAR_CLIENT];
			
			txt_halign[0] = fa_right;
			txt_halign[1] = fa_right;
			
			txt_valign[0] = fa_bottom;
			txt_valign[1] = fa_top;
			
			txt_ft[0] = ft_dungeonBold;
			txt_ft[1] = ft_dungeonBoldLarge;
			
			tween_xPos = true;
			x += 100;
			
			tween_alpha = true;
			image_alpha = 0;
			tgt_alpha = 1;
		}
		
		ds_list_add(lst_link_loadExtra,SV_o);
		
		break;
		
	case 5:
		var SV_o = instance_create_depth(SV_x,SV_yStart + (SV_yGap * 2),0,obj_fpo_parent);
		
		with SV_o{
			layer = global.ly_obj[5];
			
			txt[0] = "-OpFor-";
			txt[1] = SV_map[? MSN_VAR_OPFOR];
			
			txt_halign[0] = fa_right;
			txt_halign[1] = fa_right;
			
			txt_valign[0] = fa_bottom;
			txt_valign[1] = fa_top;
			
			txt_ft[0] = ft_dungeonBold;
			txt_ft[1] = ft_dungeonBoldLarge;
			
			tween_xPos = true;
			x += 100;
			
			tween_alpha = true;
			image_alpha = 0;
			tgt_alpha = 1;
		}
		
		ds_list_add(lst_link_loadExtra,SV_o);
		
		break;
		
	case 6:
		var SV_o = instance_create_depth(SV_x,SV_yStart + (SV_yGap * 3),0,obj_fpo_parent);
		
		with SV_o{
			layer = global.ly_obj[5];
			
			txt[0] = "-Location-";
			txt[1] = SV_map[? MSN_VAR_DESC_LOC];
			
			txt_halign[0] = fa_right;
			txt_halign[1] = fa_right;
			
			txt_valign[0] = fa_bottom;
			txt_valign[1] = fa_top;
			
			txt_ft[0] = ft_dungeonBold;
			txt_ft[1] = ft_dungeonBoldLarge;
			
			tween_xPos = true;
			x += 100;
			
			tween_alpha = true;
			image_alpha = 0;
			tgt_alpha = 1;
		}
		
		ds_list_add(lst_link_loadExtra,SV_o);
		
		break;
		
	case 7:
		var SV_o = instance_create_depth(SV_x,SV_yStart + (SV_yGap * 4),0,obj_fpo_parent);
		
		with SV_o{
			layer = global.ly_obj[5];
			
			txt[0] = "-Estimated Success Rate-";
			txt[1] = SV_map[? MSN_VAR_ESR];
			
			txt_halign[0] = fa_right;
			txt_halign[1] = fa_right;
			
			txt_valign[0] = fa_bottom;
			txt_valign[1] = fa_top;
			
			txt_ft[0] = ft_dungeonBold;
			txt_ft[1] = ft_dungeonBoldLarge;
			
			tween_xPos = true;
			x += 100;
			
			tween_alpha = true;
			image_alpha = 0;
			tgt_alpha = 1;
		}
		
		ds_list_add(lst_link_loadExtra,SV_o);
		
		break;
}

if(load_step < 10){ //change to 4
	timeline_position += -30;
}