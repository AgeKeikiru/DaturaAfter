ds_grid_destroy(global.grd_chars);
global.grd_chars = ds_grid_create(2,en_chars.LENGTH);
ds_grid_clear(global.grd_chars,noone);

var
SV_map,
SV_o;

#region //imo
    SV_map = scr_data_char_new(en_chars.imolei,CHAR_IMOLEI,true);
    SV_map[? CHAR_VAR_NAMEFULL] = "Imo'lei Nari";
    SV_map[? CHAR_VAR_NAMEDISP] = "Imo'lei";
    SV_map[? CHAR_VAR_DESC] = "TBA";
    /*
    likes physical activity, competition
    hates being underestimated, scheming
    favorite movie genre: samurai cinema
    */
    SV_map[? CHAR_VAR_RACE] = RACE_HUMAN;
    SV_map[? CHAR_VAR_HP] = 800 + (0 * DEBUG);
    SV_map[? CHAR_VAR_EN] = 1200;
    SV_map[? CHAR_VAR_MATK] = 10;
    SV_map[? CHAR_VAR_MDEF] = -5;
    SV_map[? CHAR_VAR_FATK] = -35;
    SV_map[? CHAR_VAR_FDEF] = -5;
    SV_map[? CHAR_VAR_SATK] = 10;
    SV_map[? CHAR_VAR_SDEF] = -5;
    SV_map[? CHAR_VAR_ACC] = 5;
    SV_map[? CHAR_VAR_EVA] = 5;
    SV_map[? CHAR_VAR_SPD] = 10;
    SV_map[? CHAR_VAR_MISC] = 0;
    SV_map[? CHAR_VAR_ELE_FIR] = 0;
    SV_map[? CHAR_VAR_ELE_ICE] = 10;
    SV_map[? CHAR_VAR_ELE_NAT] = 0;
    SV_map[? CHAR_VAR_ELE_ELC] = 0;
    SV_map[? CHAR_VAR_ELE_DRK] = 0;
    SV_map[? CHAR_VAR_ELE_LGT] = 0;
    SV_map[? CHAR_VAR_SPR_BATTLEPORT] = spr_imo_battlePort;
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = spr_imo_neutral;
    SV_map[? CHAR_VAR_ABDO_X] = -400;
    SV_map[? CHAR_VAR_ABDO_Y] = 130;
    SV_map[? CHAR_VAR_PSDO_ACT_X] = -170;
    SV_map[? CHAR_VAR_PSDO_ACT_Y] = 5;
    SV_map[? CHAR_VAR_PSDO_ARM_X] = 70;
    SV_map[? CHAR_VAR_PSDO_ARM_Y] = -100;
    SV_map[? CHAR_VAR_PSDO_CLS_X] = -30;
    SV_map[? CHAR_VAR_PSDO_CLS_Y] = 70;
    SV_map[? CHAR_VAR_UCLASS] = instance_create_depth(0,0,0,obj_handler_class_uImolei);
    
    var SV_map2 = scr_data_char_new(en_chars.pvp_imo,CHAR_PVP_IMO);
    ds_map_copy(SV_map2,SV_map);
    SV_map2[? CHAR_VAR_ID] = CHAR_PVP_IMO;
    SV_map2[? CHAR_VAR_UCLASS] = noone;
    SV_map2[? CHAR_VAR_SPR_BATTLEPORT] = spr_enemy_imo;
    SV_map2[? CHAR_VAR_SPR_NEUTRAL] = spr_enemy_imo;
    SV_map2[? CHAR_VAR_ABDO_X] = 0;
    SV_map2[? CHAR_VAR_ABDO_Y] = 90;
#endregion

#region //blaze
    SV_map = scr_data_char_new(en_chars.blaze,CHAR_BLAZE,true);
    SV_map[? CHAR_VAR_NAMEFULL] = "Blaze Nari";
    SV_map[? CHAR_VAR_NAMEDISP] = "Blaze";
    SV_map[? CHAR_VAR_DESC] = "Nimble and fierce, Blaze prefers wearing enemies down via status effects to make mass eliminations easy with a hail of bullets and magic.";
    /*
    likes tech, acting
    hates drama not about her, being unprepared
    favorite weapon type: shotgun
    */
    SV_map[? CHAR_VAR_RACE] = RACE_HUMAN;
    SV_map[? CHAR_VAR_HP] = 750;
    SV_map[? CHAR_VAR_EN] = 1400;
    SV_map[? CHAR_VAR_MATK] = -25;
    SV_map[? CHAR_VAR_MDEF] = -5;
    SV_map[? CHAR_VAR_FATK] = 15;
    SV_map[? CHAR_VAR_FDEF] = -5;
    SV_map[? CHAR_VAR_SATK] = 10;
    SV_map[? CHAR_VAR_SDEF] = -5;
    SV_map[? CHAR_VAR_ACC] = 5;
    SV_map[? CHAR_VAR_EVA] = 10;
    SV_map[? CHAR_VAR_SPD] = 10;
    SV_map[? CHAR_VAR_MISC] = -10;
    SV_map[? CHAR_VAR_ELE_FIR] = 0;
    SV_map[? CHAR_VAR_ELE_ICE] = 10;
    SV_map[? CHAR_VAR_ELE_NAT] = 0;
    SV_map[? CHAR_VAR_ELE_ELC] = 0;
    SV_map[? CHAR_VAR_ELE_DRK] = 0;
    SV_map[? CHAR_VAR_ELE_LGT] = 0;
    SV_map[? CHAR_VAR_SPR_BATTLEPORT] = spr_blaze_battlePort;
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = spr_blaze_neutral;
    SV_map[? CHAR_VAR_ABDO_X] = -300;
    SV_map[? CHAR_VAR_ABDO_Y] = 130;
    SV_map[? CHAR_VAR_PSDO_ACT_X] = 120;
    SV_map[? CHAR_VAR_PSDO_ACT_Y] = 80;
    SV_map[? CHAR_VAR_PSDO_ARM_X] = 50;
    SV_map[? CHAR_VAR_PSDO_ARM_Y] = -190;
    SV_map[? CHAR_VAR_PSDO_CLS_X] = -150;
    SV_map[? CHAR_VAR_PSDO_CLS_Y] = 70;
    
    var SV_map2 = scr_data_char_new(en_chars.pvp_blaze,CHAR_PVP_BLAZE);
    ds_map_copy(SV_map2,SV_map);
    SV_map2[? CHAR_VAR_ID] = CHAR_PVP_BLAZE;
    SV_map2[? CHAR_VAR_UCLASS] = noone;
    SV_map2[? CHAR_VAR_SPR_BATTLEPORT] = spr_enemy_blaze;
    SV_map2[? CHAR_VAR_SPR_NEUTRAL] = spr_enemy_blaze;
    SV_map2[? CHAR_VAR_ABDO_X] = 0;
    SV_map2[? CHAR_VAR_ABDO_Y] = 90;
    
    var SV_map2 = scr_data_char_new(en_chars.guest_blaze,CHAR_GUEST_BLAZE);
    ds_map_copy(SV_map2,SV_map);
    SV_map2[? CHAR_VAR_ID] = CHAR_GUEST_BLAZE;
    SV_map2[? CHAR_VAR_UCLASS] = noone;
    SV_map2[? CHAR_VAR_GUEST] = true;
#endregion

#region //altai
    SV_map = scr_data_char_new(en_chars.altai,CHAR_ALTAI,true);
    SV_map[? CHAR_VAR_NAMEFULL] = "Altai Haragin";
    SV_map[? CHAR_VAR_NAMEDISP] = "Altai";
    SV_map[? CHAR_VAR_DESC] = "An archetypical support battery, Altai provides superior resilience and spell aptitude making her most suited to a healer or secondary tank role.";
    SV_map[? CHAR_VAR_RACE] = RACE_DRACON;
    SV_map[? CHAR_VAR_HP] = 1100;
    SV_map[? CHAR_VAR_EN] = 2200;
    SV_map[? CHAR_VAR_MATK] = -10;
    SV_map[? CHAR_VAR_MDEF] = 5;
    SV_map[? CHAR_VAR_FATK] = -10;
    SV_map[? CHAR_VAR_FDEF] = 5;
    SV_map[? CHAR_VAR_SATK] = 0;
    SV_map[? CHAR_VAR_SDEF] = 25;
    SV_map[? CHAR_VAR_ACC] = 0;
    SV_map[? CHAR_VAR_EVA] = -5;
    SV_map[? CHAR_VAR_SPD] = 0;
    SV_map[? CHAR_VAR_MISC] = 6;
    SV_map[? CHAR_VAR_ELE_FIR] = 10;
    SV_map[? CHAR_VAR_ELE_ICE] = 0;
    SV_map[? CHAR_VAR_ELE_NAT] = 0;
    SV_map[? CHAR_VAR_ELE_ELC] = 0;
    SV_map[? CHAR_VAR_ELE_DRK] = 0;
    SV_map[? CHAR_VAR_ELE_LGT] = 10;
    SV_map[? CHAR_VAR_SPR_BATTLEPORT] = spr_altai_battlePort;
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = spr_altai_neutral;
    SV_map[? CHAR_VAR_ABDO_X] = -235;
    SV_map[? CHAR_VAR_ABDO_Y] = 100;
    SV_map[? CHAR_VAR_PSDO_ACT_X] = -300;
    SV_map[? CHAR_VAR_PSDO_ACT_Y] = -465;
    SV_map[? CHAR_VAR_PSDO_ARM_X] = -180;
    SV_map[? CHAR_VAR_PSDO_ARM_Y] = -100;
    SV_map[? CHAR_VAR_PSDO_CLS_X] = -120;
    SV_map[? CHAR_VAR_PSDO_CLS_Y] = 190;
    
    var SV_map2 = scr_data_char_new(en_chars.guest_altai,CHAR_GUEST_ALTAI);
    ds_map_copy(SV_map2,SV_map);
    SV_map2[? CHAR_VAR_ID] = CHAR_GUEST_ALTAI;
    SV_map2[? CHAR_VAR_UCLASS] = noone;
    SV_map2[? CHAR_VAR_GUEST] = true;
#endregion

