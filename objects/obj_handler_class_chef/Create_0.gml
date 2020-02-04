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
ms_desc = "[Stance] Store ingredients to be used alongside Pan/Sling weapons. Up to a max of Lv/6 rounded up, caps at 5.";
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
	
	#macro CHEF_SK_HP 0,0
	grd_skillName[# CHEF_SK_HP] = "HP+";
	grd_skillDesc[# CHEF_SK_HP] = "Increase base HP.";
	grd_skillTooltip[# CHEF_SK_HP] = "HP: !";
	grd_skillRate[# CHEF_SK_HP] = 200;
	grd_skillIcon[# CHEF_SK_HP] = spr_icon_hpUp;
	
	_iy++;
	
	#macro CHEF_SK_ELE 0,1
	grd_skillName[# CHEF_SK_ELE] = "Ele Res+";
	grd_skillDesc[# CHEF_SK_ELE] = "Decrease damage taken from all elements.";
	grd_skillTooltip[# CHEF_SK_ELE] = "Ele Res: !";
	grd_skillRate[# CHEF_SK_ELE] = 2;
	grd_skillIcon[# CHEF_SK_ELE] = spr_icon_eleRes;
	
	_iy++;
	
	#macro CHEF_SK_RICE 0,2
	grd_skillName[# CHEF_SK_RICE] = "Firm Rice";
	grd_skillDesc[# CHEF_SK_RICE] = "[Pan] Add healing effect.\n[Sling] Add damage effect.";
	grd_skillTooltip[# CHEF_SK_RICE] = "Effect: !";
	grd_skillRate[# CHEF_SK_RICE] = 100;
	grd_skillAct[# CHEF_SK_RICE] = instance_create_depth(0,0,0,obj_handler_act_chef_food_hp);
	grd_skillIcon[# CHEF_SK_RICE] = spr_icon_foodRice;

#endregion

#region //tier 2

    _ix++;
    _iy = 0;

    #macro CHEF_SK_BLAST 1,0
    grd_skillName[# CHEF_SK_BLAST] = "Blast Pepper";
	grd_skillDesc[# CHEF_SK_BLAST] = "[Pan] Add ATK+ effect.\n[Sling] Add Burn chance.";
	grd_skillTooltip[# CHEF_SK_BLAST] = "Effect: !%";
	grd_skillRate[# CHEF_SK_BLAST] = .06;
	grd_skillAct[# CHEF_SK_BLAST] = instance_create_depth(0,0,0,obj_handler_act_chef_food_fir);
	grd_skillIcon[# CHEF_SK_BLAST] = spr_icon_foodFir;
    
    _iy++;
    
    #macro CHEF_SK_FLOUR 1,1
    grd_skillName[# CHEF_SK_FLOUR] = "Super Flour";
	grd_skillDesc[# CHEF_SK_FLOUR] = "[Pan/Sling] Add Wide-Range effect.";
	grd_skillTooltip[# CHEF_SK_FLOUR] = "";
	grd_skillAct[# CHEF_SK_FLOUR] = instance_create_depth(0,0,0,obj_handler_act_chef_food_wide);
	grd_skillIcon[# CHEF_SK_FLOUR] = spr_icon_foodFlour;
    
    _iy++;
    
    #macro CHEF_SK_GUARD 1,2
    grd_skillName[# CHEF_SK_GUARD] = "Guard Greens";
	grd_skillDesc[# CHEF_SK_GUARD] = "[Pan] Add DEF+ effect.\n[Sling] Add Slow chance.";
	grd_skillTooltip[# CHEF_SK_GUARD] = "Effect: !%";
	grd_skillRate[# CHEF_SK_GUARD] = .06;
	grd_skillAct[# CHEF_SK_GUARD] = instance_create_depth(0,0,0,obj_handler_act_chef_food_ice);
	grd_skillIcon[# CHEF_SK_GUARD] = spr_icon_foodIce;

#endregion

#region //tier 3

    _ix++;
    _iy = 0;
    
    #macro CHEF_SK_FOCUS 2,0
    grd_skillName[# CHEF_SK_FOCUS] = "Focuspice";
	grd_skillDesc[# CHEF_SK_FOCUS] = "[Pan] Add ACC+ effect.\n[Sling] Add Silence chance.";
	grd_skillTooltip[# CHEF_SK_FOCUS] = "Effect: !%";
	grd_skillRate[# CHEF_SK_FOCUS] = .06;
	grd_skillAct[# CHEF_SK_FOCUS] = instance_create_depth(0,0,0,obj_handler_act_chef_food_nat);
	grd_skillIcon[# CHEF_SK_FOCUS] = spr_icon_foodNat;
    
    _iy++;
    
    #macro CHEF_SK_DOUBLE 2,1
    grd_skillName[# CHEF_SK_DOUBLE] = "Double Gum";
	grd_skillDesc[# CHEF_SK_DOUBLE] = "[Pan/Sling] Increase hit count of food attacks.";
	grd_skillTooltip[# CHEF_SK_DOUBLE] = "";
	grd_skillAct[# CHEF_SK_DOUBLE] = instance_create_depth(0,0,0,obj_handler_act_chef_food_multi);
	grd_skillIcon[# CHEF_SK_DOUBLE] = spr_icon_foodGum;
    
    _iy++;
    
    #macro CHEF_SK_SWIFT 2,2
    grd_skillName[# CHEF_SK_SWIFT] = "Citruswift";
	grd_skillDesc[# CHEF_SK_SWIFT] = "[Pan] Add EVA+ effect.\n[Sling] Add Paralyze chance.";
	grd_skillTooltip[# CHEF_SK_SWIFT] = "Effect: !%";
	grd_skillRate[# CHEF_SK_SWIFT] = .06;
	grd_skillAct[# CHEF_SK_SWIFT] = instance_create_depth(0,0,0,obj_handler_act_chef_food_elc);
	grd_skillIcon[# CHEF_SK_SWIFT] = spr_icon_foodElc;

#endregion

#region //tier 4

    _ix++;
    _iy = 0;

    #macro CHEF_SK_BRIGHT 3,0
    grd_skillName[# CHEF_SK_BRIGHT] = "Brightbroth";
	grd_skillDesc[# CHEF_SK_BRIGHT] = "[Pan] Add SPD+ effect.\n[Sling] Add Blind chance.";
	grd_skillTooltip[# CHEF_SK_BRIGHT] = "Effect: !%";
	grd_skillRate[# CHEF_SK_BRIGHT] = .06;
	grd_skillAct[# CHEF_SK_BRIGHT] = instance_create_depth(0,0,0,obj_handler_act_chef_food_lgt);
	grd_skillIcon[# CHEF_SK_BRIGHT] = spr_icon_foodLgt;
    
    _iy++;
    
    #macro CHEF_SK_TASTE 3,1
    grd_skillName[# CHEF_SK_TASTE] = "Taste Test";
    grd_skillDesc[# CHEF_SK_TASTE] = "Allows the user to gain a weakened effect of their food without consuming it.";
    grd_skillTooltip[# CHEF_SK_TASTE] = "Effect: !%";
    grd_skillAct[# CHEF_SK_TASTE] = instance_create_depth(0,0,0,obj_handler_act_chef_tasteTest);
    grd_skillIcon[# CHEF_SK_TASTE] = spr_icon_tasteTest;
    
    _iy++;
    
    #macro CHEF_SK_SHADE 3,2
    grd_skillName[# CHEF_SK_SHADE] = "Shadestock";
	grd_skillDesc[# CHEF_SK_SHADE] = "[Pan] Add EN Recover+ effect.\n[Sling] Add Poison chance.";
	grd_skillTooltip[# CHEF_SK_SHADE] = "Effect: !%";
	grd_skillRate[# CHEF_SK_SHADE] = .06;
	grd_skillAct[# CHEF_SK_SHADE] = instance_create_depth(0,0,0,obj_handler_act_chef_food_drk);
	grd_skillIcon[# CHEF_SK_SHADE] = spr_icon_foodDrk;

#endregion