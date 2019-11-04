/// @description Insert description here
// You can write your code in this editor

event_inherited();

name = "Newtype";
desc = "Strategic commanders that utilize Orbital bits to handle any combat scenario. Highly flexible, Newtypes can fill any role in a party but require much attention to use effectively and are not reccomended for newer players.";
cName = "NEWT_" + string(global.cid++);

ms_name = "Orbital Efficiency";
ms_desc = "Decrease EN cost of Orbital skills by Lv*0.5%.";
ms_icon = spr_icon_stanceUp;

ss_name = "ACC+ (s)";
ss_desc = "Slightly increase base Accuracy.";
ss_icon = spr_icon_accUp;
ss_toolTip = "ACC: !";

/*
skills

main: Orbital Efficiency - Decrease EN cost of Orbital skills by Lv*0.5%
sub: ACC+
*/

#region //tier 1

    var
    _ix = 0,
    _iy = 0;

    grd_skillName[# _ix,_iy] = "F-ATK+";
    grd_skillDesc[# _ix,_iy] = "Increase base Firearm Attack.";
    grd_skillTooltip[# _ix,_iy] = "F-ATK: !";
    grd_skillIcon[# _ix,_iy] = spr_icon_fAtkUp;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "ELC Res+";
    grd_skillDesc[# _ix,_iy] = "Decrease damage taken from Elec Element.";
    grd_skillTooltip[# _ix,_iy] = "ELC Res: !";
    grd_skillRate[# _ix,_iy] = 10;
    grd_skillIcon[# _ix,_iy] = spr_icon_elcRes;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "F-DEF+";
    grd_skillDesc[# _ix,_iy] = "Increase base Firearm Defense.";
    grd_skillTooltip[# _ix,_iy] = "F-DEF: !";
    grd_skillIcon[# _ix,_iy] = spr_icon_fDefUp;

#endregion

#region //tier 2

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Assault Orbital";
    grd_skillDesc[# _ix,_iy] = "Summon Orbitals that coordinate attacks alongside your own.";
    grd_skillTooltip[# _ix,_iy] = "Power: !";
    grd_skillRate[# _ix,_iy] = 40;
    grd_skillAct[# _ix,_iy] = create(obj_handler_act_newt_orb_assault);
    grd_skillIcon[# _ix,_iy] = spr_icon_stance;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Support Orbital";
    grd_skillDesc[# _ix,_iy] = "Summon Orbitals that gradually heal you and hasten recovery from status ailments.";
    grd_skillTooltip[# _ix,_iy] = "Heal Rate: !/sec";
    grd_skillRate[# _ix,_iy] = 4;
    grd_skillAct[# _ix,_iy] = create(obj_handler_act_newt_orb_support);
    grd_skillIcon[# _ix,_iy] = spr_icon_stance;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Guard Orbital";
    grd_skillDesc[# _ix,_iy] = "Summon Orbitals that deflect a portion of incoming damage.";
    grd_skillTooltip[# _ix,_iy] = "Effect: !%";
    grd_skillRate[# _ix,_iy] = .06;
    grd_skillAct[# _ix,_iy] = create(obj_handler_act_newt_orb_guard);
    grd_skillIcon[# _ix,_iy] = spr_icon_stance;

#endregion

#region //tier 3

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Quick Orb";
    grd_skillDesc[# _ix,_iy] = "Reduce cooldown of Orbital skills.";
    grd_skillTooltip[# _ix,_iy] = "Cooldown: !%";
    grd_skillRate[# _ix,_iy] = -.1;
    grd_skillIcon[# _ix,_iy] = spr_icon_stanceUp;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Armor Orb";
    grd_skillDesc[# _ix,_iy] = "Increase durability of Orbitals.";
    grd_skillTooltip[# _ix,_iy] = "HP: !%";
    grd_skillRate[# _ix,_iy] = .1;
    grd_skillIcon[# _ix,_iy] = spr_icon_stanceUp;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Taunt Orb";
    grd_skillDesc[# _ix,_iy] = "Orbitals draw attention to their summoner.";
    grd_skillTooltip[# _ix,_iy] = "Aggro: !";
    grd_skillRate[# _ix,_iy] = 1;
    grd_skillIcon[# _ix,_iy] = spr_icon_stanceUp;

#endregion

#region //tier 4

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Swarm Orb";
    grd_skillDesc[# _ix,_iy] = "Charge via keeping Orbitals alive - deal severe damage and paralysis to enemies at random.";
    grd_skillTooltip[# _ix,_iy] = "Power: !";
    grd_skillRate[# _ix,_iy] = 20;
    grd_skillIcon[# _ix,_iy] = spr_icon_stanceBrt;
    grd_skillAct[# _ix,_iy] = create(obj_handler_act_newt_swarm);
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Purify Orb";
    grd_skillDesc[# _ix,_iy] = "Orbitals have a chance of immediately removing a status ailment inflicted on any party member.";
    grd_skillTooltip[# _ix,_iy] = "Proc Rate: !%";
    grd_skillRate[# _ix,_iy] = .18;
    grd_skillIcon[# _ix,_iy] = spr_icon_stanceAilProtect;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Aegis Orb";
    grd_skillDesc[# _ix,_iy] = "Orbitals have a chance of destroying themselves to negate a fatal blow against any party member. Orbitals cannot be summoned for a while afterwards.";
    grd_skillTooltip[# _ix,_iy] = "Proc Rate: !%";
    grd_skillRate[# _ix,_iy] = .2;
    grd_skillIcon[# _ix,_iy] = spr_icon_stanceKillShield;

#endregion