#region //witchy
    SV_map = scr_data_char_new(en_chars.witchy,CHAR_WITCHY,true);
    SV_map[? CHAR_VAR_NAMEFULL] = "Witchford Kohn";
    SV_map[? CHAR_VAR_NAMEDISP] = "Witchy";
    SV_map[? CHAR_VAR_DESC] = "A wall that packs a punch, Witchy is second-to-none in sheer resilience, but can be built into a respectable DPS if need be.";
    SV_map[? CHAR_VAR_RACE] = RACE_BESTIA;
    SV_map[? CHAR_VAR_HP] = 2000;
    SV_map[? CHAR_VAR_EN] = 700;
    SV_map[? CHAR_VAR_MATK] = 5;
    SV_map[? CHAR_VAR_MDEF] = 20;
    SV_map[? CHAR_VAR_FATK] = -10;
    SV_map[? CHAR_VAR_FDEF] = 10;
    SV_map[? CHAR_VAR_SATK] = 0;
    SV_map[? CHAR_VAR_SDEF] = 10;
    SV_map[? CHAR_VAR_ACC] = -5;
    SV_map[? CHAR_VAR_EVA] = -10;
    SV_map[? CHAR_VAR_SPD] = -10;
    SV_map[? CHAR_VAR_MISC] = 4;
    SV_map[? CHAR_VAR_ELE_FIR] = 0;
    SV_map[? CHAR_VAR_ELE_ICE] = 0;
    SV_map[? CHAR_VAR_ELE_NAT] = 20;
    SV_map[? CHAR_VAR_ELE_ELC] = 0;
    SV_map[? CHAR_VAR_ELE_DRK] = 0;
    SV_map[? CHAR_VAR_ELE_LGT] = 0;
    SV_map[? CHAR_VAR_SPR_BATTLEPORT] = spr_witchy_battlePort;
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = spr_witchy_neutral;
    SV_map[? CHAR_VAR_ABDO_X] = -320;
    SV_map[? CHAR_VAR_ABDO_Y] = 190;
    SV_map[? CHAR_VAR_PSDO_ACT_X] = -150;
    SV_map[? CHAR_VAR_PSDO_ACT_Y] = 10;
    SV_map[? CHAR_VAR_PSDO_ARM_X] = 140;
    SV_map[? CHAR_VAR_PSDO_ARM_Y] = 30;
    SV_map[? CHAR_VAR_PSDO_CLS_X] = -190;
    SV_map[? CHAR_VAR_PSDO_CLS_Y] = -390;
    
    var SV_map2 = scr_data_char_new(en_chars.guest_witchy,CHAR_GUEST_WITCHY);
    ds_map_copy(SV_map2,SV_map);
    SV_map2[? CHAR_VAR_ID] = CHAR_GUEST_WITCHY;
    SV_map2[? CHAR_VAR_UCLASS] = noone;
    SV_map2[? CHAR_VAR_GUEST] = true;
#endregion

#region //aile
    SV_map = scr_data_char_new(en_chars.aile,CHAR_AILE,true);
    SV_map[? CHAR_VAR_NAMEFULL] = "Aile Ferrox";
    SV_map[? CHAR_VAR_NAMEDISP] = "Aile";
    SV_map[? CHAR_VAR_DESC] = "TBA";
    SV_map[? CHAR_VAR_RACE] = RACE_ARTIFICE;
    SV_map[? CHAR_VAR_HP] = 650 + (-0 * DEBUG);
    SV_map[? CHAR_VAR_EN] = 2000;
    SV_map[? CHAR_VAR_MATK] = 5;
    SV_map[? CHAR_VAR_MDEF] = 0;
    SV_map[? CHAR_VAR_FATK] = 5;
    SV_map[? CHAR_VAR_FDEF] = 0;
    SV_map[? CHAR_VAR_SATK] = 5;
    SV_map[? CHAR_VAR_SDEF] = 20;
    SV_map[? CHAR_VAR_ACC] = 10;
    SV_map[? CHAR_VAR_EVA] = 15;
    SV_map[? CHAR_VAR_SPD] = 5;
    SV_map[? CHAR_VAR_MISC] = 5;
    SV_map[? CHAR_VAR_ELE_FIR] = 0;
    SV_map[? CHAR_VAR_ELE_ICE] = 0;
    SV_map[? CHAR_VAR_ELE_NAT] = 0;
    SV_map[? CHAR_VAR_ELE_ELC] = 0;
    SV_map[? CHAR_VAR_ELE_DRK] = 0;
    SV_map[? CHAR_VAR_ELE_LGT] = 10;
    SV_map[? CHAR_VAR_SPR_BATTLEPORT] = spr_aile_battlePort;
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = spr_aile_neutral;
    SV_map[? CHAR_VAR_ABDO_X] = -50;
    SV_map[? CHAR_VAR_ABDO_Y] = 120;
    SV_map[? CHAR_VAR_PSDO_ACT_X] = 115;
    SV_map[? CHAR_VAR_PSDO_ACT_Y] = -270;
    SV_map[? CHAR_VAR_PSDO_ARM_X] = -130;
    SV_map[? CHAR_VAR_PSDO_ARM_Y] = -110;
    SV_map[? CHAR_VAR_PSDO_CLS_X] = 1;
    SV_map[? CHAR_VAR_PSDO_CLS_Y] = -60;
    SV_map[? CHAR_VAR_UCLASS] = instance_create_depth(0,0,0,obj_handler_class_uAile);
    
    var SV_map2 = scr_data_char_new(en_chars.pvp_aile,CHAR_PVP_AILE);
    ds_map_copy(SV_map2,SV_map);
    SV_map2[? CHAR_VAR_ID] = CHAR_PVP_AILE;
    SV_map2[? CHAR_VAR_UCLASS] = noone;
    SV_map2[? CHAR_VAR_SPR_BATTLEPORT] = spr_enemy_aile;
    SV_map2[? CHAR_VAR_SPR_NEUTRAL] = spr_enemy_aile;
    SV_map2[? CHAR_VAR_ABDO_X] = 0;
    SV_map2[? CHAR_VAR_ABDO_Y] = 50;
#endregion

#region //ari
    SV_map = scr_data_char_new(en_chars.ari,CHAR_ARI,true);
    SV_map[? CHAR_VAR_NAMEFULL] = "Ari Ferrox";
    SV_map[? CHAR_VAR_NAMEDISP] = "Ari";
    SV_map[? CHAR_VAR_DESC] = "An all-rounder, Ari is swift and slightly more suited to DPS with moderate bonuses to all ATK stats, but still bulky enough to easily retool into more defensive or support roles.";
    SV_map[? CHAR_VAR_RACE] = RACE_HUMAN;
    SV_map[? CHAR_VAR_HP] = 1100 + (-0 * DEBUG);
    SV_map[? CHAR_VAR_EN] = 1000;
    SV_map[? CHAR_VAR_MATK] = 15;
    SV_map[? CHAR_VAR_MDEF] = -5;
    SV_map[? CHAR_VAR_FATK] = 10;
    SV_map[? CHAR_VAR_FDEF] = -5;
    SV_map[? CHAR_VAR_SATK] = 10;
    SV_map[? CHAR_VAR_SDEF] = 0;
    SV_map[? CHAR_VAR_ACC] = 10;
    SV_map[? CHAR_VAR_EVA] = 5;
    SV_map[? CHAR_VAR_SPD] = 15;
    SV_map[? CHAR_VAR_MISC] = 8;
    SV_map[? CHAR_VAR_ELE_FIR] = 0;
    SV_map[? CHAR_VAR_ELE_ICE] = 0;
    SV_map[? CHAR_VAR_ELE_NAT] = 0;
    SV_map[? CHAR_VAR_ELE_ELC] = 0;
    SV_map[? CHAR_VAR_ELE_DRK] = 0;
    SV_map[? CHAR_VAR_ELE_LGT] = 10;
    SV_map[? CHAR_VAR_SPR_BATTLEPORT] = spr_ari_battlePort;
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = spr_ari_neutral;
    SV_map[? CHAR_VAR_ABDO_X] = -100;
    SV_map[? CHAR_VAR_ABDO_Y] = 110;
    SV_map[? CHAR_VAR_PSDO_ACT_X] = -180;
    SV_map[? CHAR_VAR_PSDO_ACT_Y] = -80;
    SV_map[? CHAR_VAR_PSDO_ARM_X] = 100;
    SV_map[? CHAR_VAR_PSDO_ARM_Y] = -20;
    SV_map[? CHAR_VAR_PSDO_CLS_X] = 70;
    SV_map[? CHAR_VAR_PSDO_CLS_Y] = 90;
#endregion

#region //paprika
    SV_map = scr_data_char_new(en_chars.paprika,CHAR_PAPRIKA,true);
    SV_map[? CHAR_VAR_NAMEFULL] = "Paprika";
    SV_map[? CHAR_VAR_NAMEDISP] = "Paprika";
    SV_map[? CHAR_VAR_DESC] = "TBA";
    SV_map[? CHAR_VAR_RACE] = RACE_BESTIA;
    SV_map[? CHAR_VAR_HP] = 1200 + (-0 * DEBUG);
    SV_map[? CHAR_VAR_EN] = 600;
    SV_map[? CHAR_VAR_MATK] = 0;
    SV_map[? CHAR_VAR_MDEF] = 15;
    SV_map[? CHAR_VAR_FATK] = -10;
    SV_map[? CHAR_VAR_FDEF] = 10;
    SV_map[? CHAR_VAR_SATK] = -5;
    SV_map[? CHAR_VAR_SDEF] = 10;
    SV_map[? CHAR_VAR_ACC] = 0;
    SV_map[? CHAR_VAR_EVA] = -5;
    SV_map[? CHAR_VAR_SPD] = 0;
    SV_map[? CHAR_VAR_MISC] = 6;
    SV_map[? CHAR_VAR_ELE_FIR] = 0;
    SV_map[? CHAR_VAR_ELE_ICE] = 0;
    SV_map[? CHAR_VAR_ELE_NAT] = 10;
    SV_map[? CHAR_VAR_ELE_ELC] = 0;
    SV_map[? CHAR_VAR_ELE_DRK] = 0;
    SV_map[? CHAR_VAR_ELE_LGT] = 0;
    SV_map[? CHAR_VAR_SPR_BATTLEPORT] = spr_paprika_battlePort;
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = spr_paprika_neutral;
    SV_map[? CHAR_VAR_ABDO_X] = -150;
    SV_map[? CHAR_VAR_ABDO_Y] = 180;
    SV_map[? CHAR_VAR_PSDO_ACT_X] = 115;
    SV_map[? CHAR_VAR_PSDO_ACT_Y] = -250;
    SV_map[? CHAR_VAR_PSDO_ARM_X] = -70;
    SV_map[? CHAR_VAR_PSDO_ARM_Y] = -140;
    SV_map[? CHAR_VAR_PSDO_CLS_X] = 20;
    SV_map[? CHAR_VAR_PSDO_CLS_Y] = -90;
    SV_map[? CHAR_VAR_UCLASS] = instance_create_depth(0,0,0,obj_handler_class_uPaprika);
    
    var SV_map2 = scr_data_char_new(en_chars.pvp_paprika,CHAR_PVP_PAPRIKA);
    ds_map_copy(SV_map2,SV_map);
    SV_map2[? CHAR_VAR_ID] = CHAR_PVP_PAPRIKA;
    SV_map2[? CHAR_VAR_UCLASS] = noone;
    SV_map2[? CHAR_VAR_SPR_BATTLEPORT] = spr_enemy_paprika;
    SV_map2[? CHAR_VAR_SPR_NEUTRAL] = spr_enemy_paprika;
    SV_map2[? CHAR_VAR_ABDO_X] = 0;
    SV_map2[? CHAR_VAR_ABDO_Y] = 90;
#endregion

