/// @description Insert description here
// You can write your code in this editor

event_inherited();

/*
main skill
Stage Presence+
decrease hype decay by Lv*0.5%
*/

name = "Idol";
desc = "Charismatic performers that make a show out of every battle. Focused on support, Idols use flashy techniques and hype to boost the abilities of their allies.";
cName = "IDOL_" + string(global.cid++);

/*
skills

[EVA+]
[Hype Meter] stance act - generate hype by attacking to use special actions, lowers over time
[MISC+]

[Hyper Pickup] 100 hype - cure an ally's ailments/debuffs
[Hype Boost Teamwork] increase hype gain when attacking alongside an ally
[Hyper Pep Talk] 50+ hype - heal an ally, heal based on how much hype was used

[Hyper Cheer] 50+ hype - spend hype to boost an ally's stats, duration based on how much hype was used
[Hype Boost Adrenaline] slowly gain hype while HP is below a certain amount
[Hyper One-More] 200 hype - revive an ally

[Stage Defamation] greatly increases Aggro and Hype
[Hyper Grand Finale] 250 hype - instantly cooldown all party members
[Taunting Strike] a difficult attack to land, but generates large Hype if it hits
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