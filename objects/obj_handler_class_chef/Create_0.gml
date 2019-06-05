/// @description Insert description here
// You can write your code in this editor

event_inherited();

/*
main skill
Ele Res Mastery
increase all elemental resistances by Lv*0.5
*/

name = "Chef";
desc = "Hearty adventurers that feed enemies and allies alike. An unorthodox support class, Chefs use the unique pan and sling weapons with ingredient skills for various effects.";
cName = "CHEF_" + string(global.cid++);

/*
skills

[HP+]
[Kitchen Kit] Stance act - stores ingredients to be used alongside Pan/Sling weapons
[Firm Rice] Pan: adds healing effect / Sling: increases damage dealt

[Blast Pepper] Pan: adds ATK+ effect / Sling: adds Burn effect
[Super Flour] Pan/Sling: adds wide-range property
[Winter Green] Pan: adds DEF+ effect / Sling: adds Slow effect

[Focuspice] Pan: adds ACC+ effect / Sling: adds Silence effect
[Double Gum] Pan/Sling: increases hit count by 1
[Citruswift] Pan: adds EVA+ effect / Sling: adds Paralyze effect

[Brightbroth] Pan: adds SPD+ effect / Sling: adds Blind effect
[Taste Test] user gains a weakened effect of their ingredients without consuming them
[Shadestock] Pan: adds EN recovery effect / Sling: adds Poison effect
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