#region //jack
    SV_map = scr_data_char_new(en_chars.jack,CHAR_JACK,true);
    SV_map[? CHAR_VAR_NAMEFULL] = "Baela \"Jack\" Norvecci";
    SV_map[? CHAR_VAR_NAMEDISP] = "Jack";
    SV_map[? CHAR_VAR_DESC] = "An all-rounder, Jack boasts high resilience with serviceable attack power at the cost of poor EN.";
    SV_map[? CHAR_VAR_RACE] = RACE_DRACON;
    SV_map[? CHAR_VAR_HP] = 1400 + (-0 * DEBUG);
    SV_map[? CHAR_VAR_EN] = 600;
    SV_map[? CHAR_VAR_MATK] = 5;
    SV_map[? CHAR_VAR_MDEF] = 10;
    SV_map[? CHAR_VAR_FATK] = 5;
    SV_map[? CHAR_VAR_FDEF] = 10;
    SV_map[? CHAR_VAR_SATK] = 5;
    SV_map[? CHAR_VAR_SDEF] = 10;
    SV_map[? CHAR_VAR_ACC] = 4;
    SV_map[? CHAR_VAR_EVA] = 4;
    SV_map[? CHAR_VAR_SPD] = 8;
    SV_map[? CHAR_VAR_MISC] = 20;
    SV_map[? CHAR_VAR_ELE_FIR] = 20;
    SV_map[? CHAR_VAR_ELE_ICE] = 10;
    SV_map[? CHAR_VAR_ELE_NAT] = 10;
    SV_map[? CHAR_VAR_ELE_ELC] = 10;
    SV_map[? CHAR_VAR_ELE_DRK] = 10;
    SV_map[? CHAR_VAR_ELE_LGT] = 10;
    SV_map[? CHAR_VAR_SPR_BATTLEPORT] = spr_jack_battlePort;
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = spr_jack_neutral;
    SV_map[? CHAR_VAR_ABDO_X] = -120;
    SV_map[? CHAR_VAR_ABDO_Y] = 100;
    SV_map[? CHAR_VAR_PSDO_ACT_X] = -220;
    SV_map[? CHAR_VAR_PSDO_ACT_Y] = -360;
    SV_map[? CHAR_VAR_PSDO_ARM_X] = 70;
    SV_map[? CHAR_VAR_PSDO_ARM_Y] = -30;
    SV_map[? CHAR_VAR_PSDO_CLS_X] = 70;
    SV_map[? CHAR_VAR_PSDO_CLS_Y] = 180;
#endregion

#region //harzer
    SV_map = scr_data_char_new(en_chars.harzer,CHAR_HARZER,true);
    SV_map[? CHAR_VAR_NAMEFULL] = "Harzer Kurtzfelt";
    SV_map[? CHAR_VAR_NAMEDISP] = "Harzer";
    SV_map[? CHAR_VAR_DESC] = "A glass cannon to a fault, Harzer obsesses over attack power but is quite fragile, and faces racial penalties regarding all things spell-based.";
    SV_map[? CHAR_VAR_RACE] = RACE_ARTIFICE;
    SV_map[? CHAR_VAR_HP] = 800 + (-0 * DEBUG);
    SV_map[? CHAR_VAR_EN] = 600;
    SV_map[? CHAR_VAR_MATK] = 10;
    SV_map[? CHAR_VAR_MDEF] = -10;
    SV_map[? CHAR_VAR_FATK] = 15;
    SV_map[? CHAR_VAR_FDEF] = -10;
    SV_map[? CHAR_VAR_SATK] = -20;
    SV_map[? CHAR_VAR_SDEF] = 0;
    SV_map[? CHAR_VAR_ACC] = 2;
    SV_map[? CHAR_VAR_EVA] = 4;
    SV_map[? CHAR_VAR_SPD] = 10;
    SV_map[? CHAR_VAR_MISC] = 2;
    SV_map[? CHAR_VAR_ELE_FIR] = 0;
    SV_map[? CHAR_VAR_ELE_ICE] = 0;
    SV_map[? CHAR_VAR_ELE_NAT] = 0;
    SV_map[? CHAR_VAR_ELE_ELC] = 10;
    SV_map[? CHAR_VAR_ELE_DRK] = 0;
    SV_map[? CHAR_VAR_ELE_LGT] = 0;
    SV_map[? CHAR_VAR_SPR_BATTLEPORT] = spr_harzer_battlePort;
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = spr_harzer_neutral;
    SV_map[? CHAR_VAR_ABDO_X] = -400;
    SV_map[? CHAR_VAR_ABDO_Y] = 120;
    SV_map[? CHAR_VAR_PSDO_ACT_X] = -250;
    SV_map[? CHAR_VAR_PSDO_ACT_Y] = 160;
    SV_map[? CHAR_VAR_PSDO_ARM_X] = 120;
    SV_map[? CHAR_VAR_PSDO_ARM_Y] = -210;
    SV_map[? CHAR_VAR_PSDO_CLS_X] = -70;
    SV_map[? CHAR_VAR_PSDO_CLS_Y] = 150;
#endregion

#region //eschira
    SV_map = scr_data_char_new(en_chars.seethe,CHAR_SEETHE,true);
    SV_map[? CHAR_VAR_NAMEFULL] = "Eschira";
    SV_map[? CHAR_VAR_NAMEDISP] = "Eschira";
    SV_map[? CHAR_VAR_DESC] = "Ever vigilant, Eschira excels in reliably disabling targets with either precision firearm attacks or crippling debuffs.";
    SV_map[? CHAR_VAR_RACE] = RACE_ARTIFICE;
    SV_map[? CHAR_VAR_HP] = 950 + (-0 * DEBUG);
    SV_map[? CHAR_VAR_EN] = 1100;
    SV_map[? CHAR_VAR_MATK] = 5;
    SV_map[? CHAR_VAR_MDEF] = 0;
    SV_map[? CHAR_VAR_FATK] = 15;
    SV_map[? CHAR_VAR_FDEF] = 5;
    SV_map[? CHAR_VAR_SATK] = -20;
    SV_map[? CHAR_VAR_SDEF] = 0;
    SV_map[? CHAR_VAR_ACC] = 10;
    SV_map[? CHAR_VAR_EVA] = 4;
    SV_map[? CHAR_VAR_SPD] = 2;
    SV_map[? CHAR_VAR_MISC] = 4;
    SV_map[? CHAR_VAR_ELE_FIR] = 0;
    SV_map[? CHAR_VAR_ELE_ICE] = 0;
    SV_map[? CHAR_VAR_ELE_NAT] = 0;
    SV_map[? CHAR_VAR_ELE_ELC] = 10;
    SV_map[? CHAR_VAR_ELE_DRK] = 0;
    SV_map[? CHAR_VAR_ELE_LGT] = 0;
    SV_map[? CHAR_VAR_SPR_BATTLEPORT] = spr_eschira_battlePort;
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = spr_eschira_neutral;
    SV_map[? CHAR_VAR_ABDO_X] = -160;
    SV_map[? CHAR_VAR_ABDO_Y] = 110;
    SV_map[? CHAR_VAR_PSDO_ACT_X] = -100;
    SV_map[? CHAR_VAR_PSDO_ACT_Y] = -250;
    SV_map[? CHAR_VAR_PSDO_ARM_X] = 230;
    SV_map[? CHAR_VAR_PSDO_ARM_Y] = -500;
    SV_map[? CHAR_VAR_PSDO_CLS_X] = 85;
    SV_map[? CHAR_VAR_PSDO_CLS_Y] = 90;
#endregion

#region //mina
    SV_map = scr_data_char_new(en_chars.mina,CHAR_MINA,true);
    SV_map[? CHAR_VAR_NAMEFULL] = "Mina Ajett";
    SV_map[? CHAR_VAR_NAMEDISP] = "Mina";
    SV_map[? CHAR_VAR_DESC] = "With an unorthodox stat spread, Mina often struggles by herself but can be built to fill powerful niche roles given the right equipment.";
    SV_map[? CHAR_VAR_RACE] = RACE_HUMAN;
    SV_map[? CHAR_VAR_HP] = 650;
    SV_map[? CHAR_VAR_EN] = 800;
    SV_map[? CHAR_VAR_MATK] = 5;
    SV_map[? CHAR_VAR_MDEF] = 5;
    SV_map[? CHAR_VAR_FATK] = -10;
    SV_map[? CHAR_VAR_FDEF] = -10;
    SV_map[? CHAR_VAR_SATK] = 10;
    SV_map[? CHAR_VAR_SDEF] = 0;
    SV_map[? CHAR_VAR_ACC] = 20;
    SV_map[? CHAR_VAR_EVA] = 10;
    SV_map[? CHAR_VAR_SPD] = 30;
    SV_map[? CHAR_VAR_MISC] = 20;
    SV_map[? CHAR_VAR_ELE_FIR] = 0;
    SV_map[? CHAR_VAR_ELE_ICE] = 0;
    SV_map[? CHAR_VAR_ELE_NAT] = 0;
    SV_map[? CHAR_VAR_ELE_ELC] = 50;
    SV_map[? CHAR_VAR_ELE_DRK] = 0;
    SV_map[? CHAR_VAR_ELE_LGT] = 0;
    SV_map[? CHAR_VAR_SPR_BATTLEPORT] = spr_mina_battlePort;
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = spr_mina_neutral;
    SV_map[? CHAR_VAR_ABDO_X] = -140;
    SV_map[? CHAR_VAR_ABDO_Y] = 160;
    SV_map[? CHAR_VAR_PSDO_ACT_X] = 120;
    SV_map[? CHAR_VAR_PSDO_ACT_Y] = 0;
    SV_map[? CHAR_VAR_PSDO_ARM_X] = -80;
    SV_map[? CHAR_VAR_PSDO_ARM_Y] = 10;
    SV_map[? CHAR_VAR_PSDO_CLS_X] = -110;
    SV_map[? CHAR_VAR_PSDO_CLS_Y] = -90;
    
    var SV_map2 = scr_data_char_new(en_chars.guest_mina,CHAR_GUEST_MINA);
    ds_map_copy(SV_map2,SV_map);
    SV_map2[? CHAR_VAR_ID] = CHAR_GUEST_MINA;
    SV_map2[? CHAR_VAR_UCLASS] = noone;
    SV_map2[? CHAR_VAR_NAMEDISP] = "???";
    SV_map2[? CHAR_VAR_GUEST] = true;
#endregion

#region //slime
    SV_map = scr_data_char_new(en_chars.slime,CHAR_SLIME);
    SV_map[? CHAR_VAR_NAMEFULL] = "Slime";
    SV_map[? CHAR_VAR_NAMEDISP] = SV_map[? CHAR_VAR_NAMEFULL];
    
    SV_map[? CHAR_VAR_DESC] =
    "By and large the most widespread species of monster around the world, slimes are formed typically as a byproduct of magical processes and applications." +
    "\n" +
    "The generic slime is mostly not a threat - slow, easy to dodge, and easier to hit, their only real strength is being relatively tanky among low-rank monsters." +
    "An inattentive or weakened party can still be wiped out by a pack of slimes, but generally speaking basic battle strategy is more than enough to take out even a horde of them." +
    "\n" +
    "Has a basic melee attack.";
    
    SV_map[? CHAR_VAR_RACE] = RACE_OOZE;
    SV_map[? CHAR_VAR_HP] = 900;
    SV_map[? CHAR_VAR_MATK] = 5;
    SV_map[? CHAR_VAR_MDEF] = 10;
    SV_map[? CHAR_VAR_FATK] = 0;
    SV_map[? CHAR_VAR_FDEF] = 5;
    SV_map[? CHAR_VAR_SATK] = 0;
    SV_map[? CHAR_VAR_SDEF] = -15;
    SV_map[? CHAR_VAR_ACC] = 0;
    SV_map[? CHAR_VAR_EVA] = -10;
    SV_map[? CHAR_VAR_SPD] = -5;
    SV_map[? CHAR_VAR_MISC] = 0;
    SV_map[? CHAR_VAR_ELE_FIR] = -20;
    SV_map[? CHAR_VAR_ELE_ICE] = -20;
    SV_map[? CHAR_VAR_ELE_NAT] = 50;
    SV_map[? CHAR_VAR_ELE_ELC] = 0;
    SV_map[? CHAR_VAR_ELE_DRK] = 0;
    SV_map[? CHAR_VAR_ELE_LGT] = 0;
    SV_map[? CHAR_VAR_SPR_BATTLEPORT] = spr_enemy_slime;
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = SV_map[? CHAR_VAR_SPR_BATTLEPORT];
    SV_map[? CHAR_VAR_ABDO_X] = 0;
    SV_map[? CHAR_VAR_ABDO_Y] = 50;
