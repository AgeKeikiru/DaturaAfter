/// @description Insert description here
// You can write your code in this editor

event_inherited();

ds_grid_resize(grd_skills,2,3);

name = "U.Imo'lei";
desc = "Imo'lei only. Unique class chip focused on melee damage and speed with some spell buffs.";

#region //tier 1

    var
    _ix = 0,
    _iy = 0;

    grd_skillName[# _ix,_iy] = "M-ATK+";
    grd_skillDesc[# _ix,_iy] = "Increase Melee Attack.";
    grd_skillTooltip[# _ix,_iy] = "M-ATK: +!";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "S-ATK+";
    grd_skillDesc[# _ix,_iy] = "Increase Spell Attack.";
    grd_skillTooltip[# _ix,_iy] = "S-ATK: +!";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "SPD+";
    grd_skillDesc[# _ix,_iy] = "Increase Speed.";
    grd_skillTooltip[# _ix,_iy] = "SPD: +!";
    grd_skillRate[# _ix,_iy] = stat_fineStatRate;

#endregion

#region //tier 2

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Dual Wield M";
    grd_skillDesc[# _ix,_iy] = "Double hit count of melee weapons, at reduced damage. Does not stack.";
    grd_skillTooltip[# _ix,_iy] = "Damage Rate: !%";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Sleight of Hand SWD/DGR";
    grd_skillDesc[# _ix,_iy] = "Reduce universal cooldown after using Swords or Daggers.";
    grd_skillTooltip[# _ix,_iy] = "CD Reduction: !%";
    grd_skillRate[# _ix,_iy] = 8;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Spell Imbue M";
    grd_skillDesc[# _ix,_iy] = "Add a portion of Spell Attack stat to Melee Attack-based damage.";
    grd_skillTooltip[# _ix,_iy] = "S-ATK Added: !%";
    grd_skillRate[# _ix,_iy] = 10;

#endregion