/// @description Insert description here
// You can write your code in this editor

event_inherited();

ds_grid_resize(grd_skills,2,3);

name = "U.Paprika";
desc = "Paprika only. Unique class chip focused on defense with a racial class skill.";

stat_rb_base = 5;
stat_rb_rate = 1;

#region //tier 1

    var
    _ix = 0,
    _iy = 0;

    grd_skillName[# _ix,_iy] = "HP+";
    grd_skillDesc[# _ix,_iy] = "Increase base HP.";
    grd_skillTooltip[# _ix,_iy] = "HP: !";
    grd_skillRate[# _ix,_iy] = 100;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "NAT RES+";
    grd_skillDesc[# _ix,_iy] = "Increase base Nature Resistance.";
    grd_skillTooltip[# _ix,_iy] = "NAT Res: !";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "M-DEF+";
    grd_skillDesc[# _ix,_iy] = "Increase base Melee Defense.";
    grd_skillTooltip[# _ix,_iy] = "M-DEF: !";

#endregion

#region //tier 2

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Shield Love";
    grd_skillDesc[# _ix,_iy] = "Increase damage cut with Shields.";
    grd_skillTooltip[# _ix,_iy] = "SHD Defense: !%";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Wild Install"; //x stance
    grd_skillDesc[# _ix,_iy] = "Charge via taking damage. Briefly boost attack power and speed at the cost of defense and manual targetting.";
    grd_skillTooltip[# _ix,_iy] = "Duration: !sec";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Refresh Boost";
    grd_skillDesc[# _ix,_iy] = "Boost stats when healed.";
    grd_skillTooltip[# _ix,_iy] = "Duration: !sec";

#endregion