#endregion

#region //paraslime
    SV_map = scr_data_char_new(en_chars.paraslime,CHAR_PARASLIME);
    SV_map[? CHAR_VAR_NAMEFULL] = "Paraslime";
    SV_map[? CHAR_VAR_NAMEDISP] = SV_map[? CHAR_VAR_NAMEFULL];
    
    SV_map[? CHAR_VAR_DESC] =
    "A subspecies of slime whose bodies appear to be almost entirely comprised of a structure very similar to that of the electric organ found in electrogenic animals." +
    "\n" +
    "This electric variant is slightly more resilient, and near-fully immune to electric attacks, but is ultimately still a low-rank monster that shouldn't be worried about too much." +
    "\n" +
    "Has a basic melee attack that will occasionally be charged with electricity for an added punch." +
    "The electric version has a chance to paralyze if it connects, so eliminating this enemy should be top priority for players who heavily rely on stances.";
    
    SV_map[? CHAR_VAR_RACE] = RACE_OOZE;
    SV_map[? CHAR_VAR_HP] = 1200;
    SV_map[? CHAR_VAR_MATK] = 10;
    SV_map[? CHAR_VAR_MDEF] = 10;
    SV_map[? CHAR_VAR_FATK] = 0;
    SV_map[? CHAR_VAR_FDEF] = 10;
    SV_map[? CHAR_VAR_SATK] = 0;
    SV_map[? CHAR_VAR_SDEF] = -15;
    SV_map[? CHAR_VAR_ACC] = -5;
    SV_map[? CHAR_VAR_EVA] = -10;
    SV_map[? CHAR_VAR_SPD] = -5;
    SV_map[? CHAR_VAR_MISC] = 0;
    SV_map[? CHAR_VAR_ELE_FIR] = -20;
    SV_map[? CHAR_VAR_ELE_ICE] = -20;
    SV_map[? CHAR_VAR_ELE_NAT] = 0;
    SV_map[? CHAR_VAR_ELE_ELC] = 90;
    SV_map[? CHAR_VAR_ELE_DRK] = 0;
    SV_map[? CHAR_VAR_ELE_LGT] = 0;
    SV_map[? CHAR_VAR_SPR_BATTLEPORT] = spr_enemy_paraslime;
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = SV_map[? CHAR_VAR_SPR_BATTLEPORT];
    SV_map[? CHAR_VAR_ABDO_X] = 0;
    SV_map[? CHAR_VAR_ABDO_Y] = 50;
#endregion

#region //flameslime
    SV_map = scr_data_char_new(en_chars.flameslime,CHAR_FLAMESLIME);
    SV_map[? CHAR_VAR_NAMEFULL] = "Flameslime";
    SV_map[? CHAR_VAR_NAMEDISP] = SV_map[? CHAR_VAR_NAMEFULL];
    
    SV_map[? CHAR_VAR_DESC] =
    "TBA";
    
    SV_map[? CHAR_VAR_RACE] = RACE_OOZE;
    SV_map[? CHAR_VAR_HP] = 1000;
    SV_map[? CHAR_VAR_MATK] = 10;
    SV_map[? CHAR_VAR_MDEF] = 20;
    SV_map[? CHAR_VAR_FATK] = 0;
    SV_map[? CHAR_VAR_FDEF] = 10;
    SV_map[? CHAR_VAR_SATK] = 0;
    SV_map[? CHAR_VAR_SDEF] = -15;
    SV_map[? CHAR_VAR_ACC] = -5;
    SV_map[? CHAR_VAR_EVA] = -15;
    SV_map[? CHAR_VAR_SPD] = -5;
    SV_map[? CHAR_VAR_MISC] = 0;
    SV_map[? CHAR_VAR_ELE_FIR] = 90;
    SV_map[? CHAR_VAR_ELE_ICE] = -60;
    SV_map[? CHAR_VAR_ELE_NAT] = 0;
    SV_map[? CHAR_VAR_ELE_ELC] = 0;
    SV_map[? CHAR_VAR_ELE_DRK] = 0;
    SV_map[? CHAR_VAR_ELE_LGT] = 0;
    SV_map[? CHAR_VAR_SPR_BATTLEPORT] = spr_enemy_flameslime;
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = SV_map[? CHAR_VAR_SPR_BATTLEPORT];
    SV_map[? CHAR_VAR_ABDO_X] = 0;
    SV_map[? CHAR_VAR_ABDO_Y] = 50;
#endregion

#region //froslime
    SV_map = scr_data_char_new(en_chars.froslime,CHAR_FROSLIME);
    SV_map[? CHAR_VAR_NAMEFULL] = "Froslime";
    SV_map[? CHAR_VAR_NAMEDISP] = SV_map[? CHAR_VAR_NAMEFULL];
    
    SV_map[? CHAR_VAR_DESC] =
    "A subspecies of slime whose bodies fluctuate freely between a semi-liquid and crystalline state." +
    "\n" +
    "This frozen variant is noticeably more durable, and is dangerously cold to the touch - one of the few subspecies of slime that can pose an actual threat." +
    "\n" +
    "Has a basic melee attack, but due to its ultra low body temperature this can inflict Slow on contact." +
    "Additionally, when sensing danger Froslimes will often attempt to shift into a completely solid state to defend itself.";
    
    SV_map[? CHAR_VAR_RACE] = RACE_OOZE;
    SV_map[? CHAR_VAR_HP] = 1200;
    SV_map[? CHAR_VAR_MATK] = 10;
    SV_map[? CHAR_VAR_MDEF] = 20;
    SV_map[? CHAR_VAR_FATK] = 0;
    SV_map[? CHAR_VAR_FDEF] = 10;
    SV_map[? CHAR_VAR_SATK] = 0;
    SV_map[? CHAR_VAR_SDEF] = -15;
    SV_map[? CHAR_VAR_ACC] = -5;
    SV_map[? CHAR_VAR_EVA] = -15;
    SV_map[? CHAR_VAR_SPD] = -8;
    SV_map[? CHAR_VAR_MISC] = 0;
    SV_map[? CHAR_VAR_ELE_FIR] = -60;
    SV_map[? CHAR_VAR_ELE_ICE] = 90;
    SV_map[? CHAR_VAR_ELE_NAT] = 0;
    SV_map[? CHAR_VAR_ELE_ELC] = 0;
    SV_map[? CHAR_VAR_ELE_DRK] = 0;
    SV_map[? CHAR_VAR_ELE_LGT] = 0;
    SV_map[? CHAR_VAR_SPR_BATTLEPORT] = spr_enemy_froslime;
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = SV_map[? CHAR_VAR_SPR_BATTLEPORT];
    SV_map[? CHAR_VAR_ABDO_X] = 0;
    SV_map[? CHAR_VAR_ABDO_Y] = 50;
    
    /*
    barrier: def+
    frostackle
    */
#endregion

#region //darkslime
    SV_map = scr_data_char_new(en_chars.darkslime,CHAR_DARKSLIME);
    SV_map[? CHAR_VAR_NAMEFULL] = "Darkslime";
    SV_map[? CHAR_VAR_NAMEDISP] = SV_map[? CHAR_VAR_NAMEFULL];
    
    SV_map[? CHAR_VAR_DESC] =
    "TBA";
    
    SV_map[? CHAR_VAR_RACE] = RACE_OOZE;
    SV_map[? CHAR_VAR_HP] = 1000;
    SV_map[? CHAR_VAR_MATK] = 10;
    SV_map[? CHAR_VAR_MDEF] = 20;
    SV_map[? CHAR_VAR_FATK] = 0;
    SV_map[? CHAR_VAR_FDEF] = 10;
    SV_map[? CHAR_VAR_SATK] = 0;
    SV_map[? CHAR_VAR_SDEF] = -15;
    SV_map[? CHAR_VAR_ACC] = -5;
    SV_map[? CHAR_VAR_EVA] = -15;
    SV_map[? CHAR_VAR_SPD] = -5;
    SV_map[? CHAR_VAR_MISC] = 0;
    SV_map[? CHAR_VAR_ELE_FIR] = -20;
    SV_map[? CHAR_VAR_ELE_ICE] = -20;
    SV_map[? CHAR_VAR_ELE_NAT] = 0;
    SV_map[? CHAR_VAR_ELE_ELC] = 0;
    SV_map[? CHAR_VAR_ELE_DRK] = 50;
    SV_map[? CHAR_VAR_ELE_LGT] = -50;
    SV_map[? CHAR_VAR_SPR_BATTLEPORT] = spr_enemy_darkslime;
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = SV_map[? CHAR_VAR_SPR_BATTLEPORT];
    SV_map[? CHAR_VAR_ABDO_X] = 0;
    SV_map[? CHAR_VAR_ABDO_Y] = 50;
    
    /*
    acid spray: 5 random hits, low poison chance
    */
#endregion

#region //brightslime
    SV_map = scr_data_char_new(en_chars.brightslime,CHAR_BRIGHTSLIME);
    SV_map[? CHAR_VAR_NAMEFULL] = "Brightslime";
    SV_map[? CHAR_VAR_NAMEDISP] = SV_map[? CHAR_VAR_NAMEFULL];
    
    SV_map[? CHAR_VAR_DESC] =
    "TBA";
    
    SV_map[? CHAR_VAR_RACE] = RACE_OOZE;
    SV_map[? CHAR_VAR_HP] = 1000;
    SV_map[? CHAR_VAR_MATK] = 10;
    SV_map[? CHAR_VAR_MDEF] = 30;
    SV_map[? CHAR_VAR_FATK] = 0;
    SV_map[? CHAR_VAR_FDEF] = 30;
    SV_map[? CHAR_VAR_SATK] = 0;
    SV_map[? CHAR_VAR_SDEF] = -15;
    SV_map[? CHAR_VAR_ACC] = -5;
    SV_map[? CHAR_VAR_EVA] = -15;
    SV_map[? CHAR_VAR_SPD] = -8;
    SV_map[? CHAR_VAR_MISC] = 0;
    SV_map[? CHAR_VAR_ELE_FIR] = -20;
    SV_map[? CHAR_VAR_ELE_ICE] = -20;
    SV_map[? CHAR_VAR_ELE_NAT] = 0;
    SV_map[? CHAR_VAR_ELE_ELC] = 0;
    SV_map[? CHAR_VAR_ELE_DRK] = -50;
    SV_map[? CHAR_VAR_ELE_LGT] = 50;
    SV_map[? CHAR_VAR_SPR_BATTLEPORT] = spr_enemy_brightslime;
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = SV_map[? CHAR_VAR_SPR_BATTLEPORT];
    SV_map[? CHAR_VAR_ABDO_X] = 0;
    SV_map[? CHAR_VAR_ABDO_Y] = 50;
    
    /*
    heal
    */
