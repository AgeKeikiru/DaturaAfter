/// @description Insert description here
// You can write your code in this editor

event_inherited();

/*
main skill
Curse Concentrate
debuff/status inflict rate +Lv*0.5%
*/

name = "Evoker";
desc = "Magical girls that have strayed from the teachings of the light. While not evil, Evokers manipulate both light and dark magic with no obligation to help or hurt others.";
cName = "EVOK_" + string(global.cid++);

stat_sf_PenaltyBase = -15;
stat_sf_PenaltyRate = 2;
stat_sf_BoostBase = 10;
stat_sf_BoostRate = 2;

stat_tf_PenaltyBase = -30;
stat_tf_PenaltyRate = 3;
stat_tf_BoostBase = 10;
stat_tf_BoostRate = 2;

stat_flightAggro = 1;

#region //tier 1

    var
    _ix = 0,
    _iy = 0;

    grd_skillName[# _ix,_iy] = "S-DEF+";
    grd_skillDesc[# _ix,_iy] = "Increase Spell Defense.";
    grd_skillTooltip[# _ix,_iy] = "S-DEF: +!";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "SPD+";
    grd_skillDesc[# _ix,_iy] = "Increase Speed.";
    grd_skillTooltip[# _ix,_iy] = "SPD: +!";
    grd_skillRate[# _ix,_iy] = stat_fineStatRate;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "S-ATK+";
    grd_skillDesc[# _ix,_iy] = "Increase Spell Attack.";
    grd_skillTooltip[# _ix,_iy] = "S-ATK: +!";

#endregion

#region //tier 2

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Magical Redeemer";
    grd_skillDesc[# _ix,_iy] = "Stance Act. While active, killing an enemy has a chance of inflicting a random debuff to remaining enemies.";
    grd_skillTooltip[# _ix,_iy] = "Proc Rate: !%";
    grd_skillRate[# _ix,_iy] = 18;
    grd_skillAct[# _ix,_iy] = noone;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Dark Love";
    grd_skillDesc[# _ix,_iy] = "Increase damage dealt with Dark Element.";
    grd_skillTooltip[# _ix,_iy] = "DRK Damage: +!";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Magical Destroyer";
    grd_skillDesc[# _ix,_iy] = "Stance Act. While active, killing an enemy has a chance of gaining a random buff. Buff fades when healed or when Stance is changed.";
    grd_skillTooltip[# _ix,_iy] = "Proc Rate: !%";
    grd_skillRate[# _ix,_iy] = 20;

#endregion

#region //tier 3

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Stealth Flight";
    grd_skillDesc[# _ix,_iy] = "Focus on moving quickly and staying out of sight rather than defending yourself. Trades Defense for Speed and reduced aggro.";
    grd_skillTooltip[# _ix,_iy] = "M/F/S-DEF: -!\nSPD: +@\nAggro: -#";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Light Love";
    grd_skillDesc[# _ix,_iy] = "Increase damage dealt with Light Element.";
    grd_skillTooltip[# _ix,_iy] = "LGT Damage: +!";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Trick Flight";
    grd_skillDesc[# _ix,_iy] = "Focus on drawing and dodging fire rather than fighting. Trades Accuracy for Evasion and increased aggro.";
    grd_skillTooltip[# _ix,_iy] = "ACC: -!\nEVA: +@\nAggro: +#";

#endregion

#region //tier 4

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Redeemer's Brand";
    grd_skillDesc[# _ix,_iy] = "Triggers if user takes a fatal blow with [Magical Redeemer] active. Survive with 1hp, shed all buffs/debuffs/status, and inflict 2 random status effects on all enemies. Puts [Magical Redeemer] on a drastic cooldown.";
    grd_skillTooltip[# _ix,_iy] = "CD Penalty: !";
    grd_skillRate[# _ix,_iy] = 20000;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Debuff Love";
    grd_skillDesc[# _ix,_iy] = "Increase duration of debuffs/status inflicted on enemies.";
    grd_skillTooltip[# _ix,_iy] = "Duration Boost: !";
    grd_skillRate[# _ix,_iy] = 2000;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Destroyer's Brand";
    grd_skillDesc[# _ix,_iy] = "X Act, only charges while [Magical Destroyer] is active. Ignore enemy defenses for a short time.";
    grd_skillTooltip[# _ix,_iy] = "Duration: !";
    grd_skillRate[# _ix,_iy] = 3000;

#endregion