ds_grid_destroy(global.grd_chars);
global.grd_chars = ds_grid_create(2,1);

var SV_map;

#region //imo
    SV_map = scr_data_char_new(CHAR_IMOLEI);
    SV_map[? CHAR_VAR_NAMEFULL] = "Imo'lei Nari";
    SV_map[? CHAR_VAR_NAMEDISP] = "Imo'lei";
    SV_map[? CHAR_VAR_DESC] = "TBA";
    SV_map[? CHAR_VAR_RACE] = RACE_HUMAN;
    SV_map[? CHAR_VAR_HP] = 800 + (0 * DEBUG);
    SV_map[? CHAR_VAR_EN] = 1200;
    SV_map[? CHAR_VAR_MATK] = 10;
    SV_map[? CHAR_VAR_MDEF] = -5;
    SV_map[? CHAR_VAR_FATK] = -25;
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
    
    var SV_map2 = scr_data_char_new(CHAR_PVP_IMO);
    ds_map_copy(SV_map2,SV_map);
    SV_map2[? CHAR_VAR_ID] = CHAR_PVP_IMO;
    SV_map2[? CHAR_VAR_UCLASS] = noone;
    SV_map2[? CHAR_VAR_SPR_BATTLEPORT] = spr_enemy_imo;
    SV_map2[? CHAR_VAR_SPR_NEUTRAL] = spr_enemy_imo;
    SV_map2[? CHAR_VAR_ABDO_X] = 0;
    SV_map2[? CHAR_VAR_ABDO_Y] = 90;
#endregion

#region //blaze
    SV_map = scr_data_char_new(CHAR_BLAZE);
    SV_map[? CHAR_VAR_NAMEFULL] = "Blaze Nari";
    SV_map[? CHAR_VAR_NAMEDISP] = "Blaze";
    SV_map[? CHAR_VAR_DESC] = "TBA";
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
    
    var SV_map2 = scr_data_char_new(CHAR_PVP_BLAZE);
    ds_map_copy(SV_map2,SV_map);
    SV_map2[? CHAR_VAR_ID] = CHAR_PVP_BLAZE;
    SV_map2[? CHAR_VAR_UCLASS] = noone;
    SV_map2[? CHAR_VAR_SPR_BATTLEPORT] = spr_enemy_blaze;
    SV_map2[? CHAR_VAR_SPR_NEUTRAL] = spr_enemy_blaze;
    SV_map2[? CHAR_VAR_ABDO_X] = 0;
    SV_map2[? CHAR_VAR_ABDO_Y] = 90;
#endregion

#region //aile
    SV_map = scr_data_char_new(CHAR_AILE);
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
    SV_map[? CHAR_VAR_SATK] = 10;
    SV_map[? CHAR_VAR_SDEF] = 0;
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
    
    var SV_map2 = scr_data_char_new(CHAR_PVP_AILE);
    ds_map_copy(SV_map2,SV_map);
    SV_map2[? CHAR_VAR_ID] = CHAR_PVP_AILE;
    SV_map2[? CHAR_VAR_UCLASS] = noone;
    SV_map2[? CHAR_VAR_SPR_BATTLEPORT] = spr_enemy_aile;
    SV_map2[? CHAR_VAR_SPR_NEUTRAL] = spr_enemy_aile;
    SV_map2[? CHAR_VAR_ABDO_X] = 0;
    SV_map2[? CHAR_VAR_ABDO_Y] = 50;
#endregion

#region //ari
    SV_map = scr_data_char_new(CHAR_ARI);
    SV_map[? CHAR_VAR_NAMEFULL] = "Ari Ferrox";
    SV_map[? CHAR_VAR_NAMEDISP] = "Ari";
    SV_map[? CHAR_VAR_DESC] = "TBA";
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
    SV_map[? CHAR_VAR_ABDO_X] = -300;
    SV_map[? CHAR_VAR_ABDO_Y] = 130;
    SV_map[? CHAR_VAR_PSDO_ACT_X] = -180;
    SV_map[? CHAR_VAR_PSDO_ACT_Y] = -80;
    SV_map[? CHAR_VAR_PSDO_ARM_X] = 100;
    SV_map[? CHAR_VAR_PSDO_ARM_Y] = -20;
    SV_map[? CHAR_VAR_PSDO_CLS_X] = 70;
    SV_map[? CHAR_VAR_PSDO_CLS_Y] = 90;
