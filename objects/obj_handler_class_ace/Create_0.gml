/// @description Insert description here
// You can write your code in this editor

event_inherited();

name = "Ace";
desc = "Stylish masters of every fighting discipline. A technical DPS, Aces not only are capable of effectively dealing any type of damage, they thrive and are most dangerous when alternating between Melee, Firearm, and Spell attacks.";
cName = "ACE_" + string(global.cid++);

ms_name = "Weaponmaster";
ms_desc = "[Stance] +Lv*0.5% damage bonus when alternating between M/F/S damage, but take extra damage from attacks matching last type used.";
ms_icon = spr_icon_stance;

ss_name = "EN+ (s)";
ss_desc = "Slightly increase base EN.";
ss_icon = spr_icon_enUp;
ss_toolTip = "EN: !";
ss_rate = 10;

stat_ht_base = -.55;
stat_ht_rate = .05;

stat_xcd_base = 30000;
stat_fl_base = stat_xcd_base * 1.5;

#region //tier 1

    var
    _ix = 0,
    _iy = 0;

    grd_skillName[# _ix,_iy] = "M-ATK+";
    grd_skillDesc[# _ix,_iy] = "Increase base Melee Attack.";
    grd_skillTooltip[# _ix,_iy] = "M-ATK: +!";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "F-ATK+";
    grd_skillDesc[# _ix,_iy] = "Increase base Firearm Attack.";
    grd_skillTooltip[# _ix,_iy] = "F-ATK: +!";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "S-ATK+";
    grd_skillDesc[# _ix,_iy] = "Increase base Spell Attack.";
    grd_skillTooltip[# _ix,_iy] = "S-ATK: +!";

#endregion

#region //tier 2

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Swords Dance";
    grd_skillDesc[# _ix,_iy] = "On switch to <Weaponmaster:M>, briefly boost party ATK.";
    grd_skillTooltip[# _ix,_iy] = "M/F/S-ATK: !%";
    grd_skillRate[# _ix,_iy] = .04;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Stratos";
    grd_skillDesc[# _ix,_iy] = "With <Weaponmaster:F> active, gain a boost to SPD.";
    grd_skillTooltip[# _ix,_iy] = "SPD: !%";
    grd_skillRate[# _ix,_iy] = .2;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Mana Draw";
    grd_skillDesc[# _ix,_iy] = "With <Weaponmaster:S> active, gain a boost to passive EN recovery.";
    grd_skillTooltip[# _ix,_iy] = "EN Rec: !%";
    grd_skillRate[# _ix,_iy] = .2;

#endregion

#region //tier 3

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Riposte";
    grd_skillDesc[# _ix,_iy] = "With <Weaponmaster:Any> active, being attacked has a low chance to automatically trigger an equipped Melee weapon chip.";
    grd_skillTooltip[# _ix,_iy] = "Proc Rate: !%";
    grd_skillRate[# _ix,_iy] = .04;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Hair Trigger";
    grd_skillDesc[# _ix,_iy] = "With <Weaponmaster:Any> active, Firearm weapon chips become [Agile] but suffer a damage/accuracy penalty.";
    grd_skillTooltip[# _ix,_iy] = "PWR/ACC: !%";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Fireworks";
    grd_skillDesc[# _ix,_iy] = "With <Weaponmaster:Any> active, Spell weapon chips gain stun chance and briefly increase aggro on hit.";
    grd_skillTooltip[# _ix,_iy] = "Stun Chance: !%";
    grd_skillRate[# _ix,_iy] = .06;

#endregion

#region //tier 4

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Cross Finish";
    grd_skillDesc[# _ix,_iy] = "Charges while <Weaponmaster:M> is active - Unleash an intense flurry of melee strikes against all enemies at random. Resets cooldowns of other Ace X-Acts on use.";
    grd_skillTooltip[# _ix,_iy] = "Power: !";
    grd_skillRate[# _ix,_iy] = 10;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Full Lock";
    grd_skillDesc[# _ix,_iy] = "Charges while <Weaponmaster:F> is active - Attacks from the user are guaranteed to hit for the rest of the battle. Resets cooldowns of other Ace X-Acts on use.";
    grd_skillTooltip[# _ix,_iy] = "";
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Dead Touch";
    grd_skillDesc[# _ix,_iy] = "Charges while <Weaponmaster:S> is active - Inflict 3 long lasting random status effects on all enemies. Resets cooldowns of other Ace X-Acts on use.";
    grd_skillTooltip[# _ix,_iy] = "Duration: !";
    grd_skillRate[# _ix,_iy] = 10;

#endregion