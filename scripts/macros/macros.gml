#region //general
	
	#macro GAMEVER "v0.0.1"
	#macro UNIVERSAL_COOLDOWN 60 * 100 * 5
	#macro DEFAULT_PANEL_BEZEL 8
	#macro CANARY true
	
#endregion

#region //custom colors

	#macro CC_HPGREEN make_color_hsv(106,180,230)
	#macro CC_HEALGREEN make_color_hsv(115,200,255)
	#macro CC_ENBLUE make_color_hsv(136,180,230)

#endregion

#region //char data
	
	#region //party members
	
		#macro CHAR_IMOLEI "char_imo'lei"
		#macro CHAR_AILE "char_aile"
		#macro CHAR_PAPRIKA "char_paprika"
		#macro CHAR_LEVIA "char_levia"
		#macro CHAR_JACK "char_jack"
		#macro CHAR_HARZER "char_harzer"
	
		#macro CHAR_BLAZE "char_blaze"
		#macro CHAR_WITCHY "char_witchy"
		#macro CHAR_ALTAI "char_altai"
		#macro CHAR_SEETHE "char_seethe"
		#macro CHAR_MINA "char_mina"
		#macro CHAR_ARI "char_ari"
		
	#endregion
	
	#region //enemies
	
		#macro CHAR_SLIME "char_slime"
		#macro CHAR_CANDYWING "char_candywing"
		#macro CHAR_WOLFEANT "char_wolfeant"
		#macro CHAR_WANDERER "char_wanderer"
		#macro CHAR_BLEEDINGBULLET "char_bleedingBullet"
		#macro CHAR_DARTLILY "char_dartLily"
		#macro CHAR_PARASLIME "char_paraSlime"
		#macro CHAR_KINGSLIME "char_kingSlime"
		#macro CHAR_GREENDRAGON "char_greenDragon"
		#macro CHAR_BLASTVENDOR "char_blastVendor"
		#macro CHAR_SHELLVENDOR "char_shellVendor"
		#macro CHAR_SNACKVENDOR "char_snackVendor"
		#macro CHAR_TIMBERCAT "char_timberCat"
		
	#endregion
	
	#region //char vars
		
		//general
		#macro CHAR_VAR_ID "char_var_id"
		#macro CHAR_VAR_NAMEFULL "char_var_nameFull"
		#macro CHAR_VAR_NAMEDISP "char_var_nameDisp"
		#macro CHAR_VAR_DESC "char_var_desc"
		#macro CHAR_VAR_RACE "char_var_race"
		
		//stats
		#macro CHAR_VAR_LEVEL "char_var_level"
		#macro CHAR_VAR_HP "char_var_hp"
		#macro CHAR_VAR_EN "char_var_en"
		#macro CHAR_VAR_MATK "char_var_mAtk"
		#macro CHAR_VAR_MDEF "char_var_mDef"
		#macro CHAR_VAR_FATK "char_var_fAtk"
		#macro CHAR_VAR_FDEF "char_var_fDef"
		#macro CHAR_VAR_SATK "char_var_sAtk"
		#macro CHAR_VAR_SDEF "char_var_sDef"
		#macro CHAR_VAR_ACC	"char_var_acc"
		#macro CHAR_VAR_EVA "char_var_eva"
		#macro CHAR_VAR_SPD "char_var_spd"
		#macro CHAR_VAR_MISC "char_var_misc" //miscellaneous stat, the luck stat
		
		//resistances
		#macro CHAR_VAR_ELE_FIR "char_var_ele_fir"
		#macro CHAR_VAR_ELE_ICE "char_var_ele_ice"
		#macro CHAR_VAR_ELE_NAT "char_var_ele_nat"
		#macro CHAR_VAR_ELE_ELC "char_var_ele_elc"
		#macro CHAR_VAR_ELE_DRK "char_var_ele_drk"
		#macro CHAR_VAR_ELE_LGT "char_var_ele_lgt"
		
		//hotbar
		#macro CHAR_VAR_HB0 "char_var_hb0"
		#macro CHAR_VAR_HB1 "char_var_hb1"
		#macro CHAR_VAR_HB2 "char_var_hb2"
		#macro CHAR_VAR_HB3 "char_var_hb3"
		#macro CHAR_VAR_HB4 "char_var_hb4"
		#macro CHAR_VAR_HB5 "char_var_hb5"
		#macro CHAR_VAR_HB6 "char_var_hb6"
		#macro CHAR_VAR_HB7 "char_var_hb7"
		
		//armors
		#macro CHAR_VAR_ARM0 "char_var_arm0"
		#macro CHAR_VAR_ARM1 "char_var_arm1"
		
		//classes
		#macro CHAR_VAR_CLS0 "char_var_cls0"
		#macro CHAR_VAR_CLS1 "char_var_cls1"
		#macro CHAR_VAR_CLS2 "char_var_cls2"
		#macro CHAR_VAR_UCLASS "char_var_uclass" //unique class
		
		//sprites
		#macro CHAR_VAR_SPR_BATTLEPORT "char_var_spr_battlePort"
		#macro CHAR_VAR_SPR_NEUTRAL "char_var_spr_neutral"
		
		//party screen drawing offsets
		#macro CHAR_VAR_PSDO_ACT_X "char_var_psdo_act_x"
		#macro CHAR_VAR_PSDO_ACT_Y "char_var_psdo_act_y"
		
		#macro CHAR_VAR_PSDO_ARM_X "char_var_psdo_arm_x"
		#macro CHAR_VAR_PSDO_ARM_Y "char_var_psdo_arm_y"
		
		#macro CHAR_VAR_PSDO_CLS_X "char_var_psdo_cls_x"
		#macro CHAR_VAR_PSDO_CLS_Y "char_var_psdo_cls_y"
		
	#endregion
	
	#region //status ailments
	
		#macro CHAR_SA_BRN 0
		#macro CHAR_SA_SLW 1
		#macro CHAR_SA_SLC 2
		#macro CHAR_SA_PAR 3
		#macro CHAR_SA_PSN 4
		#macro CHAR_SA_BLD 5
	
	#endregion
	
	#region //status icons
	
		#macro CHAR_SI_MATKUP 0
		#macro CHAR_SI_MATKDN 1
		#macro CHAR_SI_MDEFUP 2
		#macro CHAR_SI_MDEFDN 3
		
		#macro CHAR_SI_FATKUP 4
		#macro CHAR_SI_FATKDN 5
		#macro CHAR_SI_FDEFUP 6
		#macro CHAR_SI_FDEFDN 7
		
		#macro CHAR_SI_SATKUP 8
		#macro CHAR_SI_SATKDN 9
		#macro CHAR_SI_SDEFUP 10
		#macro CHAR_SI_SDEFDN 11
		
		#macro CHAR_SI_ACCUP 12
		#macro CHAR_SI_ACCDN 13
		#macro CHAR_SI_EVAUP 14
		#macro CHAR_SI_EVADN 15
		#macro CHAR_SI_SPDUP 16
		#macro CHAR_SI_SPDDN 17
		
		#macro CHAR_SI_BRN 18
		#macro CHAR_SI_SLW 19
		#macro CHAR_SI_SLC 20
		#macro CHAR_SI_PAR 21
		#macro CHAR_SI_PSN 22
		#macro CHAR_SI_BLD 23
	
	#endregion
	
