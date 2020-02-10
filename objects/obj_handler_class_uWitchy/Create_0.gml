/// @description Insert description here
// You can write your code in this editor

event_inherited();

ds_grid_resize(grd_skills,2,3);

name = "U.Witchy";
desc = "Witchy only. Unique class chip focused on unrelenting defense with a racial class skill.";

stat_c9_base = 1;
stat_c9_rate = -0.04;

#region //tier 1

    var
    _ix = 0,
    _iy = 0;

    grd_skillName[# _ix,_iy] = "HP+";
    grd_skillDesc[# _ix,_iy] = "Increase base HP.";
    grd_skillTooltip[# _ix,_iy] = "HP: !";
    grd_skillRate[# _ix,_iy] = 100;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "TRI-DEF+";
    grd_skillDesc[# _ix,_iy] = "Increase base Melee/Firearm/Spell Defense.";
    grd_skillTooltip[# _ix,_iy] = "M/F/S-Def: !";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "HP+";
    grd_skillDesc[# _ix,_iy] = "Increase base HP.";
    grd_skillTooltip[# _ix,_iy] = "HP: !";
    grd_skillRate[# _ix,_iy] = 100;

#endregion

#region //tier 2

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Smug Aura";//
    grd_skillDesc[# _ix,_iy] = "Prevent aggro from being dropped below a certain level.";
    grd_skillTooltip[# _ix,_iy] = "Max Aggro: !";
    grd_skillRate[# _ix,_iy] = 1;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Wild Install"; //x stance
    grd_skillDesc[# _ix,_iy] = "Charge via taking damage. Briefly boost attack power and speed at the cost of defense and manual targetting.";
    grd_skillTooltip[# _ix,_iy] = "Duration: !sec";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Cloud 9";//
    grd_skillDesc[# _ix,_iy] = "Immune to status ailments while HP is above a certain value.";
    grd_skillTooltip[# _ix,_iy] = "Threshold: !%";

#endregion