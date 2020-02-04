/// @description Insert description here
// You can write your code in this editor

event_inherited();

ds_grid_resize(grd_skills,2,3);

name = "U.Eschira";
desc = "Eschira only. Unique class chip focused on powerful and efficient firearm use.";

#region //tier 1

    var
    _ix = 0,
    _iy = 0;

    grd_skillName[# _ix,_iy] = "ACC+";
    grd_skillDesc[# _ix,_iy] = "Increase base Accuracy.";
    grd_skillTooltip[# _ix,_iy] = "ACC: !";
    grd_skillRate[# _ix,_iy] = stat_fineStatRate;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "F-ATK+";
    grd_skillDesc[# _ix,_iy] = "Increase base Firearm Attack.";
    grd_skillTooltip[# _ix,_iy] = "F-ATK: !";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "MISC+";
    grd_skillDesc[# _ix,_iy] = "Increase base Misc.";
    grd_skillTooltip[# _ix,_iy] = "MISC: !";
    grd_skillRate[# _ix,_iy] = stat_fineStatRate;

#endregion

#region //tier 2

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Dual Wield F";
    grd_skillDesc[# _ix,_iy] = "Double hit count of firearm weapons, at reduced damage.";
    grd_skillTooltip[# _ix,_iy] = "Damage Rate: !%";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Hasten RFL/DGR";
    grd_skillDesc[# _ix,_iy] = "Reduce universal cooldown after using Rifles or Daggers.";
    grd_skillTooltip[# _ix,_iy] = "CD Reduction: !%";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Weapon Throw M";
    grd_skillDesc[# _ix,_iy] = "Add a portion of Firearm Attack stat to Melee Attack-based damage.";
    grd_skillTooltip[# _ix,_iy] = "F-ATK Added: !%";

#endregion