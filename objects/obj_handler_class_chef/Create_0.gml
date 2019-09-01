/// @description Insert description here
// You can write your code in this editor

event_inherited();

/*
main skill
Ele Res Mastery
increase all elemental resistances by Lv*0.5
*/

name = "Chef";
desc = "Hearty adventurers that feed enemies and allies alike. An unorthodox support class, Chefs use the unique pan and sling weapons with ingredient skills for various effects.";
cName = "CHEF_" + string(global.cid++);

ms_name = "Mess Kit";
ms_desc = "Store ingredients to be used alongside Pan/Sling weapons. Up to a max of Lv/6 rounded up, caps at 5.";
ms_icon = spr_icon_stance;

ss_name = "M-DEF+ (s)";
ss_desc = "Slightly increase base Melee Defense.";
ss_icon = spr_icon_mDefUp;
ss_toolTip = "M-DEF: !";

stat_specialCd_base = 3000;
stat_specialCd_rate = stat_specialCd_base * -.1;

stat_tt_base = .25;
stat_tt_rate = .05;

#region //tier 1

	var
	_ix = 0,
	_iy = 0;
	
	grd_skillName[# _ix,_iy] = "HP+";
	grd_skillDesc[# _ix,_iy] = "Increase base HP.";
	grd_skillTooltip[# _ix,_iy] = "HP: !";
	grd_skillRate[# _ix,_iy] = 200;
	grd_skillIcon[# _ix,_iy] = spr_icon_hpUp;
	
	_iy++;
	
	grd_skillName[# _ix,_iy] = "Ele Res+";
	grd_skillDesc[# _ix,_iy] = "Decrease damage taken from all elements.";
	grd_skillTooltip[# _ix,_iy] = "Ele Res: !";
	grd_skillRate[# _ix,_iy] = 2;
	grd_skillIcon[# _ix,_iy] = spr_icon_eleRes;
	
	_iy++;
	
	grd_skillName[# _ix,_iy] = "Firm Rice";
	grd_skillDesc[# _ix,_iy] = "[Pan] Add healing effect.\n[Sling] Add damage effect.";
	grd_skillTooltip[# _ix,_iy] = "Effect: !";
	grd_skillRate[# _ix,_iy] = 100;
	grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_chef_food_hp);
	grd_skillIcon[# _ix,_iy] = spr_icon_foodRice;

#endregion

#region //tier 2

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Blast Pepper";
	grd_skillDesc[# _ix,_iy] = "[Pan] Add ATK+ effect.\n[Sling] Add Burn chance.";
	grd_skillTooltip[# _ix,_iy] = "Effect: !%";
	grd_skillRate[# _ix,_iy] = .06;
	grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_chef_food_fir);
	grd_skillIcon[# _ix,_iy] = spr_icon_foodFir;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Super Flour";
	grd_skillDesc[# _ix,_iy] = "[Pan/Sling] Add Wide-Range effect.";
	grd_skillTooltip[# _ix,_iy] = "";
	grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_chef_food_wide);
	grd_skillIcon[# _ix,_iy] = spr_icon_foodFlour;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Winter Green";
	grd_skillDesc[# _ix,_iy] = "[Pan] Add DEF+ effect.\n[Sling] Add Slow chance.";
	grd_skillTooltip[# _ix,_iy] = "Effect: !%";
	grd_skillRate[# _ix,_iy] = .06;
	grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_chef_food_ice);
	grd_skillIcon[# _ix,_iy] = spr_icon_foodIce;

#endregion

#region //tier 3

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Focuspice";
	grd_skillDesc[# _ix,_iy] = "[Pan] Add ACC+ effect.\n[Sling] Add Silence chance.";
	grd_skillTooltip[# _ix,_iy] = "Effect: !%";
	grd_skillRate[# _ix,_iy] = .06;
	grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_chef_food_nat);
	grd_skillIcon[# _ix,_iy] = spr_icon_foodNat;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Double Gum";
	grd_skillDesc[# _ix,_iy] = "[Pan/Sling] Increase hit count of food attacks.";
	grd_skillTooltip[# _ix,_iy] = "";
	grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_chef_food_multi);
	grd_skillIcon[# _ix,_iy] = spr_icon_foodGum;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Citruswift";
	grd_skillDesc[# _ix,_iy] = "[Pan] Add EVA+ effect.\n[Sling] Add Paralyze chance.";
	grd_skillTooltip[# _ix,_iy] = "Effect: !%";
	grd_skillRate[# _ix,_iy] = .06;
	grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_chef_food_elc);
	grd_skillIcon[# _ix,_iy] = spr_icon_foodElc;

#endregion

#region //tier 4

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Brightbroth";
	grd_skillDesc[# _ix,_iy] = "[Pan] Add SPD+ effect.\n[Sling] Add Blind chance.";
	grd_skillTooltip[# _ix,_iy] = "Effect: !%";
	grd_skillRate[# _ix,_iy] = .06;
	grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_chef_food_lgt);
	grd_skillIcon[# _ix,_iy] = spr_icon_foodLgt;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Taste Test";
    grd_skillDesc[# _ix,_iy] = "Allows the user to gain a weakened effect of their food without consuming it.";
    grd_skillTooltip[# _ix,_iy] = "Effect: !%";
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_chef_tasteTest);
    grd_skillIcon[# _ix,_iy] = spr_icon_tasteTest;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Shadestock";
	grd_skillDesc[# _ix,_iy] = "[Pan] Add EN Recover+ effect.\n[Sling] Add Poison chance.";
	grd_skillTooltip[# _ix,_iy] = "Effect: !%";
	grd_skillRate[# _ix,_iy] = .06;
	grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_chef_food_drk);
	grd_skillIcon[# _ix,_iy] = spr_icon_foodDrk;

#endregion