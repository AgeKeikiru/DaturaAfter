/// @description Insert description here
// You can write your code in this editor

event_inherited();

ds_grid_resize(grd_skills,2,3);

name = "U.Levia";
desc = "Levia only. Unique class chip focused on thriving at low HP with rare skills.";

stat_soh_base = 0.6;
stat_soh_rate = -0.06;

#region //tier 1

    var
    _ix = 0,
    _iy = 0;

    grd_skillName[# _ix,_iy] = "EVA+";
    grd_skillDesc[# _ix,_iy] = "Increase base Evasion.";
    grd_skillTooltip[# _ix,_iy] = "EVA: !";
    grd_skillRate[# _ix,_iy] = stat_fineStatRate;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "M-ATK+";
    grd_skillDesc[# _ix,_iy] = "Increase base Melee Attack.";
    grd_skillTooltip[# _ix,_iy] = "M-ATK: !";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "MISC+";
    grd_skillDesc[# _ix,_iy] = "Increase base Misc.";
    grd_skillTooltip[# _ix,_iy] = "MISC: !";
    grd_skillRate[# _ix,_iy] = stat_fineStatRate;

#endregion

#region //tier 2

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Go For Broke";
    grd_skillDesc[# _ix,_iy] = "Reset all cooldowns when HP drops below a certain value.";
    grd_skillTooltip[# _ix,_iy] = "Threshold: !%";
    grd_skillRate[# _ix,_iy] = 0.06;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Vampirism M";
    grd_skillDesc[# _ix,_iy] = "Melee attacks have a chance to lifesteal.";
    grd_skillTooltip[# _ix,_iy] = "Proc Rate: !%";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "EX Hasten DGR";
    grd_skillDesc[# _ix,_iy] = "Daggers gain the [Agile] property, at increased EN cost.";
    grd_skillTooltip[# _ix,_iy] = "EN Cost: !%";

#endregion