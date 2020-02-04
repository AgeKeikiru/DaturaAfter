/// @description Insert description here
// You can write your code in this editor

event_inherited();

name = "Ace";
desc = "Stylish masters of every fighting discipline. Highly technical, Aces not only effectively deal any type of damage, they thrive and are most dangerous when alternating between Melee, Firearm, and Spell attacks.";
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

#region //tier 1

    var
    _ix = 0,
    _iy = 0;
    
    //skill macro
	#macro ACE_SK_MATK 0,0
    grd_skillName[# ACE_SK_MATK] = "M-ATK+";
    grd_skillDesc[# ACE_SK_MATK] = "Increase base Melee Attack.";
    grd_skillTooltip[# ACE_SK_MATK] = "M-ATK: !";
    grd_skillIcon[# ACE_SK_MATK] = spr_icon_mAtkUp;
    
    _iy++;
    
    #macro ACE_SK_FATK 0,1
	grd_skillName[# ACE_SK_FATK] = "F-ATK+";
    grd_skillDesc[# ACE_SK_FATK] = "Increase base Firearm Attack.";
    grd_skillTooltip[# ACE_SK_FATK] = "F-ATK: !";
    grd_skillIcon[# ACE_SK_FATK] = spr_icon_fAtkUp;
    
    _iy++;
    
    #macro ACE_SK_SATK 0,2
	grd_skillName[# ACE_SK_SATK] = "S-ATK+";
    grd_skillDesc[# ACE_SK_SATK] = "Increase base Spell Attack.";
    grd_skillTooltip[# ACE_SK_SATK] = "S-ATK: !";
    grd_skillIcon[# ACE_SK_SATK] = spr_icon_sAtkUp;

#endregion

#region //tier 2

    _ix++;
    _iy = 0;

    #macro ACE_SK_SDANCE 1,0
	grd_skillName[# ACE_SK_SDANCE] = "Swords Dance";
    grd_skillDesc[# ACE_SK_SDANCE] = "On switch to <Weaponmaster:M>, briefly boost party ATK.";
    grd_skillTooltip[# ACE_SK_SDANCE] = "M/F/S-ATK: !%";
    grd_skillRate[# ACE_SK_SDANCE] = .04;
    grd_skillIcon[# ACE_SK_SDANCE] = spr_icon_stanceUpAlly;
    
    _iy++;
    
    #macro ACE_SK_STRATOS 1,1
	grd_skillName[# ACE_SK_STRATOS] = "Stratos";
    grd_skillDesc[# ACE_SK_STRATOS] = "With <Weaponmaster:F> active, gain a boost to SPD.";
    grd_skillTooltip[# ACE_SK_STRATOS] = "SPD: !%";
    grd_skillRate[# ACE_SK_STRATOS] = .2;
    grd_skillIcon[# ACE_SK_STRATOS] = spr_icon_stanceUp;
    
    _iy++;
    
    #macro ACE_SK_MDRAW 1,2
	grd_skillName[# ACE_SK_MDRAW] = "Mana Draw";
    grd_skillDesc[# ACE_SK_MDRAW] = "With <Weaponmaster:S> active, gain a boost to passive EN recovery.";
    grd_skillTooltip[# ACE_SK_MDRAW] = "EN Rec: !%";
    grd_skillRate[# ACE_SK_MDRAW] = .1;
    grd_skillIcon[# ACE_SK_MDRAW] = spr_icon_stanceUp;

#endregion

#region //tier 3

    _ix++;
    _iy = 0;

    #macro ACE_SK_RIPO 2,0
	grd_skillName[# ACE_SK_RIPO] = "Riposte";
    grd_skillDesc[# ACE_SK_RIPO] = "With <Weaponmaster:Any> active, being attacked has a low chance to automatically trigger an equipped Melee weapon chip.";
    grd_skillTooltip[# ACE_SK_RIPO] = "Proc Rate: !%";
    grd_skillRate[# ACE_SK_RIPO] = .05;
    grd_skillIcon[# ACE_SK_RIPO] = spr_icon_stanceUp;
    
    _iy++;
    
    #macro ACE_SK_HTRIG 2,1
	grd_skillName[# ACE_SK_HTRIG] = "Hair Trigger";
    grd_skillDesc[# ACE_SK_HTRIG] = "With <Weaponmaster:Any> active, Firearm weapon chips become [Agile] but suffer a damage/accuracy penalty.";
    grd_skillTooltip[# ACE_SK_HTRIG] = "PWR/ACC: !%";
    grd_skillIcon[# ACE_SK_HTRIG] = spr_icon_stanceUp;
    
    _iy++;
    
    #macro ACE_SK_FWORK 2,2
	grd_skillName[# ACE_SK_FWORK] = "Fireworks";
    grd_skillDesc[# ACE_SK_FWORK] = "With <Weaponmaster:Any> active, Spell weapon chips gain stun chance and briefly increase aggro on hit.";
    grd_skillTooltip[# ACE_SK_FWORK] = "Stun Chance: !%";
    grd_skillRate[# ACE_SK_FWORK] = .06;
    grd_skillIcon[# ACE_SK_FWORK] = spr_icon_stanceUp;

#endregion

#region //tier 4

    _ix++;
    _iy = 0;

    #macro ACE_SK_CFINISH 3,0
	grd_skillName[# ACE_SK_CFINISH] = "Cross Finish";
    grd_skillDesc[# ACE_SK_CFINISH] = "Charge by switching to <Weaponmaster:M> - Unleash an intense flurry of melee strikes against all enemies at random. Resets cooldowns of other Ace X-Acts on use.";
    grd_skillTooltip[# ACE_SK_CFINISH] = "Power: !";
    grd_skillRate[# ACE_SK_CFINISH] = 50;
    grd_skillIcon[# ACE_SK_CFINISH] = spr_icon_stanceSlashEnemy;
    grd_skillAct[# ACE_SK_CFINISH] = create(obj_handler_act_ace_cFinish);
    
    _iy++;
    
    #macro ACE_SK_LOCK 3,1
	grd_skillName[# ACE_SK_LOCK] = "Full Lock";
    grd_skillDesc[# ACE_SK_LOCK] = "Charge by switching to <Weaponmaster:F> - Attacks from the user are guaranteed to hit for the rest of the mission. Resets cooldowns of other Ace X-Acts on use.";
    grd_skillTooltip[# ACE_SK_LOCK] = "";
    grd_skillIcon[# ACE_SK_LOCK] = spr_icon_stanceAimAlly;
    grd_skillAct[# ACE_SK_LOCK] = create(obj_handler_act_ace_fLock);
    
    _iy++;
    
    #macro ACE_SK_DTOUCH 3,2
	grd_skillName[# ACE_SK_DTOUCH] = "Dead Touch";
    grd_skillDesc[# ACE_SK_DTOUCH] = "Charge by switching to <Weaponmaster:S> - Inflict 2 long lasting random debuffs on all enemies. Resets cooldowns of other Ace X-Acts on use.";
    grd_skillTooltip[# ACE_SK_DTOUCH] = "Duration: !sec";
    grd_skillRate[# ACE_SK_DTOUCH] = 20;
    grd_skillIcon[# ACE_SK_DTOUCH] = spr_icon_stanceDebuffEnemy;
    grd_skillAct[# ACE_SK_DTOUCH] = create(obj_handler_act_ace_dTouch);

#endregion