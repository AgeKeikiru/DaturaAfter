/// @description Insert description here
// You can write your code in this editor

event_inherited();

ds_grid_resize(grd_skills,2,3);

name = "U.Aile";
desc = "Aile only. Unique class chip focused on general buffs with a special support skill.";

#region //tier 1

    var
    _ix = 0,
    _iy = 0;

    grd_skillName[# _ix,_iy] = "EVA+";
    grd_skillDesc[# _ix,_iy] = "Increase Evasion.";
    grd_skillTooltip[# _ix,_iy] = "EVA: +!";
    grd_skillRate[# _ix,_iy] = stat_fineStatRate;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "ACC+";
    grd_skillDesc[# _ix,_iy] = "Increase Accuracy.";
    grd_skillTooltip[# _ix,_iy] = "ACC: +!";
    grd_skillRate[# _ix,_iy] = stat_fineStatRate;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "S-DEF+";
    grd_skillDesc[# _ix,_iy] = "Increase Spell Defense.";
    grd_skillTooltip[# _ix,_iy] = "S-DEF: +!";

#endregion

#region //tier 2

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Meek Aura";
    grd_skillDesc[# _ix,_iy] = "Prevent aggro from being raised above a certain level.";
    grd_skillTooltip[# _ix,_iy] = "Max Aggro: !";
    grd_skillRate[# _ix,_iy] = -1;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Sword Love";
    grd_skillDesc[# _ix,_iy] = "Increase damage dealt with Swords.";
    grd_skillTooltip[# _ix,_iy] = "SWD Damage: +!";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Aile's Teamwork";
    grd_skillDesc[# _ix,_iy] = "When attacking with an ally simultaneously, restore a percentage of each party member's EN.";
    grd_skillTooltip[# _ix,_iy] = "EN Restored: !%";
    grd_skillRate[# _ix,_iy] = 2;

#endregion