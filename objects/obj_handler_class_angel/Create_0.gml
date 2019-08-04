/// @description Insert description here
// You can write your code in this editor

event_inherited();

name = "Angel";
desc = "Soldiers equipped with specialized armor originally built to combat an alien threat. A multirole class, Angels use the power of light to support allies as well as crush foes.";
cName = "ANGE_" + string(global.cid++);

ms_name = "Blinding Light";
ms_desc = "All attacks have a Lv*0.5% chance to Blind.";
ms_icon = spr_icon_lgtUp;

ss_name = "SPD+ (s)";
ss_desc = "Slightly increase base Speed.";
ss_icon = spr_icon_spdUp;
ss_toolTip = "SPD: !";
ss_rate = .5;

stat_desynch_base = 1.15;
stat_desynch_rate = -.15;

#region //tier 1

    var
    _ix = 0,
    _iy = 0;

    grd_skillName[# _ix,_iy] = "LGT Res+";
    grd_skillDesc[# _ix,_iy] = "Decrease damage taken from Light Element.";
    grd_skillTooltip[# _ix,_iy] = "LGT Res: !";
    grd_skillIcon[# _ix,_iy] = spr_icon_lgtRes;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "TRI-DEF+";
    grd_skillDesc[# _ix,_iy] = "Increase base M/F/S-DEF.";
    grd_skillTooltip[# _ix,_iy] = "M/F/S-Def: !";
    grd_skillIcon[# _ix,_iy] = spr_icon_triDefUp;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Light Love";
    grd_skillDesc[# _ix,_iy] = "Increase damage dealt with Light Element.";
    grd_skillTooltip[# _ix,_iy] = "LGT Damage: !%";
    grd_skillRate[# _ix,_iy] = .04;
    grd_skillIcon[# _ix,_iy] = spr_icon_lgtUp;

#endregion

#region //tier 2

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Angelic Step";
    grd_skillDesc[# _ix,_iy] = "[1 Angelite] Negate 1 attack, briefly increase EVA after negation.";
    grd_skillTooltip[# _ix,_iy] = "";
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_ange_aStep);
    grd_skillIcon[# _ix,_iy] = spr_icon_stanceShield;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Angelite";
    grd_skillDesc[# _ix,_iy] = "[Stance Act] Collect holy energy during battle to use special skills.";
    grd_skillTooltip[# _ix,_iy] = "Max Angelite: !";
    grd_skillRate[# _ix,_iy] = 1;
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_ange_angelite);
    grd_skillIcon[# _ix,_iy] = spr_icon_stance;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Angelic Dash";
    grd_skillDesc[# _ix,_iy] = "[1 Angelite] Reset all active cooldowns.";
    grd_skillTooltip[# _ix,_iy] = "";
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_ange_aDash);
    grd_skillIcon[# _ix,_iy] = spr_icon_stanceTimerReduce;

#endregion

#region //tier 3

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Angelic Blessing";
    grd_skillDesc[# _ix,_iy] = "[3 Angelite] Fully restore all allies' EN and briefly boost their stats.";
    grd_skillTooltip[# _ix,_iy] = "Duration: !sec";
    grd_skillRate[# _ix,_iy] = 3;
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_ange_aBlessing);
    grd_skillIcon[# _ix,_iy] = spr_icon_stanceCure;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Angelite Boost TRI";
    grd_skillDesc[# _ix,_iy] = "Increase Angelite gain when alternating between Melee/Firearm/Spell attacks.";
    grd_skillTooltip[# _ix,_iy] = "Angelite Gain: !%";
    grd_skillRate[# _ix,_iy] = .2;
    grd_skillIcon[# _ix,_iy] = spr_icon_stanceUp;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Angelic Smite";
    grd_skillDesc[# _ix,_iy] = "[2 Angelite] Stun all enemies and briefly reduce their Speed.";
    grd_skillTooltip[# _ix,_iy] = "Duration: !sec";
    grd_skillRate[# _ix,_iy] = 3;
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_ange_aSmite);
    grd_skillIcon[# _ix,_iy] = spr_icon_stanceBrt;

#endregion

#region //tier 4

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Desynch";
    grd_skillDesc[# _ix,_iy] = "[X Act] Only usable when Angelite is full - Drain Angelite to shift into the Angelic Plane, becoming fully immune to damage while active.";
    grd_skillTooltip[# _ix,_iy] = "Drain Rate: !/sec";
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_ange_desynch);
    grd_skillIcon[# _ix,_iy] = spr_icon_stanceFullShield;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Angelite Boost LGT";
    grd_skillDesc[# _ix,_iy] = "Increase Angelite gain when dealing Light damage.";
    grd_skillTooltip[# _ix,_iy] = "Angelite Gain: !%";
    grd_skillRate[# _ix,_iy] = .2;
    grd_skillIcon[# _ix,_iy] = spr_icon_stanceUp;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Heaven's Rend";
    grd_skillDesc[# _ix,_iy] = "[5 Angelite] Deal damage to each enemy equal to half their remaining HP (up to a maximum value) and inflict a long lasting Blind.";
    grd_skillTooltip[# _ix,_iy] = "Maximum Damage: !";
    grd_skillRate[# _ix,_iy] = 1000;
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_ange_hRend);
    grd_skillIcon[# _ix,_iy] = spr_icon_hRend;

#endregion