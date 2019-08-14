
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
			
			txt[0] = "-Operation Name-";
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
		
		SV_o = instance_create_depth(100,SV_yStart + (SV_yGap * 2),0,obj_fpo_parent);
		
		with SV_o{
			layer = global.ly_obj[5];
			
			var SV_arr = [
				"Try to coordinate attacks: if all active enemies are killed simultaneously, the battle will end even if there are still enemy reinforcements remaining.",
				"Enemies are more likely to attack the left-most party member.",
				"Only one stance can be active at a time per-character. Activating the same stance while it is already active will deactivate it.",
				"Handguns and Daggers are weak, but excellent for recovering EN - always keep one on you!",
				
				"Paralysis: Disables Stance effects and prevents dodging incoming attacks.",
				"Silence: Makes elemental attacks ineffective and reduces the duration of buffs.",
				"Poison: Gradually drains health over time and extends the duration of debuffs.",
				"Blind: Attacks have a 50% fixed chance of missing and ignore manual targetting.",
				"Burn: Adds a small recoil effect to all attacks. Has a low chance of spreading to allies when attacked.",
				"Slow: Halves act cooldown speed and prevents dodging incoming attacks.",
				
				"Missions that take place in the Dark will add a slight ACC penalty to all attacks - high ACC weapons are a must to prevent frustrating battles.",
				"Missions that take place on Difficult Terrain will add a slight EVA penalty to all attacks - bring your heaviest weapons and dish out the pain!",
				"Missions that take place under Exhausting circumstances will greatly increase the EN cost of all attacks, but enemies will be slower to act as well.",
				"Missions that take place in Mana Charged environments will greatly increase the inflict rate of status ailments - knowledge of enemy abilities is paramount here.",
				
				"Evoker Tip: With either Evoker stance active, rapidly kill popcorn enemy reinforcements with wide area attacks to quickly stack effects on yourself or a strong enemy.",
				"Angel Tip: Save Angelic Step for enemies that telegraph strong attacks or frequently use wide-range attacks.",
				"Chef Tip: Firm Rice is really bad at level 1.",
				"Razer Tip: Recoil damage counts as charge towards Recompense Cross.",
				"Idol Tip: Alternate between high hit count and low cooldown attacks to quickly build and maintain Hype."
			];
			
			txt[0] = SV_arr[irandom(array_length_1d(SV_arr) + -1)];
			
			txt_halign[0] = fa_left;
			
			txt_valign[0] = fa_middle;
			
			txt_ft[0] = ft_dungeonBold;
			
			txt_w[0] = 560;
			
			tween_xPos = true;
			x += -100;
			
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

if(load_step < 8){
	timeline_position += -20;
}