#endregion

#region //race data
	
	#macro RACE_HUMAN "race_human"
	#macro RACE_DRACON "race_dracon"
	#macro RACE_DHAMPIR "race_dhampir"
	#macro RACE_ARTIFICE "race_artifice"
	#macro RACE_BESTIA "race_bestia"
	
	#macro RACE_OOZE "race_ooze"
	#macro RACE_CANDY "race_candy"
	#macro RACE_SPIRIT "race_spirit"
	#macro RACE_PLANT "race_plant"
	
#endregion

#region //skill data
	
	#region //skills
	
		//imolei
		#macro SKILL_IMO_MATK "skill_imo_mAtk"
		
		//aile
		//paprika
		//harzer
		//levia
		//jack
		//blaze
		//witchy
		//altai
		//seethe
		//mina
		//ari
	
		//evoker
		#macro SKILL_EVOK_SDEF "skill_evok_sDef"
		#macro SKILL_EVOK_SPD "skill_evok_spd"
		#macro SKILL_EVOK_SATK "skill_evok_sAtk"
		
		#macro SKILL_EVOK_STANCE_REDEEMER "skill_evok_stance_redeemer"
		#macro SKILL_EVOK_DMG_DRK "skill_evok_dmg_drk"
		#macro SKILL_EVOK_STANCE_DESTROYER "skill_evok_stance_destroyer"
		
		#macro SKILL_EVOK_HIDE "skill_evok_hide"
		#macro SKILL_EVOK_DMG_LGT "skill_evok_dmg_lgt"
		#macro SKILL_EVOK_TAUNT "skill_evok_taunt"
		
		#macro SKILL_EVOK_REDEEMER_ENDURE "skill_evok_redeemer_endure"
		#macro SKILL_EVOK_EXTEND_DEBUFF "skill_evok_extend_debuff"
		#macro SKILL_EVOK_DESTROYER_RAGE "skill_evok_destroyer_rage"
				
		//angel
		#macro SKILL_ANGE_RES_LGT "skill_ange_res_lgt"
		#macro SKILL_ANGE_DEFUP "skill_ange_defUp"
		#macro SKILL_ANGE_DMGUP_LGT "skill_ange_dmgUp_lgt"
		
		#macro SKILL_ANGE_ASTEP "skill_ange_aStep"
		#macro SKILL_ANGE_ANGELITE "skill_ange_angelite"
		#macro SKILL_ANGE_ADASH "skill_ange_aDash"
		
		////
		#macro SKILL_ANGE_ABOOST_TRI "skill_ange_aBoost_tri"
		////
		
		////
		#macro SKILL_ANGE_ABOOST_LGT "skill_ange_aBoost_lgt"
		////
		
		//razer
	
	#endregion
	
	#region //skill vars
	
	#macro SKILL_VAR_ID "skill_var_id"
	#macro SKILL_VAR_NAME "skill_var_name"
	#macro SKILL_VAR_DESC "skill_var_desc"
	
	#endregion
	
