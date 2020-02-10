/// @description Insert description here
// You can write your code in this editor

event_inherited();

name = "Strider";
desc = "Expert navigators that make exploring even the densest of labyrinths a breeze. An excellent utility class, Striders bring many passive skills that assist in completing missions.";
cName = "STRI_" + string(global.cid++);

ms_name = "Walking Bestiary";
ms_desc = "Show the HP of enemies during battle.";
ms_icon = spr_icon_stance;//magnifying glass

ss_name = "MISC+ (s)";//
ss_desc = "Slightly increase base MISC.";
ss_icon = spr_icon_miscUp;
ss_toolTip = "MISC: !";
ss_rate = 0.5;

stat_bleed_base = 2;
stat_bleed_rate = 1;

#region //tier 1

    #macro STRI_SK_ACC 0,0
	grd_skillName[# STRI_SK_ACC] = "ACC+";//
	grd_skillDesc[# STRI_SK_ACC] = "Increase base Accuracy.";
	grd_skillTooltip[# STRI_SK_ACC] = "ACC: !";
	grd_skillRate[# STRI_SK_ACC] = stat_fineStatRate;
	grd_skillIcon[# STRI_SK_ACC] = spr_icon_accUp;
    
    #macro STRI_SK_CRIT 0,1
	grd_skillName[# STRI_SK_CRIT] = "C-RATE+";//
	grd_skillDesc[# STRI_SK_CRIT] = "Increase base Crit Rate.";
	grd_skillTooltip[# STRI_SK_CRIT] = "C-RATE: !%";
	grd_skillRate[# STRI_SK_CRIT] = 0.03;
	grd_skillIcon[# STRI_SK_CRIT] = spr_icon_critRateUp;
    
    #macro STRI_SK_EVA 0,2
	grd_skillName[# STRI_SK_EVA] = "EVA+";//
	grd_skillDesc[# STRI_SK_EVA] = "Increase base Evasion.";
	grd_skillTooltip[# STRI_SK_EVA] = "EVA: !";
	grd_skillRate[# STRI_SK_EVA] = stat_fineStatRate;
	grd_skillIcon[# STRI_SK_EVA] = spr_icon_evaUp;

#endregion

#region //tier 2

    #macro STRI_SK_HEALBOOST 1,0
	grd_skillName[# STRI_SK_HEALBOOST] = "Heal+";//
	grd_skillDesc[# STRI_SK_HEALBOOST] = "Boost potency of all healing effects.";
	grd_skillTooltip[# STRI_SK_HEALBOOST] = "Effect: !%";
	grd_skillRate[# STRI_SK_HEALBOOST] = 0.1;
	grd_skillIcon[# STRI_SK_HEALBOOST] = spr_icon_stance3card;//nonstance heal up grey
    
    #macro STRI_SK_AID 1,1
	grd_skillName[# STRI_SK_AID] = "First Aid";//
	grd_skillDesc[# STRI_SK_AID] = "Heal party members based on max HP after battles. Effect does not stack.";
	grd_skillTooltip[# STRI_SK_AID] = "Effect: !%";
	grd_skillRate[# STRI_SK_AID] = 0.02;
	grd_skillIcon[# STRI_SK_AID] = spr_icon_stanceBrt;//nonstance heal grey
	
    #macro STRI_SK_HEALSHARE 1,2
	grd_skillName[# STRI_SK_HEALSHARE] = "Heal Share";//
	grd_skillDesc[# STRI_SK_HEALSHARE] = "When using MEDA or VYRA, slightly heal non-targeted party members based on max HP.";
	grd_skillTooltip[# STRI_SK_HEALSHARE] = "Effect: !%";
	grd_skillRate[# STRI_SK_HEALSHARE] = 0.02;
	grd_skillIcon[# STRI_SK_HEALSHARE] = spr_icon_stance2card;//nonstance heal up grey
	
#endregion

#region //tier 3

    #macro STRI_SK_SCAVENGER 2,0
	grd_skillName[# STRI_SK_SCAVENGER] = "Scavenger";//
	grd_skillDesc[# STRI_SK_SCAVENGER] = "Increase number of drops from enemies and chests by a random amount. Effect does not stack.";
	grd_skillTooltip[# STRI_SK_SCAVENGER] = "Effect: !";//0-1,0-2,0-3,1-3,2-3
	grd_skillIcon[# STRI_SK_SCAVENGER] = spr_icon_stanceFireIce;//dollar sign
	
    #macro STRI_SK_STUDY 2,1
	grd_skillName[# STRI_SK_STUDY] = "Studious";//
	grd_skillDesc[# STRI_SK_STUDY] = "When attacked by an enemy, gain a chance to briefly reduce that enemy's EVA.";
	grd_skillTooltip[# STRI_SK_STUDY] = "Proc Rate: !";
	grd_skillRate[# STRI_SK_STUDY] = 0.4;
	grd_skillIcon[# STRI_SK_STUDY] = spr_icon_stanceNatElec;//trap grey
	
    #macro STRI_SK_REDO 2,2
	grd_skillName[# STRI_SK_REDO] = "Mulligan";//
	grd_skillDesc[# STRI_SK_REDO] = "If an attack misses, gain a chance to briefly boost SPD.";
	grd_skillTooltip[# STRI_SK_REDO] = "Proc Rate: !%";
	grd_skillRate[# STRI_SK_REDO] = 0.04;
	grd_skillIcon[# STRI_SK_REDO] = spr_icon_stanceLgtDrk;//grey cycle
	
#endregion

#region //tier 4

    #macro STRI_SK_PAY 3,0
	grd_skillName[# STRI_SK_PAY] = "Payday";//
	grd_skillDesc[# STRI_SK_PAY] = "Increase amount of gold gained from enemies and chests. Effect does not stack.";
	grd_skillTooltip[# STRI_SK_PAY] = "Effect: !%";
	grd_skillRate[# STRI_SK_PAY] = 0.1;
	grd_skillIcon[# STRI_SK_PAY] = spr_icon_rCross;//dollar sign
	
    #macro STRI_SK_RUN 3,1
	grd_skillName[# STRI_SK_RUN] = "Escape";//
	grd_skillDesc[# STRI_SK_RUN] = "If successful, ends battle immediately, gain no loot. Cannot be used in fixed battles.";
	grd_skillTooltip[# STRI_SK_RUN] = "Success Rate: !%";
	grd_skillRate[# STRI_SK_RUN] = 0.19;
	grd_skillIcon[# STRI_SK_RUN] = spr_icon_wing;
	//grd_skillAct[# STRI_SK_RUN] = create(obj_handler_act_zodc_rDraw);
    
    #macro STRI_SK_BLEED 3,2
	grd_skillName[# STRI_SK_BLEED] = "Bleeding Edge";//
	grd_skillDesc[# STRI_SK_BLEED] = "Upon landing a crit, briefly poison target.";
	grd_skillTooltip[# STRI_SK_BLEED] = "Duration: !sec";
	grd_skillIcon[# STRI_SK_BLEED] = spr_icon_stanceRaise;//crit skull grey
	
#endregion