#endregion

#region //paprika
    SV_map = scr_data_char_new(CHAR_PAPRIKA);
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
    
    var SV_map2 = scr_data_char_new(CHAR_PVP_PAPRIKA);
    ds_map_copy(SV_map2,SV_map);
    SV_map2[? CHAR_VAR_ID] = CHAR_PVP_PAPRIKA;
    SV_map2[? CHAR_VAR_UCLASS] = noone;
    SV_map2[? CHAR_VAR_SPR_BATTLEPORT] = spr_enemy_paprika;
    SV_map2[? CHAR_VAR_SPR_NEUTRAL] = spr_enemy_paprika;
    SV_map2[? CHAR_VAR_ABDO_X] = 0;
    SV_map2[? CHAR_VAR_ABDO_Y] = 90;
#endregion

#region //slime
    SV_map = scr_data_char_new(CHAR_SLIME);
    SV_map[? CHAR_VAR_NAMEFULL] = "Slime";
    SV_map[? CHAR_VAR_NAMEDISP] = "Slime";
    
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
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = spr_enemy_slime;
    SV_map[? CHAR_VAR_ABDO_X] = 0;
    SV_map[? CHAR_VAR_ABDO_Y] = 50;
#endregion

#region //paraslime
    SV_map = scr_data_char_new(CHAR_PARASLIME);
    SV_map[? CHAR_VAR_NAMEFULL] = "Paraslime";
    SV_map[? CHAR_VAR_NAMEDISP] = "Paraslime";
    
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
    SV_map[? CHAR_VAR_SPR_NEUTRAL] = spr_enemy_paraslime;
    SV_map[? CHAR_VAR_ABDO_X] = 0;
    SV_map[? CHAR_VAR_ABDO_Y] = 50;
#endregion

#region //minislime
    SV_map = scr_data_char_new(CHAR_MINISLIME);
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

#region //candywing
    SV_map = scr_data_char_new(CHAR_CANDYWING);
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
    SV_map = scr_data_char_new(CHAR_GUNDROP);
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
    SV_map = scr_data_char_new(CHAR_BLEEDINGBULLET);
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
    SV_map = scr_data_char_new(CHAR_DARTLILY);
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
    SV_map = scr_data_char_new(CHAR_WOLFEANT);
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
    razor claw: 10% proc rate
    also uses [tackle], [bite]
    */
#endregion

#region //wolfierce
    SV_map = scr_data_char_new(CHAR_WOLFIERCE);
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
    tension: atk+, 50% proc rate, 8 turn cooldown after use, starts at 3 turn cooldown
    razor claw: wide melee strike, always used immediately after [tension], otherwise 10% proc rate under [tension]
    also uses [tackle], [bite]
    */
#endregion

#region //wanderer
    SV_map = scr_data_char_new(CHAR_WANDERER);
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
    SV_map = scr_data_char_new(CHAR_TRAPPED);
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

#region //npc_evoker
    SV_map = scr_data_char_new(CHAR_NPC_EVOKER);
    SV_map[? CHAR_VAR_NAMEFULL] = "Evoker";
    SV_map[? CHAR_VAR_NAMEDISP] = "Evoker";
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

#region //npc_evoker
    SV_map = scr_data_char_new(CHAR_NPC_AGENT);
    SV_map[? CHAR_VAR_NAMEFULL] = "Agent";
    SV_map[? CHAR_VAR_NAMEDISP] = "Agent";
    SV_map[? CHAR_VAR_DESC] = "TBA";
    SV_map[? CHAR_VAR_RACE] = RACE_HUMAN;
    SV_map[? CHAR_VAR_HP] = 1500;
    SV_map[? CHAR_VAR_MATK] = -10;
    SV_map[? CHAR_VAR_MDEF] = 10;
    SV_map[? CHAR_VAR_FATK] = -10;
    SV_map[? CHAR_VAR_FDEF] = 15;
    SV_map[? CHAR_VAR_SATK] = -10;
    SV_map[? CHAR_VAR_SDEF] = 10;
    SV_map[? CHAR_VAR_ACC] = 10;
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

ds_grid_resize(global.grd_chars,ds_grid_width(global.grd_chars),ds_grid_height(global.grd_chars) + -1);