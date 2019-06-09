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

stat_sf_penaltyBase = -.15;
stat_sf_penaltyRate = .02;
stat_sf_boostBase = 1;
stat_sf_boostRate = 1;

stat_tf_penaltyBase = -.3;
stat_tf_penaltyRate = .03;
stat_tf_boostBase = .1;
stat_tf_boostRate = .02;

stat_flightAggro = 1;

stat_rBrand_base = room_speed * 10000;
stat_rBrand_rate = stat_rBrand_base * -.1;

stat_dbrand_rate = 3;

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
    grd_skillRate[# _ix,_iy] = .16;
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_evok_mRdmr);
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Dark Love";
    grd_skillDesc[# _ix,_iy] = "Increase damage dealt with Dark Element.";
    grd_skillTooltip[# _ix,_iy] = "DRK Damage: +!%";
    grd_skillRate[# _ix,_iy] = .04;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Magical Destroyer";
    grd_skillDesc[# _ix,_iy] = "Stance Act. While active, killing an enemy has a chance of gaining a random buff (max stack 20). Buff fades when healed or when Stance is changed.";
    grd_skillTooltip[# _ix,_iy] = "Proc Rate: !%";
    grd_skillRate[# _ix,_iy] = .20;
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_evok_mDstr);

#endregion

#region //tier 3

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Stealth Flight";
    grd_skillDesc[# _ix,_iy] = "Focus on moving quickly and staying out of sight rather than defending yourself. Trades Defense for Speed and reduced aggro.";
    grd_skillTooltip[# _ix,_iy] = "M/F/S-DEF: -!%\nSPD: +@%\nAggro: -#";
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_evok_sFlight);
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Light Love";
    grd_skillDesc[# _ix,_iy] = "Increase damage dealt with Light Element.";
    grd_skillTooltip[# _ix,_iy] = "LGT Damage: +!%";
    grd_skillRate[# _ix,_iy] = .04;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Trick Flight";
    grd_skillDesc[# _ix,_iy] = "Focus on drawing and dodging fire rather than fighting. Trades Accuracy for Evasion and increased aggro.";
    grd_skillTooltip[# _ix,_iy] = "ACC: -!%\nEVA: +@%\nAggro: +#";
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_evok_tFlight);

#endregion

#region //tier 4

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Redeemer's Brand";
    grd_skillDesc[# _ix,_iy] = "Upon fatal blow with [Magical Redeemer] active. Endure, shed all effects, and inflict 2 random status effects on all enemies. Puts [Magical Redeemer] on a drastic cooldown.";
    grd_skillTooltip[# _ix,_iy] = "CD Penalty: !";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Debuff Love";
    grd_skillDesc[# _ix,_iy] = "Increase duration of debuffs/status inflicted on enemies.";
    grd_skillTooltip[# _ix,_iy] = "Duration Boost: ! sec";
    grd_skillRate[# _ix,_iy] = 2;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Destroyer's Brand";
    grd_skillDesc[# _ix,_iy] = "X Act - charge via damage with [Magical Destroyer] active. Ignore enemy defenses for a short time.";
    grd_skillTooltip[# _ix,_iy] = "Duration: ! sec";
    grd_skillRate[# _ix,_iy] = 7;
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_evok_dBrand);

#endregion

scr_cEvent(id,EVENT_CLASS_SKILLREFRESH);