#endregion

#region //act data

	#region //weapon tags
	
		#macro WTAG_TYPE_ACT "$act"
	
		#macro WTAG_TYPE_SWD "$swd"
		#macro WTAG_TYPE_AXE "$axe"
		#macro WTAG_TYPE_CSW "$csw" //chainsaw
		#macro WTAG_TYPE_SCY "$scy" //scythe
		#macro WTAG_TYPE_DGR "$dgr" //dagger
		#macro WTAG_TYPE_GNT "$gnt" //gauntlet
		#macro WTAG_TYPE_PAN "$pan"
		
		#macro WTAG_TYPE_HGN "$hgn" //handgun
		#macro WTAG_TYPE_SMG "$smg"
		#macro WTAG_TYPE_SHG "$shg" //shotgun
		#macro WTAG_TYPE_LMG "$lmg"
		#macro WTAG_TYPE_RPG "$rpg"
		#macro WTAG_TYPE_RFL "$rfl" //rifle
		#macro WTAG_TYPE_SLG "$slg" //sling
		
		#macro WTAG_TYPE_ASC_ARW "$asc_arw" //attack scroll [arrow] - single target
		#macro WTAG_TYPE_ASC_RAY "$asc_ray" //attack scroll [ray] - single target, strong
		#macro WTAG_TYPE_ASC_VRT "$asc_vrt" //attack scroll [vortex] - wide target
		#macro WTAG_TYPE_ASC_BRS "$asc_brs" //attack scroll [burst] - random target
		#macro WTAG_TYPE_CSC "$csc" //curse scroll
		#macro WTAG_TYPE_SSC_HEAL "$ssc_heal"
		#macro WTAG_TYPE_SSC_CURE "$ssc_cure"
		#macro WTAG_TYPE_SSC_RAISE "$ssc_raise"
		
		#macro WTAG_TYPE_SHD_FLS "$shd_fls" //flash shield - short duration, high guard
		#macro WTAG_TYPE_SHD_BRN "$shd_brn" //burn shield - long duration, low guard
		#macro WTAG_TYPE_SHD_STC "$shd_stc" //stance shield - stance act, drain EN to guard while active
	
	#endregion
	
	#region //enemy acts
	
		#macro EACT_TACKLE "eact_tackle"
	
	#endregion
	
	//target type
	#macro ACT_TGT_SINGLE "act_tgt_single"
	#macro ACT_TGT_WIDE "act_tgt_wide"
	#macro ACT_TGT_RANDOM "act_tgt_random"
	
	#region //class skills
		//imolei
		//aile
		//paprika
		//harzer
		//levia
		//jack
		//blaze
		//witchy
		//altai
		//seethe
		//mina
		//ari
		
		//evoker
		#macro ACT_EVOK_STANCE_REDEEMER "act_evok_stance_redeemer"
		#macro ACT_EVOK_STANCE_DESTROYER "act_evok_stance_destroyer"
		#macro ACT_EVOK_HIDE "act_evok_hide"
		#macro ACT_EVOK_TAUNT "act_evok_taunt"
		
		//razer
		//angel
	#endregion

#endregion

