/// @description Insert description here
// You can write your code in this editor

event_inherited();

ds_grid_resize(grd_skills,2,3);

name = "U.Ari";
desc = "Ari only. Unique class chip focused on proficiency in all forms of damage.";

#region //tier 1

    var
    _ix = 0,
    _iy = 0;

    grd_skillName[# _ix,_iy] = "M-ATK+";
    grd_skillDesc[# _ix,_iy] = "Increase base Melee Attack.";
    grd_skillTooltip[# _ix,_iy] = "M-ATK: !";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "F-ATK+";
    grd_skillDesc[# _ix,_iy] = "Increase base Firearm Attack.";
    grd_skillTooltip[# _ix,_iy] = "F-ATK: !";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "S-ATK+";
    grd_skillDesc[# _ix,_iy] = "Increase base Spell Attack.";
    grd_skillTooltip[# _ix,_iy] = "S-ATK: !";

#endregion

#region //tier 2

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Gauntlet Love";//
    grd_skillDesc[# _ix,_iy] = "Increase damage dealt with Gauntlets.";
    grd_skillTooltip[# _ix,_iy] = "GNT Damage: !%";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Hasten RPG/LMG";//
    grd_skillDesc[# _ix,_iy] = "Reduce universal cooldown after using RPGs or LMGs.";
    grd_skillTooltip[# _ix,_iy] = "CD Reduction: !%";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Weapon Bash S";//
    grd_skillDesc[# _ix,_iy] = "Add a portion of Melee Attack stat to Spell Attack-based damage.";
    grd_skillTooltip[# _ix,_iy] = "M-ATK Added: !%";

#endregion