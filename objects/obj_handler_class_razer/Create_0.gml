/// @description Insert description here
// You can write your code in this editor

event_inherited();

/*
main skill
Vengeance
increase damage dealt when HP is below (30 + Lv*0.5)%
*/

name = "Razer";
desc = "Brazen warriors that see violence as its own reward. Dealing in raw damage, Razers often suffer recoil while pushing themselves to the limit to get the edge in combat.";
cName = "RAZE_" + string(global.cid++);

/*
skills

[SPD+]
[TRI-ATK+]
[Ele Love] increase damage dealt with all elements

[Kneecap] melee attack that aims for the target's legs, high chance of decreasing target SPD on hit
[M-ATK+]
[Stressor Blow] a high power melee attack that also damages the user slightly

[Reaper Edge] a secret melee technique that vastly increases in power against foes with status effects/debuffs
[Adapt Dodge] stance act - increase EVA every time user takes a hit, resets on dodge
[Dire Blow] a melee desperation move that drains half the user's remaining hp, deals damage based on how much HP is drained

[Accelerator Edge] a melee secret technique that, while difficult to land, uses momentum to greatly increase SPD for a brief time
[Bloodlust] stance act - slowly drain the user's HP to gain a damage buff that increases as damage is dealt
[Recompense XX] X act - charges by taking damage. deal severe melee damage to all enemies, slight chance of instakill but leaves the user exhausted
*/

#region //tier 1

    var
    _ix = 0,
    _iy = 0;

    //grd_skillName[# _ix,_iy] = "LGT Res+";
    //grd_skillDesc[# _ix,_iy] = "Decrease damage taken from Light Element.";
    //grd_skillTooltip[# _ix,_iy] = "LGT Res: +!";
    
    _iy++;
    
    //grd_skillName[# _ix,_iy] = "TRI-DEF+";
    //grd_skillDesc[# _ix,_iy] = "Increase Melee/Firearm/Spell Defense.";
    //grd_skillTooltip[# _ix,_iy] = "M/F/S-Def: +!";
    
    _iy++;
    
    //grd_skillName[# _ix,_iy] = "Light Love";
    //grd_skillDesc[# _ix,_iy] = "Increase damage dealt with Light Element.";
    //grd_skillTooltip[# _ix,_iy] = "LGT Damage: +!";

#endregion

#region //tier 2

    _ix++;
    _iy = 0;

    //grd_skillName[# _ix,_iy] = "Angelic Step";
    //grd_skillDesc[# _ix,_iy] = "Costs 50 Angelite. Negate 1 attack, briefly increase EVA after negation.";
    //grd_skillTooltip[# _ix,_iy] = "Cooldown: !";
    //grd_skillRate[# _ix,_iy] = 3000;
    
    _iy++;
    
    //grd_skillName[# _ix,_iy] = "Angelite";
    //grd_skillDesc[# _ix,_iy] = "Stance Act. Collect holy energy during battle to use special skills.";
    //grd_skillTooltip[# _ix,_iy] = "Max Angelite: !";
    //grd_skillRate[# _ix,_iy] = 50;
    
    _iy++;
    
    //grd_skillName[# _ix,_iy] = "Angelic Dash";
    //grd_skillDesc[# _ix,_iy] = "Costs 50 Angelite. Reset all active cooldowns.";
    //grd_skillTooltip[# _ix,_iy] = "Cooldown: !";
    //grd_skillRate[# _ix,_iy] = 3000;

#endregion

#region //tier 3

    _ix++;
    _iy = 0;

    //grd_skillName[# _ix,_iy] = "Angelic Blessing";
    //grd_skillDesc[# _ix,_iy] = "Costs 150 Angelite. Fully restore ally allies' EN and briefly boost their stats.";
    //grd_skillTooltip[# _ix,_iy] = "Duration: !";
    //grd_skillRate[# _ix,_iy] = 3000;
    
    _iy++;
    
    //grd_skillName[# _ix,_iy] = "Angelite Boost TRI";
    //grd_skillDesc[# _ix,_iy] = "Increase Angelite gain when alternating between Melee/Firearm/Spell attacks.";
    //grd_skillTooltip[# _ix,_iy] = "Angelite Gain: +!%";
    //grd_skillRate[# _ix,_iy] = 50;
    
    _iy++;
    
    //grd_skillName[# _ix,_iy] = "Angelic Smite";
    //grd_skillDesc[# _ix,_iy] = "Costs 100 Angelite. Delay the act time of all enemies and briefly reduce their Speed.";
    //grd_skillTooltip[# _ix,_iy] = "Duration: !";
    //grd_skillRate[# _ix,_iy] = 3000;

#endregion

#region //tier 4

    _ix++;
    _iy = 0;

    //grd_skillName[# _ix,_iy] = "Desynch";
    //grd_skillDesc[# _ix,_iy] = "Only usable when Angelite is full. Drain Angelite to shift into the Angelic Plane, becoming fully immune to damage while active.";
    //grd_skillTooltip[# _ix,_iy] = "Drain Rate: !";
    //grd_skillRate[# _ix,_iy] = 1;
    
    _iy++;
    
    //grd_skillName[# _ix,_iy] = "Angelite Boost LGT";
    //grd_skillDesc[# _ix,_iy] = "Increase Angelite gain when dealing Light damage.";
    //grd_skillTooltip[# _ix,_iy] = "Angelite Gain: +!%";
    //grd_skillRate[# _ix,_iy] = 50;
    
    _iy++;
    
    //grd_skillName[# _ix,_iy] = "Heaven's Rend";
    //grd_skillDesc[# _ix,_iy] = "Costs 250 Angelite. Deal damage to each enemy equal to half their remaining HP (up to a maximum value) and inflict a long lasting Blind.";
    //grd_skillTooltip[# _ix,_iy] = "Maximum Damage: !";
    //grd_skillRate[# _ix,_iy] = 1000;

#endregion