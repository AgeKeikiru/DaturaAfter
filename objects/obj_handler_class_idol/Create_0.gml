/// @description Insert description here
// You can write your code in this editor

event_inherited();

name = "Idol";
desc = "Charismatic performers that make a show out of every battle. Focused on support, Idols use flashy techniques and hype to boost the abilities of their allies.";
cName = "IDOL_" + string(global.cid++);

ms_name = "Hype Meter";
ms_desc = "[Stance] Generate Hype and Aggro based on Lv by attacking to use special actions. Lowers over time.";
ms_icon = spr_icon_stance;

ss_name = "ACC+ (s)";
ss_desc = "Slightly increase base Accuracy.";
ss_icon = spr_icon_accUp;
ss_toolTip = "ACC: !";
ss_rate = .5;

stat_pup_base = 5;
stat_pup_rate = 1;

stat_cheer_base = 2.5;
stat_cheer_rate = .5;

stat_ts_base = 35;
stat_ts_rate = 5;

stat_gf_base = 1.5;
stat_gf_rate = -.1;

#region //tier 1

    var
    _ix = 0,
    _iy = 0;

    grd_skillName[# _ix,_iy] = "EVA+";
    grd_skillDesc[# _ix,_iy] = "Increase base Evasion.";
    grd_skillTooltip[# _ix,_iy] = "EVA: !";
    grd_skillRate[# _ix,_iy] = stat_fineStatRate;
    grd_skillIcon[# _ix,_iy] = spr_icon_evaUp;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Stage Presence";
    grd_skillDesc[# _ix,_iy] = "Increase time before hype begins to fall.";
    grd_skillTooltip[# _ix,_iy] = "Delay: !";
    grd_skillRate[# _ix,_iy] = .2;
    grd_skillIcon[# _ix,_iy] = spr_icon_stanceUp;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "MISC+";
    grd_skillDesc[# _ix,_iy] = "Increase base Misc.";
    grd_skillTooltip[# _ix,_iy] = "MISC: !";
    grd_skillRate[# _ix,_iy] = stat_fineStatRate;
    grd_skillIcon[# _ix,_iy] = spr_icon_miscUp;

#endregion

#region //tier 2

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Hyper Pickup";
    grd_skillDesc[# _ix,_iy] = "[2 Hype] Cure an ally's ailments/debuffs. Aggro transfer.";
    grd_skillTooltip[# _ix,_iy] = "Duration: !sec";
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_idol_hPickup);
    grd_skillIcon[# _ix,_iy] = spr_icon_stanceCure;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Hype-Boost Teamwork";
    grd_skillDesc[# _ix,_iy] = "Increase Hype gain when attacking alongside an ally.";
    grd_skillTooltip[# _ix,_iy] = "Gain: !%";
    grd_skillRate[# _ix,_iy] = .2;
    grd_skillIcon[# _ix,_iy] = spr_icon_stanceUp;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Hyper Pep-Talk";
    grd_skillDesc[# _ix,_iy] = "[1+ Hype] Heal an ally based on hype used. Brief Aggro transfer.";
    grd_skillTooltip[# _ix,_iy] = "Conversion Rate: !%";
    grd_skillRate[# _ix,_iy] = 100;
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_idol_hPep);
    grd_skillIcon[# _ix,_iy] = spr_icon_stanceHeal;

#endregion

#region //tier 3

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Hyper Cheer";
    grd_skillDesc[# _ix,_iy] = "[1+ Hype] Boost an ally's stats, duration based on how much Hype was used. Aggro transfer.";
    grd_skillTooltip[# _ix,_iy] = "Duration: !sec";
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_idol_hCheer);
    grd_skillIcon[# _ix,_iy] = spr_icon_stanceCure;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Hype-Boost Adrenaline";
    grd_skillDesc[# _ix,_iy] = "Slowly gain Hype while HP is below a certain amount.";
    grd_skillTooltip[# _ix,_iy] = "HP Threshold: !%";
    grd_skillRate[# _ix,_iy] = .12;
    grd_skillIcon[# _ix,_iy] = spr_icon_stanceUp;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Hyper One-More";
    grd_skillDesc[# _ix,_iy] = "[4 Hype] Revive an ally. Brief inverse Aggro transfer.";
    grd_skillTooltip[# _ix,_iy] = "Power: !";
    grd_skillRate[# _ix,_iy] = 200;
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_idol_hOne);
    grd_skillIcon[# _ix,_iy] = spr_icon_stanceRaise;

#endregion

#region //tier 4

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Live Defamation";
    grd_skillDesc[# _ix,_iy] = "Greatly increases Aggro and Hype.";
    grd_skillTooltip[# _ix,_iy] = "Aggro: !";
    grd_skillRate[# _ix,_iy] = 1;
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_idol_defame);
    grd_skillIcon[# _ix,_iy] = spr_icon_stanceUpAlly;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Hyper Grand Finale";
    grd_skillDesc[# _ix,_iy] = "[5+ Hype] Drain hype to greatly increase all allies' Speed and negate EN cost.";
    grd_skillTooltip[# _ix,_iy] = "Drain Rate: !/sec";
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_idol_finale);
    grd_skillIcon[# _ix,_iy] = spr_icon_stanceTimerReduce;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Taunting Strike";
    grd_skillDesc[# _ix,_iy] = "A difficult Melee attack to land, but generates large Hype if it hits.";
    grd_skillTooltip[# _ix,_iy] = "Accuracy: !";
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_idol_tStrike);
    grd_skillIcon[# _ix,_iy] = spr_icon_stanceUpEnemy;

#endregion