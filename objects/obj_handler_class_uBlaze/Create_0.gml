/// @description Insert description here
// You can write your code in this editor

event_inherited();

ds_grid_resize(grd_skills,2,3);

name = "U.Blaze";
desc = "Blaze only. Unique class chip focused on dealing damage and debuffing enemies.";

#region //tier 1

    var
    _ix = 0,
    _iy = 0;

    grd_skillName[# _ix,_iy] = "F-ATK+";
    grd_skillDesc[# _ix,_iy] = "Increase base Firearm Attack.";
    grd_skillTooltip[# _ix,_iy] = "F-ATK: !";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "EVA+";
    grd_skillDesc[# _ix,_iy] = "Increase base Evasion.";
    grd_skillTooltip[# _ix,_iy] = "EVA: !";
    grd_skillRate[# _ix,_iy] = stat_fineStatRate;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "S-ATK+";
    grd_skillDesc[# _ix,_iy] = "Increase base Spell Attack.";
    grd_skillTooltip[# _ix,_iy] = "S-ATK: !";

#endregion

#region //tier 2

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Hasten HGN/SHG";//
    grd_skillDesc[# _ix,_iy] = "Reduce universal cooldown after using Handguns or Shotguns.";
    grd_skillTooltip[# _ix,_iy] = "CD Reduction: !%";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Slow Imbue";//
    grd_skillDesc[# _ix,_iy] = "All weapon attacks have a chance of inflicting Slow.";
    grd_skillTooltip[# _ix,_iy] = "Proc Rate: !%";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Wide Flict";//
    grd_skillDesc[# _ix,_iy] = "Status ailments have a chance of affecting all enemies.";
    grd_skillTooltip[# _ix,_iy] = "Proc Rate: !%";

#endregion