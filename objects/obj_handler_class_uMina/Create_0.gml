/// @description Insert description here
// You can write your code in this editor

event_inherited();

ds_grid_resize(grd_skills,2,3);

name = "U.Mina";
desc = "Mina only. Unique class chip focused on niche stats with ultra-rare skills.";

#region //tier 1

    var
    _ix = 0,
    _iy = 0;

    grd_skillName[# _ix,_iy] = "ACC+";
    grd_skillDesc[# _ix,_iy] = "Increase base Accuracy.";
    grd_skillTooltip[# _ix,_iy] = "ACC: !";
    grd_skillRate[# _ix,_iy] = stat_fineStatRate;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "MISC+";
    grd_skillDesc[# _ix,_iy] = "Increase base Misc.";
    grd_skillTooltip[# _ix,_iy] = "MISC: !";
    grd_skillRate[# _ix,_iy] = stat_fineStatRate;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "EVA+";
    grd_skillDesc[# _ix,_iy] = "Increase base Evasion.";
    grd_skillTooltip[# _ix,_iy] = "EVA: !";
    grd_skillRate[# _ix,_iy] = stat_fineStatRate;

#endregion

#region //tier 2

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Hasten ALL";//
    grd_skillDesc[# _ix,_iy] = "Reduce universal cooldown after using any weapon.";
    grd_skillTooltip[# _ix,_iy] = "CD Reduction: !%";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Dual Wield ALL";//
    grd_skillDesc[# _ix,_iy] = "Double hit count of all weapons, at reduced damage.";
    grd_skillTooltip[# _ix,_iy] = "Damage Rate: !%";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "True Synergy";//
    grd_skillDesc[# _ix,_iy] = "Add a portion of all Attack stats to all damage.";
    grd_skillTooltip[# _ix,_iy] = "M/F/S-ATK Added: !%";

#endregion