/// @description Insert description here
// You can write your code in this editor

event_inherited();

name = "Razer";
desc = "Brazen warriors that see violence as its own reward. Dealing in raw damage, Razers often suffer recoil while pushing themselves to the limit to get the edge in combat.";
cName = "RAZE_" + string(global.cid++);

ms_name = "Vengeance";
ms_desc = "Increase damage dealt when HP is below (30 + Lv*0.5)%.";
ms_icon = spr_icon_lowHpAtk;

ss_name = "HP+ (s)";
ss_desc = "Slightly increase base HP.";
ss_icon = spr_icon_hpUp;
ss_toolTip = "HP: !";
ss_rate = 10;

stat_kc_base = .45;
stat_kc_rate = .05;

stat_sb_base = 450;
stat_sb_rate = 50;

stat_db_base = .5;
stat_db_rate = .2;

stat_ae_base = 225;
stat_ae_rate = -25;

stat_bl_base = 20;
stat_bl_rate = 5;

#region //tier 1

    var
    _ix = 0,
    _iy = 0;

    grd_skillName[# _ix,_iy] = "SPD+";
    grd_skillDesc[# _ix,_iy] = "Increase base Speed.";
    grd_skillTooltip[# _ix,_iy] = "SPD: !";
    grd_skillIcon[# _ix,_iy] = spr_icon_spdUp;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "TRI-ATK+";
    grd_skillDesc[# _ix,_iy] = "Increase base Melee/Firearm/Spell Attack.";
    grd_skillTooltip[# _ix,_iy] = "M/F/S-ATK: !";
    grd_skillIcon[# _ix,_iy] = spr_icon_triAtkUp;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Ele Love";
    grd_skillDesc[# _ix,_iy] = "Increase damage dealt with all Elements.";
    grd_skillTooltip[# _ix,_iy] = "ELE Damage: !%";
    grd_skillRate[# _ix,_iy] = .04;
    grd_skillIcon[# _ix,_iy] = spr_icon_eleUp;

#endregion

#region //tier 2

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Kneecap";
    grd_skillDesc[# _ix,_iy] = "Melee attack that aims for the target's legs, high chance of decreasing target SPD on hit.";
    grd_skillTooltip[# _ix,_iy] = "Effect Chance: !%";
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_raze_kneecap);
    grd_skillIcon[# _ix,_iy] = spr_icon_kneecap;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "M-ATK+";
    grd_skillDesc[# _ix,_iy] = "Increase base Melee Attack.";
    grd_skillTooltip[# _ix,_iy] = "M-ATK: !";
    grd_skillIcon[# _ix,_iy] = spr_icon_mAtkUp;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Stressor Blow";
    grd_skillDesc[# _ix,_iy] = "A high power Melee attack that also damages the user slightly.";
    grd_skillTooltip[# _ix,_iy] = "Power: !";
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_raze_sBlow);
    grd_skillIcon[# _ix,_iy] = spr_icon_sBlow;

#endregion

#region //tier 3

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Reaper Edge";
    grd_skillDesc[# _ix,_iy] = "A secret Melee technique that vastly increases in power against foes with status effects/debuffs.";
    grd_skillTooltip[# _ix,_iy] = "Dmg Bonus: !%";
    grd_skillRate[# _ix,_iy] = .2;
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_raze_rEdge);
    grd_skillIcon[# _ix,_iy] = spr_icon_debuffSlash;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Adapt Dodge";
    grd_skillDesc[# _ix,_iy] = "Increase Evasion gradually over time, resets on dodge.";
    grd_skillTooltip[# _ix,_iy] = "Max Boost: !%";
    grd_skillRate[# _ix,_iy] = .4;
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_raze_aDodge);
    grd_skillIcon[# _ix,_iy] = spr_icon_stance;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Dire Blow";
    grd_skillDesc[# _ix,_iy] = "A Melee desperation move that drains half the user's remaining hp and deals damage based on how much HP is drained.";
    grd_skillTooltip[# _ix,_iy] = "Conversion Rate: !%";
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_raze_dBlow);
    grd_skillIcon[# _ix,_iy] = spr_icon_dBlow;

#endregion

#region //tier 4

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Accelerator Edge";
    grd_skillDesc[# _ix,_iy] = "A Melee secret technique that, while difficult to land, uses momentum to greatly increase SPD for a brief time. Slight recoil.";
    grd_skillTooltip[# _ix,_iy] = "Recoil: !";
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_raze_aEdge);
    grd_skillIcon[# _ix,_iy] = spr_icon_accelEdge;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Bloodlust";
    grd_skillDesc[# _ix,_iy] = "[Stance Act] Slowly drain the user's HP to gain a damage buff that increases as damage is dealt. Effect ends at 20% HP.";
    grd_skillTooltip[# _ix,_iy] = "Drain Rate: !/sec\n Max Boost: @%";
    grd_skillRate[# _ix,_iy] = .2;
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_raze_bLust);
    grd_skillIcon[# _ix,_iy] = spr_icon_stance;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Recompense Cross";
    grd_skillDesc[# _ix,_iy] = "[X Act] Charges by taking damage - Deal severe Melee damage to all enemies, slight chance of Instakill but leaves the user exhausted.";
    grd_skillTooltip[# _ix,_iy] = "IK Chance: !%";
    grd_skillRate[# _ix,_iy] = .02;
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_raze_rCross);
    grd_skillIcon[# _ix,_iy] = spr_icon_rCross;

#endregion