#endregion

#region //minislime
    SV_map = scr_data_char_new(en_chars.minislime,CHAR_MINISLIME);
    SV_map[? CHAR_VAR_NAMEFULL] = "Minislime";
    SV_map[? CHAR_VAR_NAMEDISP] = SV_map[? CHAR_VAR_NAMEFULL];
    
    SV_map[? CHAR_VAR_DESC] =
    "Like the slime, but smaller." +
    "\n" +
    "The difference in size cuts their durability roughly in half, but also makes them more nimble." +
    "It's hardly an even trade however, and it makes them even less of a threat than regular slimes." +
    "\n" +
    "Has a basic melee attack.";
    
    SV_map[? CHAR_VAR_RACE] = RACE_OOZE;
    SV_map[? CHAR_VAR_HP] = 450;
    SV_map[? CHAR_VAR_MATK] = 5;
    SV_map[? CHAR_VAR_MDEF] = 10;
    SV_map[? CHAR_VAR_FATK] = 0;
    SV_map[? CHAR_VAR_FDEF] = 5;
    SV_map[? CHAR_VAR_SATK] = 0;
    SV_map[? CHAR_VAR_SDEF] = -15;
    SV_map[? CHAR_VAR_ACC] = 0;
    SV_map[? CHAR_VAR_EVA] = 0;
    SV_map[? CHAR_VAR_SPD] = 5;
    SV_map[? CHAR_VAR_MISC] = 0;
    SV_map[? CHAR_VAR_ELE_FIR] = -20;
    SV_map[? CHAR_VAR_ELE_ICE] = -20;
    SV_map[? CHAR_VAR_ELE_NAT] = 50;
    SV_map[? CHAR_VAR_ELE_ELC] = 0;
    SV_map[? CHAR_VAR_ELE_DRK] = 0;
    SV_map[? CHAR_VAR_ELE_LGT] = 0;
    SV_map[? CHAR_VAR_SPR_BATTLEPORT] = spr_enemy_minislime;
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = SV_map[? CHAR_VAR_SPR_BATTLEPORT];
    SV_map[? CHAR_VAR_ABDO_X] = 0;
    SV_map[? CHAR_VAR_ABDO_Y] = 50;
#endregion

#region //bigslime
    SV_map = scr_data_char_new(en_chars.bigslime,CHAR_BIGSLIME);
    SV_map[? CHAR_VAR_NAMEFULL] = "Big Slime";
    SV_map[? CHAR_VAR_NAMEDISP] = SV_map[? CHAR_VAR_NAMEFULL];
    
    SV_map[? CHAR_VAR_DESC] =
    "TBA";
    
    SV_map[? CHAR_VAR_RACE] = RACE_OOZE;
    SV_map[? CHAR_VAR_HP] = 3000;
    SV_map[? CHAR_VAR_MATK] = 5;
    SV_map[? CHAR_VAR_MDEF] = 30;
    SV_map[? CHAR_VAR_FATK] = 0;
    SV_map[? CHAR_VAR_FDEF] = 5;
    SV_map[? CHAR_VAR_SATK] = 0;
    SV_map[? CHAR_VAR_SDEF] = -15;
    SV_map[? CHAR_VAR_ACC] = 0;
    SV_map[? CHAR_VAR_EVA] = -10;
    SV_map[? CHAR_VAR_SPD] = -5;
    SV_map[? CHAR_VAR_MISC] = 0;
    SV_map[? CHAR_VAR_ELE_FIR] = -20;
    SV_map[? CHAR_VAR_ELE_ICE] = -20;
    SV_map[? CHAR_VAR_ELE_NAT] = 90;
    SV_map[? CHAR_VAR_ELE_ELC] = 0;
    SV_map[? CHAR_VAR_ELE_DRK] = 0;
    SV_map[? CHAR_VAR_ELE_LGT] = 0;
    SV_map[? CHAR_VAR_SPR_BATTLEPORT] = spr_enemy_bigslime;
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = SV_map[? CHAR_VAR_SPR_BATTLEPORT];
    SV_map[? CHAR_VAR_ABDO_X] = 0;
    SV_map[? CHAR_VAR_ABDO_Y] = 50;
    
    /*
    summon slime
    quake
    */
#endregion

#region //candywing
    SV_map = scr_data_char_new(en_chars.candywing,CHAR_CANDYWING);
    SV_map[? CHAR_VAR_NAMEFULL] = "Candywing";
    SV_map[? CHAR_VAR_NAMEDISP] = SV_map[? CHAR_VAR_NAMEFULL];
    
    SV_map[? CHAR_VAR_DESC] =
    "One of several species of sentient candy created by a mage-turned-hobbyist-chef, Candywings are permanently in hunting season due to their seemingly infinite population." +
    "\n" +
    "Candywings are a strange nuissance - aware of their severe fragility and lacking offensive power, they are normally a very passive entity, however at the sight of a battle a passing swarm is almost guaranteed to join in." +
    "Despite their weakness, Candywings are very nimble and will easily dodge attacks from cumbersome weapons." +
    "\n" +
    "Has a basic melee attack.";
    
    SV_map[? CHAR_VAR_RACE] = RACE_CANDY;
    SV_map[? CHAR_VAR_HP] = 400;
    SV_map[? CHAR_VAR_MATK] = 10;
    SV_map[? CHAR_VAR_MDEF] = -5;
    SV_map[? CHAR_VAR_FATK] = 0;
    SV_map[? CHAR_VAR_FDEF] = -15;
    SV_map[? CHAR_VAR_SATK] = 0;
    SV_map[? CHAR_VAR_SDEF] = -5;
    SV_map[? CHAR_VAR_ACC] = 20;
    SV_map[? CHAR_VAR_EVA] = 10;
    SV_map[? CHAR_VAR_SPD] = 5;
    SV_map[? CHAR_VAR_MISC] = 0;
    SV_map[? CHAR_VAR_ELE_FIR] = 0;
    SV_map[? CHAR_VAR_ELE_ICE] = -10;
    SV_map[? CHAR_VAR_ELE_NAT] = 0;
    SV_map[? CHAR_VAR_ELE_ELC] = -20;
    SV_map[? CHAR_VAR_ELE_DRK] = 0;
    SV_map[? CHAR_VAR_ELE_LGT] = 0;
    SV_map[? CHAR_VAR_SPR_BATTLEPORT] = spr_enemy_candywing;
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = SV_map[? CHAR_VAR_SPR_BATTLEPORT];
    SV_map[? CHAR_VAR_ABDO_X] = 0;
    SV_map[? CHAR_VAR_ABDO_Y] = 50;
#endregion

#region //gundrop
    SV_map = scr_data_char_new(en_chars.gundrop,CHAR_GUNDROP);
    SV_map[? CHAR_VAR_NAMEFULL] = "Candywing";
    SV_map[? CHAR_VAR_NAMEDISP] = SV_map[? CHAR_VAR_NAMEFULL];
    
    SV_map[? CHAR_VAR_DESC] =
    "It's like a gumdrop but it's sentient and holding a gun." +
    "\n" +
    //"The generic slime is mostly not a threat - slow, easy to dodge, and easier to hit, their only real strength is being relatively tanky among low-rank monsters." +
    //"An inattentive or weakened party can still be wiped out by a pack of slimes, but generally speaking basic battle strategy is more than enough to take out even a horde of them." +
    "\n" +
    "Has a basic melee attack.";
    
    /*SV_map[? CHAR_VAR_RACE] = RACE_CANDY;
    SV_map[? CHAR_VAR_HP] = 400;
    SV_map[? CHAR_VAR_MATK] = 10;
    SV_map[? CHAR_VAR_MDEF] = -5;
    SV_map[? CHAR_VAR_FATK] = 0;
    SV_map[? CHAR_VAR_FDEF] = -15;
    SV_map[? CHAR_VAR_SATK] = 0;
    SV_map[? CHAR_VAR_SDEF] = -5;
    SV_map[? CHAR_VAR_ACC] = 20;
    SV_map[? CHAR_VAR_EVA] = 10;
    SV_map[? CHAR_VAR_SPD] = 5;
    SV_map[? CHAR_VAR_MISC] = 0;
    SV_map[? CHAR_VAR_ELE_FIR] = 0;
    SV_map[? CHAR_VAR_ELE_ICE] = -10;
    SV_map[? CHAR_VAR_ELE_NAT] = 0;
    SV_map[? CHAR_VAR_ELE_ELC] = -20;
    SV_map[? CHAR_VAR_ELE_DRK] = 0;
    SV_map[? CHAR_VAR_ELE_LGT] = 0;
    SV_map[? CHAR_VAR_SPR_BATTLEPORT] = spr_enemy_candywing;
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = SV_map[? CHAR_VAR_SPR_BATTLEPORT];
    SV_map[? CHAR_VAR_ABDO_X] = 0;
    SV_map[? CHAR_VAR_ABDO_Y] = 50;*/
#endregion

#region //bleedingBullet
    SV_map = scr_data_char_new(en_chars.bleedingBullet,CHAR_BLEEDINGBULLET);
    SV_map[? CHAR_VAR_NAMEFULL] = "Bleeding Bullet";
    SV_map[? CHAR_VAR_NAMEDISP] = "Bleeding Bullet";
    SV_map[? CHAR_VAR_DESC] = "TBA";
    SV_map[? CHAR_VAR_RACE] = RACE_PLANT;
    SV_map[? CHAR_VAR_HP] = 1000;
    SV_map[? CHAR_VAR_MATK] = 0;
    SV_map[? CHAR_VAR_MDEF] = -10;
    SV_map[? CHAR_VAR_FATK] = 10;
    SV_map[? CHAR_VAR_FDEF] = 25;
    SV_map[? CHAR_VAR_SATK] = 0;
    SV_map[? CHAR_VAR_SDEF] = -5;
    SV_map[? CHAR_VAR_ACC] = 30;
    SV_map[? CHAR_VAR_EVA] = -20;
    SV_map[? CHAR_VAR_SPD] = -5;
    SV_map[? CHAR_VAR_MISC] = 0;
    SV_map[? CHAR_VAR_ELE_FIR] = -50;
    SV_map[? CHAR_VAR_ELE_ICE] = -10;
    SV_map[? CHAR_VAR_ELE_NAT] = 50;
    SV_map[? CHAR_VAR_ELE_ELC] = 0;
    SV_map[? CHAR_VAR_ELE_DRK] = 0;
    SV_map[? CHAR_VAR_ELE_LGT] = 0;
    SV_map[? CHAR_VAR_SPR_BATTLEPORT] = spr_enemy_bleedingBullet;
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = spr_enemy_bleedingBullet;
    SV_map[? CHAR_VAR_ABDO_X] = 0;
    SV_map[? CHAR_VAR_ABDO_Y] = 50;
#endregion

