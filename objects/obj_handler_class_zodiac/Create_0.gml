/// @description Insert description here
// You can write your code in this editor

event_inherited();

name = "Zodiac";
desc = "Mysterious spellcasters that imbue the elements into a deck of cards. A highly technical class, Zodiacs are masters of the elements and let their enigmatic Arcane Deck decide the enemy's fate.";
cName = "ZODC_" + string(global.cid++);

ms_name = "Arcane Deck";
ms_desc = "[Stance] When using a weapon with an element, draw a card based on that element.";
ms_icon = spr_icon_stance;

ss_name = "MISC+ (s)";
ss_desc = "Slightly increase base MISC.";
ss_icon = spr_icon_miscUp;
ss_toolTip = "MISC: !";
ss_rate = 0.5;

stat_xcd_base = 7;
stat_xcd_rate = -1;

#region //tier 1

    #macro ZODC_SK_SATK 0,0
	grd_skillName[# ZODC_SK_SATK] = "S-ATK+";
	grd_skillDesc[# ZODC_SK_SATK] = "Increase base Spell Attack.";
	grd_skillTooltip[# ZODC_SK_SATK] = "S-ATK: !";
	grd_skillIcon[# ZODC_SK_SATK] = spr_icon_sAtkUp;
    
    #macro ZODC_SK_ELE 0,1
	grd_skillName[# ZODC_SK_ELE] = "Ele Res+";
	grd_skillDesc[# ZODC_SK_ELE] = "Decrease damage taken from all elements.";
	grd_skillTooltip[# ZODC_SK_ELE] = "Ele Res: !";
	grd_skillRate[# ZODC_SK_ELE] = 2;
	grd_skillIcon[# ZODC_SK_ELE] = spr_icon_eleRes;
    
    #macro ZODC_SK_SDEF 0,2
	grd_skillName[# ZODC_SK_SDEF] = "S-DEF+";
	grd_skillDesc[# ZODC_SK_SDEF] = "Increase base Spell Defense.";
	grd_skillTooltip[# ZODC_SK_SDEF] = "S-DEF: !";
	grd_skillIcon[# ZODC_SK_SDEF] = spr_icon_sDefUp;

#endregion

#region //tier 2

    #macro ZODC_SK_GREED 1,0
	grd_skillName[# ZODC_SK_GREED] = "Greed Draw";
	grd_skillDesc[# ZODC_SK_GREED] = "Draw 3 cards of random elements.";
	grd_skillTooltip[# ZODC_SK_GREED] = "";
	grd_skillIcon[# ZODC_SK_GREED] = spr_icon_stance3card;
	grd_skillAct[# ZODC_SK_GREED] = create(obj_handler_act_zodc_gDraw);
    
    #macro ZODC_SK_EXPEL 1,1
	grd_skillName[# ZODC_SK_EXPEL] = "Expel";
	grd_skillDesc[# ZODC_SK_EXPEL] = "Consume all cards to attack enemies at random. Hit count and status effect inflict rates based on cards consumed.";
	grd_skillTooltip[# ZODC_SK_EXPEL] = "PWR: !";
	grd_skillRate[# ZODC_SK_EXPEL] = 50;
	grd_skillIcon[# ZODC_SK_EXPEL] = spr_icon_stanceBrt;
	grd_skillAct[# ZODC_SK_EXPEL] = create(obj_handler_act_zodc_expel);
    
    #macro ZODC_SK_FOCUS 1,2
	grd_skillName[# ZODC_SK_FOCUS] = "Focus Draw";
	grd_skillDesc[# ZODC_SK_FOCUS] = "Draw 2 cards identical to the last card drawn.";
	grd_skillTooltip[# ZODC_SK_FOCUS] = "";
	grd_skillIcon[# ZODC_SK_FOCUS] = spr_icon_stance2card;
	grd_skillAct[# ZODC_SK_FOCUS] = create(obj_handler_act_zodc_fDraw);

#endregion

#region //tier 3

    #macro ZODC_SK_EMPOWER 2,0
	grd_skillName[# ZODC_SK_EMPOWER] = "Empower";
	grd_skillDesc[# ZODC_SK_EMPOWER] = "Consume all Ice/Fire cards to boost party ATK/DEF. Potency based on cards consumed. Must have at least 1 of each card.";
	grd_skillTooltip[# ZODC_SK_EMPOWER] = "Duration: !sec";
	grd_skillRate[# ZODC_SK_EMPOWER] = 3;
	grd_skillIcon[# ZODC_SK_EMPOWER] = spr_icon_stanceFireIce;
	grd_skillAct[# ZODC_SK_EMPOWER] = create(obj_handler_act_zodc_empower);
    
    #macro ZODC_SK_CATA 2,1
	grd_skillName[# ZODC_SK_CATA] = "Catastrophe";
	grd_skillDesc[# ZODC_SK_CATA] = "Consume all Elec/Nat cards to cast a wide spell attack that removes enemy buffs. Accuracy based on cards consumed. Must have at least 1 of each card.";
	grd_skillTooltip[# ZODC_SK_CATA] = "PWR: !";
	grd_skillRate[# ZODC_SK_CATA] = 150;
	grd_skillIcon[# ZODC_SK_CATA] = spr_icon_stanceNatElec;
	grd_skillAct[# ZODC_SK_CATA] = create(obj_handler_act_zodc_cata);
    
    #macro ZODC_SK_SIPHON 2,2
	grd_skillName[# ZODC_SK_SIPHON] = "Siphon";
	grd_skillDesc[# ZODC_SK_SIPHON] = "Consume all Light/Dark cards to drain an enemy and heal all allies. Conversion rate based on cards consumed. Must have at least 1 of each card.";
	grd_skillTooltip[# ZODC_SK_SIPHON] = "PWR: !";
	grd_skillRate[# ZODC_SK_SIPHON] = 100;
	grd_skillIcon[# ZODC_SK_SIPHON] = spr_icon_stanceLgtDrk;
	grd_skillAct[# ZODC_SK_SIPHON] = create(obj_handler_act_zodc_siphon);

#endregion

#region //tier 4

    #macro ZODC_SK_ORPHAN 3,0
	grd_skillName[# ZODC_SK_ORPHAN] = "Six Orphans";//
	grd_skillDesc[# ZODC_SK_ORPHAN] = "Charge via using <Expel> with all 6 elements, one use per mission. A wide, severe spell attack that treats Spell attack resistance as weakness.";
	grd_skillTooltip[# ZODC_SK_ORPHAN] = "";
	grd_skillIcon[# ZODC_SK_ORPHAN] = spr_icon_rCross;
    
    #macro ZODC_SK_RELOAD 3,1
	grd_skillName[# ZODC_SK_RELOAD] = "Reload Draw";//
	grd_skillDesc[# ZODC_SK_RELOAD] = "Restore Arcane Deck to the state it was in prior to the last time cards were consumed.";
	grd_skillTooltip[# ZODC_SK_RELOAD] = "";
	grd_skillIcon[# ZODC_SK_RELOAD] = spr_icon_cycle;
    
    #macro ZODC_SK_FLUSH 3,2
	grd_skillName[# ZODC_SK_FLUSH] = "Miracle Flush";//
	grd_skillDesc[# ZODC_SK_FLUSH] = "Charge via using <Expel> with 6 matching cards, one use per mission. Fully restore all ally HP/EN and remove debuffs/ailments.";
	grd_skillTooltip[# ZODC_SK_FLUSH] = "";
	grd_skillIcon[# ZODC_SK_FLUSH] = spr_icon_stanceRaise;

#endregion