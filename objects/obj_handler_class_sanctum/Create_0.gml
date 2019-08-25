/// @description Insert description here
// You can write your code in this editor

event_inherited();

name = "Sanctum";
desc = "Guardians that are second to none in terms of protecting the party. Pure tanks, Sanctums defend not only from direct damage, but all manner of threatening effects.";
cName = "SNCT_" + string(global.cid++);

ms_name = "Shield Mastery";
ms_desc = "Shield EN Cost -Lv*0.5%";
ms_icon = spr_icon_shdUp;

ss_name = "HP+ (s)";
ss_desc = "Slightly increase base HP.";
ss_icon = spr_icon_hpUp;
ss_toolTip = "HP: !";
ss_rate = 10;

stat_bwDef = .1;

stat_bwAtk_rate = .05;
stat_bwAtk_base = -.6 + -stat_bwAtk_rate;

#region //tier 1

    var
    _ix = 0,
    _iy = 0;

    grd_skillName[# _ix,_iy] = "M-DEF+";
    grd_skillDesc[# _ix,_iy] = "Increase base Melee Defense.";
    grd_skillTooltip[# _ix,_iy] = "M-DEF: !";
    grd_skillIcon[# _ix,_iy] = spr_icon_mDefUp;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "TRI-DEF+";
    grd_skillDesc[# _ix,_iy] = "Increase base Melee/Firearm/Spell Defense.";
    grd_skillTooltip[# _ix,_iy] = "M/F/S-Def: !";
    grd_skillIcon[# _ix,_iy] = spr_icon_triDefUp;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Ele Res+";
	grd_skillDesc[# _ix,_iy] = "Decrease damage taken from all elements.";
	grd_skillTooltip[# _ix,_iy] = "Ele Res: !";
	grd_skillRate[# _ix,_iy] = 2;
	grd_skillIcon[# _ix,_iy] = spr_icon_eleRes;

#endregion

#region //tier 2

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Absorber";
    grd_skillDesc[# _ix,_iy] = "While <Bulwark> is active, taking damage reduces active cooldowns.";
    grd_skillTooltip[# _ix,_iy] = "CD Reduction: !";
    grd_skillRate[# _ix,_iy] = 100;
    grd_skillIcon[# _ix,_iy] = spr_icon_stanceTimerReduceGen;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Bulwark";
    grd_skillDesc[# _ix,_iy] = "Brace against incoming damage, increasing aggro and defense at the cost of attack power.";
    grd_skillTooltip[# _ix,_iy] = "Aggro: !\nM/F/S-DEF: @%\nM/F/S-ATK: #%";
    grd_skillRate[# _ix,_iy] = 1;
    grd_skillIcon[# _ix,_iy] = spr_icon_stance;
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_snct_bulwark);
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Ail Riposte";
    grd_skillDesc[# _ix,_iy] = "While <Bulwark> is active, greatly reduce vulnerability to status ailments by a flat rate.";
    grd_skillTooltip[# _ix,_iy] = "Ailment Chance: !%";
    grd_skillRate[# _ix,_iy] = -.06;
    grd_skillIcon[# _ix,_iy] = spr_icon_stanceAilProtect;

#endregion

#region //tier 3

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Synchronize";
    grd_skillDesc[# _ix,_iy] = "Draw debuffs and ailments from allies unto yourself.";
    grd_skillTooltip[# _ix,_iy] = "";
    grd_skillIcon[# _ix,_iy] = spr_icon_cycle;
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_snct_synch);
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Savior";
    grd_skillDesc[# _ix,_iy] = "While <Bulwark> is active, add a chance to take a fatal blow for a party member. (NOTE: Damage taken will not be adjusted according to user's stats)";
    grd_skillTooltip[# _ix,_iy] = "Proc Rate: !%";
    grd_skillRate[# _ix,_iy] = .1;
    grd_skillIcon[# _ix,_iy] = spr_icon_stanceKillShield;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Veil Off";
    grd_skillDesc[# _ix,_iy] = "Remove all positive and negative effects from yourself, has a chance to stun enemies based on how many effects were removed.";
    grd_skillTooltip[# _ix,_iy] = "Proc Rate: !%";
    grd_skillRate[# _ix,_iy] = .03;
    grd_skillIcon[# _ix,_iy] = spr_icon_shdBash;
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_snct_veilOff);

#endregion

#region //tier 4

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "MEL-NGT";
    grd_skillDesc[# _ix,_iy] = "Only usable while <Bulwark> is active. Briefly negate all Melee damage to the party.";
    grd_skillTooltip[# _ix,_iy] = "Duration: !sec";
    grd_skillRate[# _ix,_iy] = .5;
    grd_skillIcon[# _ix,_iy] = spr_icon_stanceMeleeProtect;
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_snct_ngtM);
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "FRM-NGT";
    grd_skillDesc[# _ix,_iy] = "Only usable while <Bulwark> is active. Briefly negate all Firearm damage to the party.";
    grd_skillTooltip[# _ix,_iy] = "Duration: !sec";
    grd_skillRate[# _ix,_iy] = .5;
    grd_skillIcon[# _ix,_iy] = spr_icon_stanceFirearmProtect;
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_snct_ngtF);
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "SPL-NGT";
    grd_skillDesc[# _ix,_iy] = "Only usable while <Bulwark> is active. Briefly negate all Spell damage to the party.";
    grd_skillTooltip[# _ix,_iy] = "Duration: !sec";
    grd_skillRate[# _ix,_iy] = .5;
    grd_skillIcon[# _ix,_iy] = spr_icon_stanceSpellProtect;
    grd_skillAct[# _ix,_iy] = instance_create_depth(0,0,0,obj_handler_act_snct_ngtS);

#endregion