#region //dartLily
    SV_map = scr_data_char_new(en_chars.dartLily,CHAR_DARTLILY);
    SV_map[? CHAR_VAR_NAMEFULL] = "Dart Lily";
    SV_map[? CHAR_VAR_NAMEDISP] = "Dart Lily";
    SV_map[? CHAR_VAR_DESC] = "TBA";
    SV_map[? CHAR_VAR_RACE] = RACE_PLANT;
    SV_map[? CHAR_VAR_HP] = 400;
    SV_map[? CHAR_VAR_MATK] = 0;
    SV_map[? CHAR_VAR_MDEF] = -15;
    SV_map[? CHAR_VAR_FATK] = 10;
    SV_map[? CHAR_VAR_FDEF] = 10;
    SV_map[? CHAR_VAR_SATK] = 0;
    SV_map[? CHAR_VAR_SDEF] = 0;
    SV_map[? CHAR_VAR_ACC] = 20;
    SV_map[? CHAR_VAR_EVA] = 15;
    SV_map[? CHAR_VAR_SPD] = 5;
    SV_map[? CHAR_VAR_MISC] = 0;
    SV_map[? CHAR_VAR_ELE_FIR] = -50;
    SV_map[? CHAR_VAR_ELE_ICE] = -10;
    SV_map[? CHAR_VAR_ELE_NAT] = 50;
    SV_map[? CHAR_VAR_ELE_ELC] = 0;
    SV_map[? CHAR_VAR_ELE_DRK] = 30;
    SV_map[? CHAR_VAR_ELE_LGT] = 0;
    SV_map[? CHAR_VAR_SPR_BATTLEPORT] = spr_enemy_dartLily;
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = spr_enemy_dartLily;
    SV_map[? CHAR_VAR_ABDO_X] = 0;
    SV_map[? CHAR_VAR_ABDO_Y] = 50;
#endregion

#region //wolfeant
    SV_map = scr_data_char_new(en_chars.wolfeant,CHAR_WOLFEANT);
    SV_map[? CHAR_VAR_NAMEFULL] = "Wolfeant";
    SV_map[? CHAR_VAR_NAMEDISP] = SV_map[? CHAR_VAR_NAMEFULL];
    SV_map[? CHAR_VAR_DESC] = "TBA";
    SV_map[? CHAR_VAR_RACE] = RACE_PLANT;
    SV_map[? CHAR_VAR_HP] = 1600;
    SV_map[? CHAR_VAR_MATK] = 20;
    SV_map[? CHAR_VAR_MDEF] = 30;
    SV_map[? CHAR_VAR_FATK] = 0;
    SV_map[? CHAR_VAR_FDEF] = 5;
    SV_map[? CHAR_VAR_SATK] = 0;
    SV_map[? CHAR_VAR_SDEF] = 5;
    SV_map[? CHAR_VAR_ACC] = 15;
    SV_map[? CHAR_VAR_EVA] = 5;
    SV_map[? CHAR_VAR_SPD] = 6;
    SV_map[? CHAR_VAR_MISC] = 0;
    SV_map[? CHAR_VAR_ELE_FIR] = -50;
    SV_map[? CHAR_VAR_ELE_ICE] = -10;
    SV_map[? CHAR_VAR_ELE_NAT] = 50;
    SV_map[? CHAR_VAR_ELE_ELC] = 0;
    SV_map[? CHAR_VAR_ELE_DRK] = 0;
    SV_map[? CHAR_VAR_ELE_LGT] = 0;
    SV_map[? CHAR_VAR_SPR_BATTLEPORT] = spr_enemy_wolfeant;
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = SV_map[? CHAR_VAR_SPR_BATTLEPORT];
    SV_map[? CHAR_VAR_ABDO_X] = 0;
    SV_map[? CHAR_VAR_ABDO_Y] = 50;

    /*
    razor claw: wide range, 10% proc rate
    also uses [tackle], [bite]
    */
#endregion

#region //corrosion wolfeant
    SV_map = scr_data_char_new(en_chars.cWolf,CHAR_CWOLF);
    SV_map[? CHAR_VAR_NAMEFULL] = "Corr. Wolfeant";
    SV_map[? CHAR_VAR_NAMEDISP] = SV_map[? CHAR_VAR_NAMEFULL];
    SV_map[? CHAR_VAR_DESC] = "TBA";
    SV_map[? CHAR_VAR_RACE] = RACE_PLANT;
    SV_map[? CHAR_VAR_HP] = 1600;
    SV_map[? CHAR_VAR_MATK] = 20;
    SV_map[? CHAR_VAR_MDEF] = 30;
    SV_map[? CHAR_VAR_FATK] = 0;
    SV_map[? CHAR_VAR_FDEF] = 5;
    SV_map[? CHAR_VAR_SATK] = 0;
    SV_map[? CHAR_VAR_SDEF] = 5;
    SV_map[? CHAR_VAR_ACC] = 15;
    SV_map[? CHAR_VAR_EVA] = 5;
    SV_map[? CHAR_VAR_SPD] = 6;
    SV_map[? CHAR_VAR_MISC] = 0;
    SV_map[? CHAR_VAR_ELE_FIR] = -50;
    SV_map[? CHAR_VAR_ELE_ICE] = -10;
    SV_map[? CHAR_VAR_ELE_NAT] = 50;
    SV_map[? CHAR_VAR_ELE_ELC] = 0;
    SV_map[? CHAR_VAR_ELE_DRK] = 50;
    SV_map[? CHAR_VAR_ELE_LGT] = 0;
    SV_map[? CHAR_VAR_SPR_BATTLEPORT] = spr_enemy_wolfeant;
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = SV_map[? CHAR_VAR_SPR_BATTLEPORT];
    SV_map[? CHAR_VAR_ABDO_X] = 0;
    SV_map[? CHAR_VAR_ABDO_Y] = 50;

    /*
    toxifang: poison chance, 50% proc rate, 5 turn cooldown
    razor claw: wide range, 10% proc rate
    also uses [tackle]
    */
#endregion

#region //wolfierce
    SV_map = scr_data_char_new(en_chars.wolfierce,CHAR_WOLFIERCE);
    SV_map[? CHAR_VAR_NAMEFULL] = "Wolfierce";
    SV_map[? CHAR_VAR_NAMEDISP] = SV_map[? CHAR_VAR_NAMEFULL];
    SV_map[? CHAR_VAR_DESC] = "TBA";
    SV_map[? CHAR_VAR_RACE] = RACE_PLANT;
    SV_map[? CHAR_VAR_HP] = 2200;
    SV_map[? CHAR_VAR_MATK] = 40;
    SV_map[? CHAR_VAR_MDEF] = 30;
    SV_map[? CHAR_VAR_FATK] = 0;
    SV_map[? CHAR_VAR_FDEF] = 10;
    SV_map[? CHAR_VAR_SATK] = 0;
    SV_map[? CHAR_VAR_SDEF] = 10;
    SV_map[? CHAR_VAR_ACC] = 20;
    SV_map[? CHAR_VAR_EVA] = 5;
    SV_map[? CHAR_VAR_SPD] = 6;
    SV_map[? CHAR_VAR_MISC] = 0;
    SV_map[? CHAR_VAR_ELE_FIR] = -50;
    SV_map[? CHAR_VAR_ELE_ICE] = -10;
    SV_map[? CHAR_VAR_ELE_NAT] = 50;
    SV_map[? CHAR_VAR_ELE_ELC] = 0;
    SV_map[? CHAR_VAR_ELE_DRK] = 0;
    SV_map[? CHAR_VAR_ELE_LGT] = 0;
    SV_map[? CHAR_VAR_SPR_BATTLEPORT] = spr_enemy_wolfeant;
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = SV_map[? CHAR_VAR_SPR_BATTLEPORT];
    SV_map[? CHAR_VAR_ABDO_X] = 0;
    SV_map[? CHAR_VAR_ABDO_Y] = 50;
    
    /*
    tension: atk+, 50% proc rate, 8 turn cooldown, starts at 3 turn cooldown
    razor claw: wide melee strike, always used immediately after [tension], otherwise 10% proc rate
    also uses [tackle], [bite]
    */
#endregion

#region //wanderer
    SV_map = scr_data_char_new(en_chars.wanderer,CHAR_WANDERER);
    SV_map[? CHAR_VAR_NAMEFULL] = "Wanderer";
    SV_map[? CHAR_VAR_NAMEDISP] = SV_map[? CHAR_VAR_NAMEFULL];
    SV_map[? CHAR_VAR_DESC] = "TBA";
    SV_map[? CHAR_VAR_RACE] = RACE_SPIRIT;
    SV_map[? CHAR_VAR_HP] = 1000;
    SV_map[? CHAR_VAR_MATK] = 0;
    SV_map[? CHAR_VAR_MDEF] = -15;
    SV_map[? CHAR_VAR_FATK] = 0;
    SV_map[? CHAR_VAR_FDEF] = -15;
    SV_map[? CHAR_VAR_SATK] = 20;
    SV_map[? CHAR_VAR_SDEF] = 50;
    SV_map[? CHAR_VAR_ACC] = 25;
    SV_map[? CHAR_VAR_EVA] = 10;
    SV_map[? CHAR_VAR_SPD] = -15;
    SV_map[? CHAR_VAR_MISC] = 0;
    SV_map[? CHAR_VAR_ELE_FIR] = 0;
    SV_map[? CHAR_VAR_ELE_ICE] = 0;
    SV_map[? CHAR_VAR_ELE_NAT] = 0;
    SV_map[? CHAR_VAR_ELE_ELC] = -100;
    SV_map[? CHAR_VAR_ELE_DRK] = 0;
    SV_map[? CHAR_VAR_ELE_LGT] = 0;
    SV_map[? CHAR_VAR_SPR_BATTLEPORT] = spr_enemy_wanderer;
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = SV_map[? CHAR_VAR_SPR_BATTLEPORT];
    SV_map[? CHAR_VAR_ABDO_X] = 0;
    SV_map[? CHAR_VAR_ABDO_Y] = 50;

    /*
    wave cannon: strong spell attack
    */
#endregion

#region //trapped [boss]
    SV_map = scr_data_char_new(en_chars.trapped,CHAR_TRAPPED);
    SV_map[? CHAR_VAR_NAMEFULL] = "The Trapped";
    SV_map[? CHAR_VAR_NAMEDISP] = SV_map[? CHAR_VAR_NAMEFULL];
    SV_map[? CHAR_VAR_DESC] = "TBA";
    SV_map[? CHAR_VAR_RACE] = RACE_SPIRIT;
    SV_map[? CHAR_VAR_HP] = 5000;
    SV_map[? CHAR_VAR_MATK] = 0;
    SV_map[? CHAR_VAR_MDEF] = -15;
    SV_map[? CHAR_VAR_FATK] = 0;
    SV_map[? CHAR_VAR_FDEF] = -15;
    SV_map[? CHAR_VAR_SATK] = 30;
    SV_map[? CHAR_VAR_SDEF] = 50;
    SV_map[? CHAR_VAR_ACC] = 50;
    SV_map[? CHAR_VAR_EVA] = 10;
    SV_map[? CHAR_VAR_SPD] = -16;
    SV_map[? CHAR_VAR_MISC] = 0;
    SV_map[? CHAR_VAR_ELE_FIR] = 0;
    SV_map[? CHAR_VAR_ELE_ICE] = 0;
    SV_map[? CHAR_VAR_ELE_NAT] = 0;
    SV_map[? CHAR_VAR_ELE_ELC] = -50;
    SV_map[? CHAR_VAR_ELE_DRK] = 0;
    SV_map[? CHAR_VAR_ELE_LGT] = 0;
    SV_map[? CHAR_VAR_SPR_BATTLEPORT] = spr_enemy_wanderer;
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = SV_map[? CHAR_VAR_SPR_BATTLEPORT];
    SV_map[? CHAR_VAR_ABDO_X] = 0;
    SV_map[? CHAR_VAR_ABDO_Y] = 50;

    /*
    wave cannon: strong spell attack
    grapple: guaranteed poison/severe spd reduction on hit, used at 50%/25% hp thresholds
    lightning wave: wide elc spell attack, high paralyze rate, 40% proc rate, 5 turn cooldown, not usable above 75% hp
    */