#region //armor data

	#region //armor types
	
		#macro ARM_HP "arm_hp" //stim
		#macro ARM_EN "arm_en" //bangle
		#macro ARM_MATK "arm_mAtk" //bracers
		#macro ARM_MDEF "arm_mDef" //plate
		#macro ARM_FATK "arm_fAtk" //scanner
		#macro ARM_FDEF "arm_fDef" //reflector
		#macro ARM_SATK "arm_sAtk" //talisman
		#macro ARM_SDEF "arm_sDef" //absorber
		#macro ARM_ACC	"arm_acc" //goggles
		#macro ARM_EVA "arm_eva" //camouflage
		#macro ARM_SPD "arm_spd" //booster
		#macro ARM_MISC "arm_misc" //lucky gem
	
	#endregion
	
	#region //armor vars
	
		#macro ARM_VAR_TYPE "arm_var_type"
		#macro ARM_VAR_RARE "arm_var_rare" //boosts main stat bonus
		#macro ARM_VAR_PLUS "arm_var_plus" //boosts ele resists
		
		#macro ARM_VAR_FIR "arm_var_fir"
		#macro ARM_VAR_ICE "arm_var_ice"
		#macro ARM_VAR_DRK "arm_var_drk"
		#macro ARM_VAR_LGT "arm_var_lgt"
		#macro ARM_VAR_ELC "arm_var_elc"
		#macro ARM_VAR_NAT "arm_var_nat"
	
	#endregion

#endregion

#region //item data

	#macro ITEM_HEAL1 "item_heal1"
	#macro ITEM_HEAL2 "item_heal2"
	#macro ITEM_HEAL3 "item_heal3"
	
	#macro ITEM_RAISE1 "item_raise1"
	#macro ITEM_RAISE2 "item_raise2"
	
	#macro ITEM_CURE1 "item_cure1"
	#macro ITEM_CURE2 "item_cure2"
	
	#macro ITEM_IMM_FIR "item_imm_fir"
	#macro ITEM_IMM_ICE "item_imm_ice"
	#macro ITEM_IMM_LGT "item_imm_lgt"
	#macro ITEM_IMM_DRK "item_imm_drk"
	#macro ITEM_IMM_ELC "item_imm_elc"
	#macro ITEM_IMM_NAT "item_imm_nat"

#endregion

#region //mission data

	#region //mission list
	
		//debug room
		#macro MSN_DEBUG "msn_debug"
	
		//north loewi
		#macro MSN_NLOEWI_01 "msn_nLoewi_01"
		#macro MSN_NLOEWI_02 "msn_nLoewi_02"
		
		//venus woods
		#macro MSN_VWOODS_01 "msn_vWoods_01"
		
		//venus canal
		#macro MSN_VCANAL_01 "msn_vCanal_01"
		
		//naiboros tundra
		#macro MSN_NABTUNDRA_01 "msn_nabTundra_01"
	
	#endregion
	
	#region //mission vars
	
		#macro MSN_VAR_ID "msn_var_id"
		#macro MSN_VAR_NAME "msn_var_name"
		#macro MSN_VAR_CLIENT "msn_var_client"
		#macro MSN_VAR_REWARD "msn_var_reward"
		
		#macro MSN_VAR_DESC_LOC "msn_var_desc_loc" //location
		#macro MSN_VAR_DESC_TGT "msn_var_desc_tgt" //target
		#macro MSN_VAR_DESC_OBJ "msn_var_desc_obj" //objective
		#macro MSN_VAR_DESC_SCR "msn_var_desc_scr" //briefing script
		
		#macro MSN_VAR_MAP_SPR "msn_var_map_spr"
		
		#macro MSN_VAR_INTRO_DIA "msn_var_intro_dia"
		#macro MSN_VAR_OUTRO_DIA "msn_var_outro_dia"
		#macro MSN_VAR_HANDLER "msn_var_handler"
		#macro MSN_VAR_TIMER "msn_var_timer" //time limit
		#macro MSN_VAR_STATUS "msn_var_status" //0: not yet available, 1: available, 2: completed, 3: incomplete/failed - no longer available
	
		#macro MSN_VAR_PAR_TIME_S "msn_var_par_time_s" //time rank, in seconds
		#macro MSN_VAR_PAR_TIME_C "msn_var_par_time_c"
		#macro MSN_VAR_PAR_DMG_S "msn_var_par_dmg_s" //damage rank
		#macro MSN_VAR_PAR_DMG_C "msn_var_par_dmg_c"
		#macro MSN_VAR_PAR_EXPL_S "msn_var_par_expl_s" //exploration rank, in percent
		#macro MSN_VAR_PAR_EXPL_C "msn_var_par_expl_c"
		
	#endregion
	
	#region //handler event vars
	
		#macro MHE_ETILE "mhe_eTile" //use in conjunction with a number to trigger a mission handler event
	
		#macro MHE_VAR_X 0
		#macro MHE_VAR_Y 1
		#macro MHE_VAR_VIS 2 //when true, show event tile on map
	
	#endregion
	
	#region //mission clear screen vars
	
		#macro MCS_BG "mcs_bg"
		#macro MCS_TITLE "mcs_title"
		#macro MCS_MVP "mcs_mvp"
		#macro MCS_EXP "mcs_exp" //explore score
		#macro MCS_DMG "mcs_dmg" //damage score
		#macro MCS_SPD "mcs_spd" //speed score
		#macro MCS_BONUS "mcs_bonus" //gold bonus
		#macro MCS_GOLD "mcs_gold" //total reward
		
		#macro MCS_ICON_SPD "mcs_icon_spd"
		#macro MCS_ICON_DMG "mcs_icon_dmg"
		#macro MCS_ICON_EXP "mcs_icon_exp"
		
		#macro MCS_DISP_SPD "mcs_disp_spd"
		#macro MCS_TGT_SPD "mcs_tgt_spd"
		#macro MCS_DISP_DMG "mcs_disp_dmg"
		#macro MCS_TGT_DMG "mcs_tgt_dmg"
		#macro MCS_DISP_EXP "mcs_disp_exp"
		#macro MCS_TGT_EXP "mcs_tgt_exp"
		#macro MCS_DISP_BONUS "mcs_disp_bonus"
		#macro MCS_TGT_BONUS "mcs_tgt_bonus"
		#macro MCS_DISP_GOLD "mcs_disp_gold"
		#macro MCS_TGT_GOLD "mcs_tgt_gold"
		
		#macro MCS_ALIGNX 100
		#macro MCS_STARTY 170
		#macro MCS_GAPY 110
	
	#endregion

