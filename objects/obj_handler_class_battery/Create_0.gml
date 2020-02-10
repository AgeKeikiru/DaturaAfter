/// @description Insert description here
// You can write your code in this editor

event_inherited();

name = "Battery";
desc = "Wisened spellcrafters that weave magic like a force of nature. An easy to learn dps class, Batteries are very straightforward and boast a wide variety of bonuses when using spell weapons.";
cName = "BATT_" + string(global.cid++);

ms_name = "Spell Recovery";
ms_desc = "Increase EN Recovery of spell weapons by Lv*0.5%.";
ms_icon = spr_icon_enUp;

ss_name = "ACC+ (s)";//
ss_desc = "Slightly increase base ACC.";
ss_icon = spr_icon_accUp;
ss_toolTip = "ACC: !";
ss_rate = 0.5;

stat_snare_base = 50;
stat_snare_rate = 5;

stat_flawless_base = 1;
stat_flawless_rate = -0.04;

stat_oc_boostRate = 0.2;
stat_oc_penaltyRate = 0.1;

#region //tier 1

    #macro BATT_SK_SATK 0,0
	grd_skillName[# BATT_SK_SATK] = "S-ATK+";//
	grd_skillDesc[# BATT_SK_SATK] = "Increase base Spell Attack.";
	grd_skillTooltip[# BATT_SK_SATK] = "S-ATK: !";
	grd_skillIcon[# BATT_SK_SATK] = spr_icon_sAtkUp;
    
    #macro BATT_SK_EN 0,1
	grd_skillName[# BATT_SK_EN] = "EN+";//
	grd_skillDesc[# BATT_SK_EN] = "Increase base EN.";
	grd_skillTooltip[# BATT_SK_EN] = "EN: !";
	grd_skillRate[# BATT_SK_EN] = 100;
	grd_skillIcon[# BATT_SK_EN] = spr_icon_enUp;
    
    #macro BATT_SK_SDEF 0,2
	grd_skillName[# BATT_SK_SDEF] = "S-DEF+";//
	grd_skillDesc[# BATT_SK_SDEF] = "Increase base Spell Defense.";
	grd_skillTooltip[# BATT_SK_SDEF] = "S-DEF: !";
	grd_skillIcon[# BATT_SK_SDEF] = spr_icon_sDefUp;

#endregion

#region //tier 2

    #macro BATT_SK_HEALBOOST 1,0
	grd_skillName[# BATT_SK_HEALBOOST] = "Heal+";//
	grd_skillDesc[# BATT_SK_HEALBOOST] = "Boost potency of all healing effects.";
	grd_skillTooltip[# BATT_SK_HEALBOOST] = "Effect: !%";
	grd_skillRate[# BATT_SK_HEALBOOST] = 0.1;
	grd_skillIcon[# BATT_SK_HEALBOOST] = spr_icon_stance3card;//nonstance heal up grey
    
    #macro BATT_SK_CHAIN 1,1
	grd_skillName[# BATT_SK_CHAIN] = "Chain Cast";//
	grd_skillDesc[# BATT_SK_CHAIN] = "Temporarily grant all spell weapons the [Agile] property.";
	grd_skillTooltip[# BATT_SK_CHAIN] = "";
	grd_skillIcon[# BATT_SK_CHAIN] = spr_icon_cycle;
	//grd_skillAct[# BATT_SK_CHAIN] = create(obj_handler_act_zodc_rDraw);
	
    #macro BATT_SK_SNARE 1,2
	grd_skillName[# BATT_SK_SNARE] = "Atrophy Snare";//
	grd_skillDesc[# BATT_SK_SNARE] = "A weak but wide spell attack that reduces the target's S-DEF on hit.";
	grd_skillTooltip[# BATT_SK_SNARE] = "ACC: !";//agile
	grd_skillIcon[# BATT_SK_SNARE] = spr_icon_debuffSlash;
	//grd_skillAct[# BATT_SK_SNARE] = create(obj_handler_act_zodc_rDraw);
	
#endregion

#region //tier 3

    #macro BATT_SK_MDRIVE 2,0
	grd_skillName[# BATT_SK_MDRIVE] = "Mana Drive";//
	grd_skillDesc[# BATT_SK_MDRIVE] = "When an enemy is weak to a spell attack, slightly heal the user based on max HP.";
	grd_skillTooltip[# BATT_SK_MDRIVE] = "Effect: !%";
	grd_skillRate[# BATT_SK_MDRIVE] = 0.01;
	grd_skillIcon[# BATT_SK_MDRIVE] = spr_icon_stanceFireIce;//
	
    #macro BATT_SK_FLAWLESS 2,1
	grd_skillName[# BATT_SK_FLAWLESS] = "Flawless Recovery";//
	grd_skillDesc[# BATT_SK_FLAWLESS] = "Boost passive EN recovery while HP is above a certain threshold.";
	grd_skillTooltip[# BATT_SK_FLAWLESS] = "Threshold: !";
	grd_skillIcon[# BATT_SK_FLAWLESS] = spr_icon_enUp;
	
    #macro BATT_SK_INERTIA 2,2
	grd_skillName[# BATT_SK_INERTIA] = "Inertia Casting";//
	grd_skillDesc[# BATT_SK_INERTIA] = "When an enemy is resistant to a spell attack, briefly boost the user's S-ATK.";
	grd_skillTooltip[# BATT_SK_INERTIA] = "Effect: !%";
	grd_skillRate[# BATT_SK_INERTIA] = 0.1;
	grd_skillIcon[# BATT_SK_INERTIA] = spr_icon_stanceLgtDrk;//grey cycle
	
#endregion

#region //tier 4

    #macro BATT_SK_PACT 3,0
	grd_skillName[# BATT_SK_PACT] = "Blood Pact";//
	grd_skillDesc[# BATT_SK_PACT] = "Cut current HP in half to restore EN based on HP consumed.";
	grd_skillTooltip[# BATT_SK_PACT] = "Conversion Rate: !%";
	grd_skillRate[# BATT_SK_PACT] = 0.3;
	grd_skillIcon[# BATT_SK_PACT] = spr_icon_cycle;
	
    #macro BATT_SK_ABSORB 3,1
	grd_skillName[# BATT_SK_ABSORB] = "Absorbtion";//
	grd_skillDesc[# BATT_SK_ABSORB] = "Gain EN when hit based on damage taken.";
	grd_skillTooltip[# BATT_SK_ABSORB] = "Conversion Rate: !%";
	grd_skillRate[# BATT_SK_ABSORB] = 0.2;
	grd_skillIcon[# BATT_SK_ABSORB] = spr_icon_wing;//grey cycle
	
    #macro BATT_SK_OC 3,2
	grd_skillName[# BATT_SK_OC] = "Overcharge";//
	grd_skillDesc[# BATT_SK_OC] = "Greatly increase aggro and decrease defense to greatly boost S-ATK. Effect lasts until the next Act.";
	grd_skillTooltip[# BATT_SK_OC] = "S-ATK: !%\nM/F/S-DEF: @%";
	grd_skillIcon[# BATT_SK_OC] = spr_icon_stanceRaise;//battery-lightning bolts
	//grd_skillAct[# BATT_SK_OC] = create(obj_handler_act_zodc_rDraw);
	
#endregion