#endregion

#region //arcmine
    SV_map = scr_data_char_new(en_chars.arcmine,CHAR_ARCMINE);
    SV_map[? CHAR_VAR_NAMEFULL] = "Arc Mine";
    SV_map[? CHAR_VAR_NAMEDISP] = SV_map[? CHAR_VAR_NAMEFULL];
    
    SV_map[? CHAR_VAR_DESC] =
    "TBA";
    
    SV_map[? CHAR_VAR_RACE] = RACE_ARTIFICE;
    SV_map[? CHAR_VAR_HP] = 200;
    SV_map[? CHAR_VAR_MATK] = 0;
    SV_map[? CHAR_VAR_MDEF] = 0;
    SV_map[? CHAR_VAR_FATK] = 0;
    SV_map[? CHAR_VAR_FDEF] = 0;
    SV_map[? CHAR_VAR_SATK] = 0;
    SV_map[? CHAR_VAR_SDEF] = 0;
    SV_map[? CHAR_VAR_ACC] = 0;
    SV_map[? CHAR_VAR_EVA] = 0;
    SV_map[? CHAR_VAR_SPD] = 10;
    SV_map[? CHAR_VAR_MISC] = 0;
    SV_map[? CHAR_VAR_ELE_FIR] = 80;
    SV_map[? CHAR_VAR_ELE_ICE] = 80;
    SV_map[? CHAR_VAR_ELE_NAT] = 80;
    SV_map[? CHAR_VAR_ELE_ELC] = 80;
    SV_map[? CHAR_VAR_ELE_DRK] = 80;
    SV_map[? CHAR_VAR_ELE_LGT] = 80;
    SV_map[? CHAR_VAR_SPR_BATTLEPORT] = spr_enemy_mine;
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = SV_map[? CHAR_VAR_SPR_BATTLEPORT];
    SV_map[? CHAR_VAR_ABDO_X] = 0;
    SV_map[? CHAR_VAR_ABDO_Y] = 50;
#endregion

#region //conduit
    SV_map = scr_data_char_new(en_chars.liConduit,CHAR_LICONDUIT);
    SV_map[? CHAR_VAR_NAMEFULL] = "LI-Conduit";
    SV_map[? CHAR_VAR_NAMEDISP] = SV_map[? CHAR_VAR_NAMEFULL];
    
    SV_map[? CHAR_VAR_DESC] =
    "TBA";
    
    SV_map[? CHAR_VAR_RACE] = RACE_ARTIFICE;
    SV_map[? CHAR_VAR_HP] = 1000;
    SV_map[? CHAR_VAR_MATK] = 0;
    SV_map[? CHAR_VAR_MDEF] = 0;
    SV_map[? CHAR_VAR_FATK] = 0;
    SV_map[? CHAR_VAR_FDEF] = 0;
    SV_map[? CHAR_VAR_SATK] = 0;
    SV_map[? CHAR_VAR_SDEF] = 10;
    SV_map[? CHAR_VAR_ACC] = 0;
    SV_map[? CHAR_VAR_EVA] = -30;
    SV_map[? CHAR_VAR_SPD] = -5;
    SV_map[? CHAR_VAR_MISC] = 0;
    SV_map[? CHAR_VAR_ELE_FIR] = 0;
    SV_map[? CHAR_VAR_ELE_ICE] = 0;
    SV_map[? CHAR_VAR_ELE_NAT] = 0;
    SV_map[? CHAR_VAR_ELE_ELC] = 80;
    SV_map[? CHAR_VAR_ELE_DRK] = 0;
    SV_map[? CHAR_VAR_ELE_LGT] = 0;
    SV_map[? CHAR_VAR_SPR_BATTLEPORT] = spr_enemy_hpStation;
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = SV_map[? CHAR_VAR_SPR_BATTLEPORT];
    SV_map[? CHAR_VAR_ABDO_X] = 0;
    SV_map[? CHAR_VAR_ABDO_Y] = 50;
    
    var SV_map2 = scr_data_char_new(en_chars.atConduit,CHAR_ATCONDUIT);
    ds_map_copy(SV_map2,SV_map);
    SV_map2[? CHAR_VAR_NAMEFULL] = "AT-Conduit";
    SV_map2[? CHAR_VAR_NAMEDISP] = SV_map[? CHAR_VAR_NAMEFULL];
    SV_map2[? CHAR_VAR_ID] = CHAR_ATCONDUIT;
    SV_map2[? CHAR_VAR_SPR_BATTLEPORT] = spr_enemy_atkStation;
    
    var SV_map2 = scr_data_char_new(en_chars.dfConduit,CHAR_DFCONDUIT);
    ds_map_copy(SV_map2,SV_map);
    SV_map2[? CHAR_VAR_NAMEFULL] = "DF-Conduit";
    SV_map2[? CHAR_VAR_NAMEDISP] = SV_map[? CHAR_VAR_NAMEFULL];
    SV_map2[? CHAR_VAR_ID] = CHAR_DFCONDUIT;
    SV_map2[? CHAR_VAR_SPR_BATTLEPORT] = spr_enemy_defStation;
#endregion

#region //gunnerDrone
    SV_map = scr_data_char_new(en_chars.gunDrone,CHAR_GUNNERDRONE);
    SV_map[? CHAR_VAR_NAMEFULL] = "Gunner Drone";
    SV_map[? CHAR_VAR_NAMEDISP] = SV_map[? CHAR_VAR_NAMEFULL];
    
    SV_map[? CHAR_VAR_DESC] =
    "TBA";
    
    SV_map[? CHAR_VAR_RACE] = RACE_ARTIFICE;
    SV_map[? CHAR_VAR_HP] = 1000;
    SV_map[? CHAR_VAR_MATK] = 0;
    SV_map[? CHAR_VAR_MDEF] = 10;
    SV_map[? CHAR_VAR_FATK] = 0;
    SV_map[? CHAR_VAR_FDEF] = 30;
    SV_map[? CHAR_VAR_SATK] = 0;
    SV_map[? CHAR_VAR_SDEF] = 10;
    SV_map[? CHAR_VAR_ACC] = 20;
    SV_map[? CHAR_VAR_EVA] = 5;
    SV_map[? CHAR_VAR_SPD] = 5;
    SV_map[? CHAR_VAR_MISC] = 0;
    SV_map[? CHAR_VAR_ELE_FIR] = 0;
    SV_map[? CHAR_VAR_ELE_ICE] = 0;
    SV_map[? CHAR_VAR_ELE_NAT] = 0;
    SV_map[? CHAR_VAR_ELE_ELC] = 80;
    SV_map[? CHAR_VAR_ELE_DRK] = 0;
    SV_map[? CHAR_VAR_ELE_LGT] = 0;
    SV_map[? CHAR_VAR_SPR_BATTLEPORT] = spr_enemy_gunnerDrone;
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = SV_map[? CHAR_VAR_SPR_BATTLEPORT];
    SV_map[? CHAR_VAR_ABDO_X] = 0;
    SV_map[? CHAR_VAR_ABDO_Y] = 50;
#endregion

#region //flamerDrone
    SV_map = scr_data_char_new(en_chars.firDrone,CHAR_FLAMERDRONE);
    SV_map[? CHAR_VAR_NAMEFULL] = "Flamer Drone";
    SV_map[? CHAR_VAR_NAMEDISP] = SV_map[? CHAR_VAR_NAMEFULL];
    
    SV_map[? CHAR_VAR_DESC] =
    "TBA";
    
    SV_map[? CHAR_VAR_RACE] = RACE_ARTIFICE;
    SV_map[? CHAR_VAR_HP] = 1000;
    SV_map[? CHAR_VAR_MATK] = 0;
    SV_map[? CHAR_VAR_MDEF] = 10;
    SV_map[? CHAR_VAR_FATK] = 0;
    SV_map[? CHAR_VAR_FDEF] = 30;
    SV_map[? CHAR_VAR_SATK] = 20;
    SV_map[? CHAR_VAR_SDEF] = 10;
    SV_map[? CHAR_VAR_ACC] = 20;
    SV_map[? CHAR_VAR_EVA] = 5;
    SV_map[? CHAR_VAR_SPD] = 5;
    SV_map[? CHAR_VAR_MISC] = 0;
    SV_map[? CHAR_VAR_ELE_FIR] = 80;
    SV_map[? CHAR_VAR_ELE_ICE] = 0;
    SV_map[? CHAR_VAR_ELE_NAT] = 0;
    SV_map[? CHAR_VAR_ELE_ELC] = 80;
    SV_map[? CHAR_VAR_ELE_DRK] = 0;
    SV_map[? CHAR_VAR_ELE_LGT] = 0;
    SV_map[? CHAR_VAR_SPR_BATTLEPORT] = spr_enemy_flamerDrone;
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = SV_map[? CHAR_VAR_SPR_BATTLEPORT];
    SV_map[? CHAR_VAR_ABDO_X] = 0;
    SV_map[? CHAR_VAR_ABDO_Y] = 50;
#endregion

#region //camDrone
    SV_map = scr_data_char_new(en_chars.camDrone,CHAR_CAMDRONE);
    SV_map[? CHAR_VAR_NAMEFULL] = "Radome Drone";
    SV_map[? CHAR_VAR_NAMEDISP] = SV_map[? CHAR_VAR_NAMEFULL];
    
    SV_map[? CHAR_VAR_DESC] =
    "TBA";
    
    SV_map[? CHAR_VAR_RACE] = RACE_ARTIFICE;
    SV_map[? CHAR_VAR_HP] = 1000;
    SV_map[? CHAR_VAR_MATK] = 0;
    SV_map[? CHAR_VAR_MDEF] = 10;
    SV_map[? CHAR_VAR_FATK] = 0;
    SV_map[? CHAR_VAR_FDEF] = 30;
    SV_map[? CHAR_VAR_SATK] = 0;
    SV_map[? CHAR_VAR_SDEF] = 10;
    SV_map[? CHAR_VAR_ACC] = 50;
    SV_map[? CHAR_VAR_EVA] = -20;
    SV_map[? CHAR_VAR_SPD] = -50;
    SV_map[? CHAR_VAR_MISC] = 0;
    SV_map[? CHAR_VAR_ELE_FIR] = 0;
    SV_map[? CHAR_VAR_ELE_ICE] = 0;
    SV_map[? CHAR_VAR_ELE_NAT] = 0;
    SV_map[? CHAR_VAR_ELE_ELC] = 80;
    SV_map[? CHAR_VAR_ELE_DRK] = 0;
    SV_map[? CHAR_VAR_ELE_LGT] = 0;
    SV_map[? CHAR_VAR_SPR_BATTLEPORT] = spr_enemy_radomeDrone;
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = SV_map[? CHAR_VAR_SPR_BATTLEPORT];
    SV_map[? CHAR_VAR_ABDO_X] = 0;
    SV_map[? CHAR_VAR_ABDO_Y] = 50;
#endregion

