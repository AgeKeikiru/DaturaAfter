/// @description Insert description here
// You can write your code in this editor

event_inherited();

ds_grid_resize(grd_skills,2,3);

name = "U.Harzer";
desc = "Harzer only. Unique class chip focused on hitting fast and hard with a risky playstyle.";

#region //tier 1

    var
    _ix = 0,
    _iy = 0;

    grd_skillName[# _ix,_iy] = "SPD+";
    grd_skillDesc[# _ix,_iy] = "Increase base Speed.";
    grd_skillTooltip[# _ix,_iy] = "SPD: !";
    grd_skillRate[# _ix,_iy] = stat_fineStatRate;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "F-ATK+";
    grd_skillDesc[# _ix,_iy] = "Increase base Firearm Attack.";
    grd_skillTooltip[# _ix,_iy] = "F-ATK: !";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "EVA+";
    grd_skillDesc[# _ix,_iy] = "Increase base Evasion.";
    grd_skillTooltip[# _ix,_iy] = "EVA: !";
    grd_skillRate[# _ix,_iy] = stat_fineStatRate;

#endregion

#region //tier 2

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Smug Aura";//
    grd_skillDesc[# _ix,_iy] = "Prevent aggro from being dropped below a certain level.";
    grd_skillTooltip[# _ix,_iy] = "Max Aggro: !";
    grd_skillRate[# _ix,_iy] = 1;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Adrenaline SPD";//
    grd_skillDesc[# _ix,_iy] = "Boost Speed while HP is under 30%.";
    grd_skillTooltip[# _ix,_iy] = "SPD: !";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Dual Wield F";//
    grd_skillDesc[# _ix,_iy] = "Double hit count of firearm weapons, at reduced damage.";
    grd_skillTooltip[# _ix,_iy] = "Damage Rate: !%";

#endregion