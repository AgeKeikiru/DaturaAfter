/// @description Insert description here
// You can write your code in this editor

event_inherited();

name = "Newtype";
desc = "Strategic commanders that utilize Orbital bits to handle any combat scenario. Highly flexible, Newtypes can fill any role in a party but require much attention to use effectively and are not reccomended for newer players.";
cName = "NEWT_" + string(global.cid++);

/*
skills

main: Orbital Efficiency - Decrease EN cost of Orbital skills by Lv*0.5%
sub: ACC+

[F-ATK+]
[EN+]
[F-DEF+]

[Assault Orbital] Summon Orbitals that coordinate attacks alongside your own
/[Hide] stance act - reduce aggro, increase crit rate, effect ends when hit
/[Snare Trap] stance act - when attacked, trigger a trap that slows the attacker to a halt

/[Spellshot] a unique firearm attack that deals damage vs target's S-DEF
/[Analyze] relay an enemy's information to the party, greatly reducing its EVA for a time
/[Blast Trap] stance act - when attacked, trigger a trap that deals fire damage to all enemies, has a moderate chance to Burn

/[Fire Support] while Hide is active, allied attacks have a chance of instantly triggering a user's equipped firearm-type weapon
/[Weak Mark] quick firearm attack that reduces the target's defenses on hit, has a stronger effect on F-DEF
/[Capture] X act - charges when traps are activated. deal severe firearm damage to a target - if this attack kills, a large amount of loot is collected
*/

#region //tier 1

    var
    _ix = 0,
    _iy = 0;

    grd_skillName[# _ix,_iy] = "F-ATK+";
    grd_skillDesc[# _ix,_iy] = "Increase base Firearm Attack.";
    grd_skillTooltip[# _ix,_iy] = "F-ATK: +!";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "ELC Res+";
    grd_skillDesc[# _ix,_iy] = "Decrease damage taken from Elec Element.";
    grd_skillTooltip[# _ix,_iy] = "ELC Res: +!";
    grd_skillRate[# _ix,_iy] = 100;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "F-DEF+";
    grd_skillDesc[# _ix,_iy] = "Increase base Firearm Defense.";
    grd_skillTooltip[# _ix,_iy] = "F-DEF: +!";

#endregion

#region //tier 2

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Assault Orbital";
    grd_skillDesc[# _ix,_iy] = "Summon Orbitals that coordinate attacks alongside your own.";
    grd_skillTooltip[# _ix,_iy] = "Power: !";
    grd_skillRate[# _ix,_iy] = 10;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Support Orbital";
    grd_skillDesc[# _ix,_iy] = "Summon Orbitals that gradually heal you and hasten recovery from status ailments.";
    grd_skillTooltip[# _ix,_iy] = "Heal Rate: !/sec";
    grd_skillRate[# _ix,_iy] = .5;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Guard Orbital";
    grd_skillDesc[# _ix,_iy] = "Summon Orbitals that deflect a portion of incoming damage.";
    grd_skillTooltip[# _ix,_iy] = "Effect: !%";
    grd_skillRate[# _ix,_iy] = .06;

#endregion

#region //tier 3

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Quick Orb";
    grd_skillDesc[# _ix,_iy] = "Reduce cooldown of Orbital skills.";
    grd_skillTooltip[# _ix,_iy] = "Cooldown: -!%";
    grd_skillRate[# _ix,_iy] = .1;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Armor Orb";
    grd_skillDesc[# _ix,_iy] = "Increase durability of Orbitals.";
    grd_skillTooltip[# _ix,_iy] = "HP: +!%";
    grd_skillRate[# _ix,_iy] = .1;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Taunt Orb";
    grd_skillDesc[# _ix,_iy] = "Orbitals draw attention to their summoner.";
    grd_skillTooltip[# _ix,_iy] = "Aggro: +!";
    grd_skillRate[# _ix,_iy] = 1;

#endregion

#region //tier 4

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Swarm Orb";
    grd_skillDesc[# _ix,_iy] = "[X Act] Charge via keeping Orbitals alive - deal severe damage and paralysis to enemies at random.";
    grd_skillTooltip[# _ix,_iy] = "Power: !";
    grd_skillRate[# _ix,_iy] = 10;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Purify Orb";
    grd_skillDesc[# _ix,_iy] = "Orbitals have a chance of immediately removing a status ailment inflicted on any party member.";
    grd_skillTooltip[# _ix,_iy] = "Proc Rate: !%";
    grd_skillRate[# _ix,_iy] = .18;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Aegis Orb";
    grd_skillDesc[# _ix,_iy] = "Orbitals have a chance of destroying themselves to negate a fatal blow against any party member. Orbitals cannot be summoned for a while afterwards.";
    grd_skillTooltip[# _ix,_iy] = "Proc Rate: !%";
    grd_skillRate[# _ix,_iy] = .2;

#endregion