#region //npc_evoker
    SV_map = scr_data_char_new(en_chars.npc_evoker,CHAR_NPC_EVOKER);
    SV_map[? CHAR_VAR_NAMEFULL] = "Evoker";
    SV_map[? CHAR_VAR_NAMEDISP] = SV_map[? CHAR_VAR_NAMEFULL];
    SV_map[? CHAR_VAR_DESC] = "TBA";
    SV_map[? CHAR_VAR_RACE] = RACE_BESTIA;
    SV_map[? CHAR_VAR_HP] = 1000;
    SV_map[? CHAR_VAR_MATK] = -10;
    SV_map[? CHAR_VAR_MDEF] = 0;
    SV_map[? CHAR_VAR_FATK] = -10;
    SV_map[? CHAR_VAR_FDEF] = 0;
    SV_map[? CHAR_VAR_SATK] = -10;
    SV_map[? CHAR_VAR_SDEF] = 30;
    SV_map[? CHAR_VAR_ACC] = 10;
    SV_map[? CHAR_VAR_EVA] = 10;
    SV_map[? CHAR_VAR_SPD] = 5;
    SV_map[? CHAR_VAR_MISC] = 0;
    SV_map[? CHAR_VAR_ELE_FIR] = 0;
    SV_map[? CHAR_VAR_ELE_ICE] = 0;
    SV_map[? CHAR_VAR_ELE_NAT] = 0;
    SV_map[? CHAR_VAR_ELE_ELC] = 0;
    SV_map[? CHAR_VAR_ELE_DRK] = 50;
    SV_map[? CHAR_VAR_ELE_LGT] = 30;
    SV_map[? CHAR_VAR_SPR_BATTLEPORT] = spr_enemy_evoker;
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = spr_enemy_evoker;
    SV_map[? CHAR_VAR_ABDO_X] = 0;
    SV_map[? CHAR_VAR_ABDO_Y] = 50;
#endregion

#region //npc_agent
    SV_map = scr_data_char_new(en_chars.npc_agent,CHAR_NPC_AGENT);
    SV_map[? CHAR_VAR_NAMEFULL] = "Agent";
    SV_map[? CHAR_VAR_NAMEDISP] = SV_map[? CHAR_VAR_NAMEFULL];
    SV_map[? CHAR_VAR_DESC] = "TBA";
    SV_map[? CHAR_VAR_RACE] = RACE_HUMAN;
    SV_map[? CHAR_VAR_HP] = 1500;
    SV_map[? CHAR_VAR_MATK] = -10;
    SV_map[? CHAR_VAR_MDEF] = 10;
    SV_map[? CHAR_VAR_FATK] = -10;
    SV_map[? CHAR_VAR_FDEF] = 15;
    SV_map[? CHAR_VAR_SATK] = -10;
    SV_map[? CHAR_VAR_SDEF] = 10;
    SV_map[? CHAR_VAR_ACC] = -5;
    SV_map[? CHAR_VAR_EVA] = 8;
    SV_map[? CHAR_VAR_SPD] = 3;
    SV_map[? CHAR_VAR_MISC] = 0;
    SV_map[? CHAR_VAR_ELE_FIR] = 20;
    SV_map[? CHAR_VAR_ELE_ICE] = 0;
    SV_map[? CHAR_VAR_ELE_NAT] = 0;
    SV_map[? CHAR_VAR_ELE_ELC] = 10;
    SV_map[? CHAR_VAR_ELE_DRK] = 0;
    SV_map[? CHAR_VAR_ELE_LGT] = 0;
    SV_map[? CHAR_VAR_SPR_BATTLEPORT] = spr_enemy_agent;
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = spr_enemy_agent;
    SV_map[? CHAR_VAR_ABDO_X] = 0;
    SV_map[? CHAR_VAR_ABDO_Y] = 50;
#endregion

#region //npc_newtype
    SV_map = scr_data_char_new(en_chars.npc_newtype,CHAR_NPC_NEWTYPE);
    SV_map[? CHAR_VAR_NAMEFULL] = "Newtype";
    SV_map[? CHAR_VAR_NAMEDISP] = SV_map[? CHAR_VAR_NAMEFULL];
    SV_map[? CHAR_VAR_DESC] = "TBA";
    SV_map[? CHAR_VAR_RACE] = RACE_HUMAN;
    SV_map[? CHAR_VAR_HP] = 1400;
    SV_map[? CHAR_VAR_MATK] = -10;
    SV_map[? CHAR_VAR_MDEF] = 10;
    SV_map[? CHAR_VAR_FATK] = -10;
    SV_map[? CHAR_VAR_FDEF] = 25;
    SV_map[? CHAR_VAR_SATK] = -10;
    SV_map[? CHAR_VAR_SDEF] = 10;
    SV_map[? CHAR_VAR_ACC] = 15;
    SV_map[? CHAR_VAR_EVA] = 5;
    SV_map[? CHAR_VAR_SPD] = 3;
    SV_map[? CHAR_VAR_MISC] = 0;
    SV_map[? CHAR_VAR_ELE_FIR] = 0;
    SV_map[? CHAR_VAR_ELE_ICE] = 0;
    SV_map[? CHAR_VAR_ELE_NAT] = 0;
    SV_map[? CHAR_VAR_ELE_ELC] = 50;
    SV_map[? CHAR_VAR_ELE_DRK] = 0;
    SV_map[? CHAR_VAR_ELE_LGT] = 0;
    SV_map[? CHAR_VAR_SPR_BATTLEPORT] = spr_enemy_evoker;
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = spr_enemy_evoker;
    SV_map[? CHAR_VAR_ABDO_X] = 0;
    SV_map[? CHAR_VAR_ABDO_Y] = 50;
    
    var SV_map2 = scr_data_char_new(en_chars.xerion_newt,CHAR_XERION_NEWT);
    ds_map_copy(SV_map2,SV_map);
    SV_map2[? CHAR_VAR_NAMEFULL] = "Newtype (Xerion)";
    SV_map2[? CHAR_VAR_NAMEDISP] = SV_map[? CHAR_VAR_NAMEFULL];
    SV_map2[? CHAR_VAR_ID] = CHAR_XERION_NEWT;
    SV_map2[? CHAR_VAR_HP] = 3000;
#endregion

#region //glitch
    SV_map = scr_data_char_new(en_chars.glitch,CHAR_GLITCH);
    SV_map[? CHAR_VAR_NAMEFULL] = "Exception";
    SV_map[? CHAR_VAR_NAMEDISP] = SV_map[? CHAR_VAR_NAMEFULL];
    
    SV_map[? CHAR_VAR_DESC] =
    "TBA";
    
    SV_map[? CHAR_VAR_RACE] = RACE_HUMAN;
    SV_map[? CHAR_VAR_HP] = 1000;
    SV_map[? CHAR_VAR_MATK] = 0;
    SV_map[? CHAR_VAR_MDEF] = 0;
    SV_map[? CHAR_VAR_FATK] = 0;
    SV_map[? CHAR_VAR_FDEF] = 0;
    SV_map[? CHAR_VAR_SATK] = 0;
    SV_map[? CHAR_VAR_SDEF] = 0;
    SV_map[? CHAR_VAR_ACC] = 0;
    SV_map[? CHAR_VAR_EVA] = 0;
    SV_map[? CHAR_VAR_SPD] = 0;
    SV_map[? CHAR_VAR_MISC] = 0;
    SV_map[? CHAR_VAR_ELE_FIR] = 0;
    SV_map[? CHAR_VAR_ELE_ICE] = 0;
    SV_map[? CHAR_VAR_ELE_NAT] = 0;
    SV_map[? CHAR_VAR_ELE_ELC] = 0;
    SV_map[? CHAR_VAR_ELE_DRK] = 0;
    SV_map[? CHAR_VAR_ELE_LGT] = 0;
    SV_map[? CHAR_VAR_SPR_BATTLEPORT] = spr_spark_dot;
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = SV_map[? CHAR_VAR_SPR_BATTLEPORT];
    SV_map[? CHAR_VAR_ABDO_X] = 0;
    SV_map[? CHAR_VAR_ABDO_Y] = 0;
#endregion

#region //gDragon [boss]
    SV_map = scr_data_char_new(en_chars.gDragon,CHAR_GDRAGON);
    SV_map[? CHAR_VAR_NAMEFULL] = "G. Dragon";
    SV_map[? CHAR_VAR_NAMEDISP] = SV_map[? CHAR_VAR_NAMEFULL];
    SV_map[? CHAR_VAR_DESC] = "TBA";
    SV_map[? CHAR_VAR_RACE] = RACE_DRACON;
    SV_map[? CHAR_VAR_HP] = 4000;
    SV_map[? CHAR_VAR_MATK] = 20;
    SV_map[? CHAR_VAR_MDEF] = 30;
    SV_map[? CHAR_VAR_FATK] = 0;
    SV_map[? CHAR_VAR_FDEF] = 5;
    SV_map[? CHAR_VAR_SATK] = 20;
    SV_map[? CHAR_VAR_SDEF] = 5;
    SV_map[? CHAR_VAR_ACC] = 15;
    SV_map[? CHAR_VAR_EVA] = 5;
    SV_map[? CHAR_VAR_SPD] = 6;
    SV_map[? CHAR_VAR_MISC] = 0;
    SV_map[? CHAR_VAR_ELE_FIR] = -50;
    SV_map[? CHAR_VAR_ELE_ICE] = 0;
    SV_map[? CHAR_VAR_ELE_NAT] = 100;
    SV_map[? CHAR_VAR_ELE_ELC] = 0;
    SV_map[? CHAR_VAR_ELE_DRK] = 0;
    SV_map[? CHAR_VAR_ELE_LGT] = 0;
    SV_map[? CHAR_VAR_SPR_BATTLEPORT] = spr_enemy_greenDragon;
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = SV_map[? CHAR_VAR_SPR_BATTLEPORT];
    SV_map[? CHAR_VAR_ABDO_X] = 0;
    SV_map[? CHAR_VAR_ABDO_Y] = 50;

    /*
    agility: EVA up, 40% proc rate, 5 turn CD, starts at 2 CD
    
    30% proc rate{
        airburst: 5 random NAT hits, low silence chance
        acid spray
    }
    
    also uses [razor claw], [petal snipe], [tackle]
    */
    
    var SV_map2 = scr_data_char_new(en_chars.gDragonGlitch,CHAR_GDRAGONGLITCH);
    ds_map_copy(SV_map2,SV_map);
    SV_map2[? CHAR_VAR_NAMEFULL] = "!?!?";
    SV_map2[? CHAR_VAR_NAMEDISP] = SV_map[? CHAR_VAR_NAMEFULL];
    SV_map2[? CHAR_VAR_ID] = CHAR_GDRAGONGLITCH;
    SV_map2[? CHAR_VAR_MATK] = 200;
    SV_map2[? CHAR_VAR_FATK] = 200;
    SV_map2[? CHAR_VAR_SATK] = 200;
    SV_map2[? CHAR_VAR_ACC] = 30;
    SV_map2[? CHAR_VAR_SPR_BATTLEPORT] = spr_enemy_gDragonGlitch;
    SV_map2[? CHAR_VAR_SPR_NEUTRAL] = SV_map[? CHAR_VAR_SPR_BATTLEPORT];
    
    /*
    30% proc rate{
        airburst
        acid spray
        quake
        flamesweep
    }
    
    also uses [razor claw], [sVulcan], [barrier], [paratackle]
    */
#endregion