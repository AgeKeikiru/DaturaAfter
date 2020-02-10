/// @description Insert description here
// You can write your code in this editor

event_inherited();

ds_grid_resize(grd_skills,2,3);

name = "U.Jack";
desc = "Jack only. Unique class chip focused on utilizing fire with a special Draker skill.";

#region //tier 1

    var
    _ix = 0,
    _iy = 0;

    grd_skillName[# _ix,_iy] = "EN+";
    grd_skillDesc[# _ix,_iy] = "Increase base EN.";
    grd_skillTooltip[# _ix,_iy] = "EN: !";
    grd_skillRate[# _ix,_iy] = 100;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "FIR RES+";
    grd_skillDesc[# _ix,_iy] = "Increase base Fire Resistance.";
    grd_skillTooltip[# _ix,_iy] = "FIR Res: !";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "S-ATK+";
    grd_skillDesc[# _ix,_iy] = "Increase base Spell Attack.";
    grd_skillTooltip[# _ix,_iy] = "S-ATK: !";

#endregion

#region //tier 2

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Flawless M-ATK";//
    grd_skillDesc[# _ix,_iy] = "Boost Melee Attack while HP is Above 80%.";
    grd_skillTooltip[# _ix,_iy] = "M-ATK: !";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Adrenaline Drake";//
    grd_skillDesc[# _ix,_iy] = "<Draco Install> duration increased while HP is below 30%.";
    grd_skillTooltip[# _ix,_iy] = "Duration Boost: !%";
    grd_skillRate[# _ix,_iy] = 0.2;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Burn Imbue";//
    grd_skillDesc[# _ix,_iy] = "All weapon attacks have a chance of inflicting Burn.";
    grd_skillTooltip[# _ix,_iy] = "Proc Rate: !%";

#endregion