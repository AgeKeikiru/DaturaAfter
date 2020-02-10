/// @description Insert description here
// You can write your code in this editor

event_inherited();

ds_grid_resize(grd_skills,2,3);

name = "U.Altai";
desc = "Altai only. Unique class chip focused on support capability with some offensive skills.";

#region //tier 1

    var
    _ix = 0,
    _iy = 0;

    grd_skillName[# _ix,_iy] = "HP+";
    grd_skillDesc[# _ix,_iy] = "Increase base HP.";
    grd_skillTooltip[# _ix,_iy] = "HP: !";
    grd_skillRate[# _ix,_iy] = 100;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "S-DEF+";
    grd_skillDesc[# _ix,_iy] = "Increase base Spell Defense.";
    grd_skillTooltip[# _ix,_iy] = "S-DEF: !";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "EN+";
    grd_skillDesc[# _ix,_iy] = "Increase base EN.";
    grd_skillTooltip[# _ix,_iy] = "EN: !";
    grd_skillRate[# _ix,_iy] = 100;

#endregion

#region //tier 2

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Adrenaline REC";//
    grd_skillDesc[# _ix,_iy] = "Boost EN Recovery while HP is under 30%.";
    grd_skillTooltip[# _ix,_iy] = "REC: !%";
    grd_skillRate[# _ix,_iy] = 0.1;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Dual Wield S";//
    grd_skillDesc[# _ix,_iy] = "Double hit count of spell weapons, at reduced damage.";
    grd_skillTooltip[# _ix,_iy] = "Damage Rate: !%";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Wide Heal";//
    grd_skillDesc[# _ix,_iy] = "Heals have a chance of affecting the entire party.";
    grd_skillTooltip[# _ix,_iy] = "Proc Rate: !%";

#endregion