#endregion

#region //dMap data
	
	#region //terrain
	
		#macro DMAP_TER_FLOOR 0
	
	#endregion
	
#endregion

#region //event listeners

	#macro EVENT_BATTLM_INIT "event_battlm_init"
	#macro EVENT_BATTLM_ICONREFRESH "event_battlm_iconRefresh"
	
	#macro EVENT_DND_ENCOUNTER "event_dnd_encounter"
	#macro EVENT_DND_ENCOUNTER_FIXED "event_dnd_encounter_fixed"
	#macro EVENT_DND_BATTLEWIN "event_dnd_battleWin"
	
	#macro EVENT_ACT_USE "event_act_use"
	
	#macro EVENT_MENU_RESIZEPANEL "event_menu_resizePanel"
	#macro EVENT_MENU_REFRESHMENUUI "event_menu_refreshMenuUI"
	
	#macro EVENT_FPO_FADEKILL "event_fpo_fadeKill"
	
	#macro EVENT_DIA_NEXTLINE "event_dia_nextLine"
	
	#macro EVENT_CLASS_BASESTATADD "event_class_baseStatAdd" //called during battlm_init
	#macro EVENT_CLASS_SKILLREFRESH "event_class_skillRefresh"
	
	#macro EVENT_EFFECT_STANCEDRAW "event_effect_stanceDraw"
	
	#macro EVENT_BATTLE_ENEMYKILLED "event_battle_enemyKilled"

#endregion

#region //dialogue data
	
	#macro DIA_NAME 0
	#macro DIA_TXT 1
	
	#macro DIA_SPR_L 2
	#macro DIA_SPR_R 3
	
	#macro DIA_FOCUS_L 4
	#macro DIA_FOCUS_R 5
	
	#macro DIA_REFR_L 6
	#macro DIA_REFR_R 7
	
	#macro DIA_BG 8
	#macro DIA_SCR 9 //used to determine grid width, must be last value
	
#endregion

#region //input check

	#macro IC_KEY_UP 0
	#macro IC_KEY_LEFT 1
	#macro IC_KEY_RIGHT 2
	#macro IC_KEY_DOWN 3
	#macro IC_KEY_PARTY1 4
	#macro IC_KEY_PARTY2 5
	#macro IC_KEY_PARTY3 6
	#macro IC_KEY_PARTYITEM 7
	#macro IC_KEY_PARTYSHIFT 8
	#macro IC_KEY_MENUACCEPT 9
	#macro IC_KEY_MENUBACK 10
	#macro IC_KEY_MENUEXTRA 11
	#macro IC_KEY_MENUPAGE 12
	#macro IC_KEY_PAUSE 13
	
	#macro IC_CHECK_DOWN 0
	#macro IC_CHECK_PRESS 1
	#macro IC_CHECK_RELEASE 2

#endregion

#region //flags

	#macro FG_SHOPPROGRESS "fg_shopProgress"

#endregion