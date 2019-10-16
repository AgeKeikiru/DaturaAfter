/// @description Insert description here
// You can write your code in this editor

event_inherited();

name = "Evoker";
desc = "Magical girls that have strayed from the teachings of the light. While not evil, Evokers manipulate both light and dark magic with no obligation to help or hurt others.";
cName = "EVOK_" + string(global.cid++);

ms_name = "Curse Concentrate";
ms_desc = "Debuff/status inflict rate +Lv*0.5%";
ms_icon = spr_icon_debuffUp;

ss_name = "EVA+ (s)";
ss_desc = "Slightly increase base Evasion.";
ss_icon = spr_icon_evaUp;
ss_toolTip = "EVA: !";
ss_rate = .5;

stat_sf_penaltyBase = -.15;
stat_sf_penaltyRate = .02;
stat_sf_boostBase = 1;
stat_sf_boostRate = 1;

stat_tf_penaltyBase = -.3;
stat_tf_penaltyRate = .03;
stat_tf_boostBase = .1;
stat_tf_boostRate = .02;

stat_flightAggro = 1;

stat_rBrand_base = room_speed * 1000;
stat_rBrand_rate = stat_rBrand_base * -.1;

stat_dbrand_rate = 3;

#region //tier 1

    var
    _ix = 0,
    _iy = 0;

    grd_skillName[# _ix,_iy] = "S-DEF+";
    grd_skillDesc[# _ix,_iy] = "Increase Spell Defense.";
    grd_skillTooltip[# _ix,_iy] = "S-DEF: !";
    grd_skillIcon[# _ix,_iy] = spr_icon_sDefUp;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "SPD+";
    grd_skillDesc[# _ix,_iy] = "Increase Speed.";
    grd_skillTooltip[# _ix,_iy] = "SPD: !";
    grd_skillRate[# _ix,_iy] = stat_fineStatRate;
    grd_skillIcon[# _ix,_iy] = spr_icon_spdUp;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "S-ATK+";
    grd_skillDesc[# _ix,_iy] = "Increase Spell Attack.";
    grd_skillTooltip[# _ix,_iy] = "S-ATK: !";
    grd_skillIcon[# _ix,_iy] = spr_icon_sAtkUp;

#endregion

#region //tier 2

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Magical Redeemer";
    grd_skillDesc[# _ix,_iy] = "While active, killing an enemy has a chance of inflicting a random debuff to remaining enemies.";
    grd_skillTooltip[# _ix,_iy] = "Proc Rate: !%";
    grd_skillRate[# _ix,_iy] = .16;
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_evok_mRdmr);
    grd_skillIcon[# _ix,_iy] = spr_icon_stance;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Dark Love";
    grd_skillDesc[# _ix,_iy] = "Increase damage dealt with Dark Element.";
    grd_skillTooltip[# _ix,_iy] = "DRK Damage: !%";
    grd_skillRate[# _ix,_iy] = .04;
    grd_skillIcon[# _ix,_iy] = spr_icon_drkUp;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Magical Destroyer";
    grd_skillDesc[# _ix,_iy] = "While active, killing an enemy has a chance of gaining a random buff (max stack 20). Buff fades when healed or when Stance is changed.";
    grd_skillTooltip[# _ix,_iy] = "Proc Rate: !%";
    grd_skillRate[# _ix,_iy] = .20;
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_evok_mDstr);
    grd_skillIcon[# _ix,_iy] = spr_icon_stance;

#endregion

#region //tier 3

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Stealth Flight";
    grd_skillDesc[# _ix,_iy] = "Focus on moving quickly and staying out of sight rather than defending yourself. Trades Defense for Speed and reduced aggro.";
    grd_skillTooltip[# _ix,_iy] = "M/F/S-DEF: !%\n      SPD: @%\n    Aggro: #";
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_evok_sFlight);
    grd_skillIcon[# _ix,_iy] = spr_icon_stealthWing;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Light Love";
    grd_skillDesc[# _ix,_iy] = "Increase damage dealt with Light Element.";
    grd_skillTooltip[# _ix,_iy] = "LGT Damage: !%";
    grd_skillRate[# _ix,_iy] = .04;
    grd_skillIcon[# _ix,_iy] = spr_icon_lgtUp;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Trick Flight";
    grd_skillDesc[# _ix,_iy] = "Focus on drawing and dodging fire rather than fighting. Trades Accuracy for Evasion and increased aggro.";
    grd_skillTooltip[# _ix,_iy] = "  ACC: !%\n  EVA: @%\nAggro: #";
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_evok_tFlight);
    grd_skillIcon[# _ix,_iy] = spr_icon_wing;

#endregion

#region //tier 4

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Redeemer's Brand";
    grd_skillDesc[# _ix,_iy] = "[Fatal blow with <Magical Redeemer> active] Endure, shed all effects, and inflict 2 random status effects on all enemies. Puts <Magical Redeemer> on a drastic cooldown.";
    grd_skillTooltip[# _ix,_iy] = "CD Penalty: !";
    grd_skillIcon[# _ix,_iy] = spr_icon_rBrand;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Debuff Love";
    grd_skillDesc[# _ix,_iy] = "Increase duration of debuffs/status inflicted on enemies.";
    grd_skillTooltip[# _ix,_iy] = "Duration Boost: !sec";
    grd_skillRate[# _ix,_iy] = 2;
    grd_skillIcon[# _ix,_iy] = spr_icon_debuffUp;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Destroyer's Brand";
    grd_skillDesc[# _ix,_iy] = "Charge via damage with <Magical Destroyer> active - Ignore enemy defenses for a short time.";
    grd_skillTooltip[# _ix,_iy] = "Duration: !sec";
    grd_skillRate[# _ix,_iy] = 7;
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_evok_dBrand);
    grd_skillIcon[# _ix,_iy] = spr_icon_dBrand;

#endregion

scr_cEvent_id(id,EVENT_CLASS_SKILLREFRESH);