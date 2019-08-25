/// @description Insert description here
// You can write your code in this editor

event_inherited();

/*
main skill
Marksman
increase critical damage by Lv*0.5%
*/

name = "Agent";
desc = "Specially trained gunslingers that come prepared to deal with any threat. Agents turn enemies into sitting ducks to line up the perfect kill shot.";
cName = "AGNT_" + string(global.cid++);

ms_name = "Marksman";
ms_desc = "Critical hit damage +Lv*0.5%";
ms_icon = spr_icon_critAtkUp;

ss_name = "FIR Res+ (s)";
ss_desc = "Slightly decrease damage from Fire element.";
ss_icon = spr_icon_firRes;
ss_toolTip = "FIR Res: !";
ss_rate = .5;

stat_bombPwr_rate = 10;

fsCooldown = 0;

wm_fMod = 1.5;

stat_cap_base = .5;
stat_cap_rate = .1;

#region //tier 1

    var
    _ix = 0,
    _iy = 0;

    grd_skillName[# _ix,_iy] = "F-ATK+";
    grd_skillDesc[# _ix,_iy] = "Increase base Firearm Attack.";
    grd_skillTooltip[# _ix,_iy] = "F-ATK: !";
    grd_skillIcon[# _ix,_iy] = spr_icon_fAtkUp;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "ACC+";
    grd_skillDesc[# _ix,_iy] = "Increase base Accuracy.";
    grd_skillTooltip[# _ix,_iy] = "ACC: !";
    grd_skillRate[# _ix,_iy] = stat_fineStatRate;
    grd_skillIcon[# _ix,_iy] = spr_icon_accUp;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "F-DEF+";
    grd_skillDesc[# _ix,_iy] = "Increase base Firearm Defense.";
    grd_skillTooltip[# _ix,_iy] = "F-DEF: !";
    grd_skillIcon[# _ix,_iy] = spr_icon_fDefUp;

#endregion

#region //tier 2

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Flash Grenade";
    grd_skillDesc[# _ix,_iy] = "A weak wide range Firearm attack that stuns and has a low chance to blind.";
    grd_skillTooltip[# _ix,_iy] = "Power: !\nBlind Chance: @%";
    grd_skillRate[# _ix,_iy] = .05;
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_agnt_fGrenade);
    grd_skillIcon[# _ix,_iy] = spr_icon_grenadeLgt;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Hide"; //stance
    grd_skillDesc[# _ix,_iy] = "Reduce aggro and increase crit rate. Effect ends when hit.";
    grd_skillTooltip[# _ix,_iy] = "Aggro: !";
    grd_skillIcon[# _ix,_iy] = spr_icon_stance;
    grd_skillRate[# _ix,_iy] = -1;
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_agnt_hide);
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Snare Trap"; //stance
    grd_skillDesc[# _ix,_iy] = "When attacked, trigger a trap that slows the attacker to a halt.";
    grd_skillTooltip[# _ix,_iy] = "Effect Duration: !sec";
    grd_skillRate[# _ix,_iy] = 2;
    grd_skillIcon[# _ix,_iy] = spr_icon_stance;
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_agnt_sTrap);

#endregion

#region //tier 3

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Nova Bomb";
    grd_skillDesc[# _ix,_iy] = "A weak wide range Firearm attack that reduces enemy ATK and has a moderate chance to poison.";
    grd_skillTooltip[# _ix,_iy] = "Power: !\nPoison Chance: @%";
    grd_skillRate[# _ix,_iy] = .1;
    grd_skillIcon[# _ix,_iy] = spr_icon_grenadeDrk;
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_agnt_nGrenade);
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Analyze"; //agile
    grd_skillDesc[# _ix,_iy] = "Relay an enemy's patterns to allies, reducing their EVA for a while.";
    grd_skillTooltip[# _ix,_iy] = "Duration: !sec";
    grd_skillRate[# _ix,_iy] = 4;
    grd_skillIcon[# _ix,_iy] = spr_icon_enemyEvaDn;
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_agnt_analyze);
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Blast Trap"; //stance
    grd_skillDesc[# _ix,_iy] = "When attacked, trigger a trap that deals Fire damage to all enemies, has a very high chance to burn.";
    grd_skillTooltip[# _ix,_iy] = "Burn Chance: !%";
    grd_skillRate[# _ix,_iy] = .2;
    grd_skillIcon[# _ix,_iy] = spr_icon_stance;
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_agnt_bTrap);

#endregion

#region //tier 4

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Fire Support";
    grd_skillDesc[# _ix,_iy] = "While <Hide> is active, allied attacks have a chance of automatically triggering an equipped Firearm weapon chip.";
    grd_skillTooltip[# _ix,_iy] = "Proc Rate: !%";
    grd_skillRate[# _ix,_iy] = .1;
    grd_skillIcon[# _ix,_iy] = spr_icon_stanceAim;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Weak Mark"; //agile
    grd_skillDesc[# _ix,_iy] = "Weak Firearm attack that reduces defenses on hit. Has a stronger effect on F-DEF.";
    grd_skillTooltip[# _ix,_iy] = "F-DEF: !%\nM/S-DEF: @%";
    grd_skillRate[# _ix,_iy] = -.06;
    grd_skillIcon[# _ix,_iy] = spr_icon_enemyDefDn;
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_agnt_wMark);
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Capture"; //x act
    grd_skillDesc[# _ix,_iy] = "Charge via activating traps - Deal severe Firearm damage to a target. If this attack kills, a large amount of loot is collected.";
    grd_skillTooltip[# _ix,_iy] = "Accuracy: !"; //50-100
    grd_skillIcon[# _ix,_iy] = spr_icon_trap;
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_agnt_capture);

#endregion