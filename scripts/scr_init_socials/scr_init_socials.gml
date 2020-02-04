ds_grid_destroy(global.grd_socials);
global.grd_socials = ds_grid_create(2,1);

var SV_map;

SV_map = scr_data_social_new(SOC_EEVOKER);
SV_map[? SOC_VAR_NAME] = "Excited Evoker";
SV_map[? SOC_VAR_DIA] = scr_dia_build_social_excitedEvoker;

SV_map = scr_data_social_new(SOC_DCHEF);
SV_map[? SOC_VAR_NAME] = "Disgruntled Chef";
SV_map[? SOC_VAR_DIA] = scr_dia_build_social_disgruntledChef;

SV_map = scr_data_social_new(SOC_SRAZER);
SV_map[? SOC_VAR_NAME] = "Serious Razer";
SV_map[? SOC_VAR_DIA] = scr_dia_build_social_seriousRazer;

SV_map = scr_data_social_new(SOC_MENTOR);
SV_map[? SOC_VAR_NAME] = "Mentor Player";
SV_map[? SOC_VAR_DIA] = scr_dia_build_social_mentorPlayer;

SV_map = scr_data_social_new(SOC_SKNIGHT);
SV_map[? SOC_VAR_NAME] = "Sulking Knight";
SV_map[? SOC_VAR_DIA] = scr_dia_build_social_sulkingKnight;

SV_map = scr_data_social_new(SOC_VACE);
SV_map[? SOC_VAR_NAME] = "Veteran Ace";
SV_map[? SOC_VAR_DIA] = scr_dia_build_social_vetAce;

SV_map = scr_data_social_new(SOC_NACE);
SV_map[? SOC_VAR_NAME] = "Novice Ace";
SV_map[? SOC_VAR_DIA] = scr_dia_build_social_noviceAce;

SV_map = scr_data_social_new(SOC_AZOD);
SV_map[? SOC_VAR_NAME] = "Annoyed Zodiac";
SV_map[? SOC_VAR_DIA] = scr_dia_build_social_annoyedZodiac;

SV_map = scr_data_social_new(SOC_WANDERERTIP);
SV_map[? SOC_VAR_NAME] = "Lethargic Hunter";
SV_map[? SOC_VAR_DIA] = scr_dia_build_social_wandererTip;

SV_map = scr_data_social_new(SOC_BBULLETTIP);
SV_map[? SOC_VAR_NAME] = "Analytical Hunter";
SV_map[? SOC_VAR_DIA] = scr_dia_build_social_bleedingBulletTip;

SV_map = scr_data_social_new(SOC_WOLFEANTTIP);
SV_map[? SOC_VAR_NAME] = "Scared Hunter";
SV_map[? SOC_VAR_DIA] = scr_dia_build_social_wolfeantTip;

SV_map = scr_data_social_new(SOC_ARI_JOIN1);
SV_map[? SOC_VAR_NAME] = "Ari";
SV_map[? SOC_VAR_DIA] = scr_dia_build_social_ari_joinQuestStart;

ds_grid_resize(global.grd_socials,ds_grid_width(global.grd_socials),ds_grid_height(global.grd_socials) + -1);