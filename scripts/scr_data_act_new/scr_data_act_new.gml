///@arg wtagType
///@arg *ele
///@arg *rarity
///@arg *plus

//general
var
SV_type = argument[0],
SV_ele = argument_count > 1 ? argument[1] : "",
SV_rare = argument_count > 2 ? argument[2] : 0,
SV_plus = argument_count > 3 ? argument[3] : 0,
SV_r = instance_create_depth(0,0,0,obj_handler_act);

SV_r.name = "???";
SV_r.desc = "A strange object hailing from beyond the void.";
SV_r.price = 1000;
SV_r.rare = SV_rare;
SV_r.plus = SV_plus;
SV_r.type = SV_type;
SV_r.tgtType = ACT_TGT_SINGLE;
SV_r.enCost = 50;
SV_r.cdAdd = 5000;
SV_r.pwr = 100;
SV_r.acc = 100;
SV_r.hitCount = 1;
SV_r.hitGap = 10;
SV_r.hitSimul = 1;
SV_r.atkScale = CHAR_VAR_MATK;
SV_r.defScale = CHAR_VAR_MDEF;
SV_r.critThresh = 0;
SV_r.tgtEnemy = true;
SV_r.spark_start = noone;
SV_r.spark_hit = noone;
SV_r.spark_end = noone;

switch(SV_type){
	
	#region //melee
	
		case WTAG_TYPE_SWD:
			SV_r.name = "Sword";
			SV_r.desc = "Balanced, straightforward weapon. Solid choice for any melee class.";
			SV_r.icon = spr_icon_swd;
			SV_r.price *= 1;
			SV_r.enCost *= 1.5;
			SV_r.cdAdd *= 4;
			SV_r.pwr *= 1.5;
			SV_r.acc *= .9;
			SV_r.hitCount = 3;
			SV_r.hitGap *= 1.4;
			SV_r.atkScale = CHAR_VAR_MATK;
			SV_r.defScale = CHAR_VAR_MDEF;
			SV_r.spark_hit = spr_spark_slash;
			
			break;
			
		case WTAG_TYPE_AXE:
			SV_r.name = "Axe";
			SV_r.desc = "Violent weapon that relies on raw power. Cumbersome, but decimates when it hits.";
			SV_r.icon = spr_icon_axe;
			SV_r.price *= 2;
			SV_r.enCost *= 3;
			SV_r.cdAdd *= 12;
			SV_r.pwr *= 8;
			SV_r.acc *= .6;
			SV_r.hitCount = 1;
			SV_r.hitGap *= 1;
			SV_r.atkScale = CHAR_VAR_MATK;
			SV_r.defScale = CHAR_VAR_MDEF;
			SV_r.spark_hit = spr_spark_slash;
			SV_r.se_hit = sfx_melee;
			
			break;
			
		case WTAG_TYPE_CSW:
			SV_r.name = "Chainsaw";
			SV_r.desc = "Reckless, difficult to use weapon that hits many times. Effective against unarmored enemies.";
			SV_r.icon = spr_icon_csw;
			SV_r.price *= 2;
			SV_r.enCost *= 3;
			SV_r.cdAdd *= 6;
			SV_r.pwr *= 1;
			SV_r.acc *= .5;
			SV_r.hitCount = 10;
			SV_r.hitGap *= .2;
			SV_r.atkScale = CHAR_VAR_MATK;
			SV_r.defScale = CHAR_VAR_MDEF;
			SV_r.spark_hit = spr_spark_slash;
			
			break;
			
		case WTAG_TYPE_SCY:
			SV_r.name = "Scythe";
			SV_r.desc = "A stylish weapon that trades power for wide range. Best used to get rid of adds.";
			SV_r.icon = spr_icon_scy;
			SV_r.tgtType = ACT_TGT_WIDE;
			SV_r.price *= 1.5;
			SV_r.enCost *= 2;
			SV_r.cdAdd *= 4;
			SV_r.pwr *= 1.3;
			SV_r.acc *= .9;
			SV_r.hitCount = 1;
			SV_r.hitGap *= 1;
			SV_r.atkScale = CHAR_VAR_MATK;
			SV_r.defScale = CHAR_VAR_MDEF;
			SV_r.spark_hit = spr_spark_slash;
			SV_r.se_hit = sfx_pierce;
			
			break;
			
		case WTAG_TYPE_DGR:
			SV_r.name = "Dagger";
			SV_r.desc = "Lightweight, easy to use melee weapon. Accurate and swift, at the cost of power.";
			SV_r.icon = spr_icon_dgr;
			SV_r.price *= .5;
			SV_r.enCost *= .5;
			SV_r.cdAdd *= .5;
			SV_r.pwr *= 1;
			SV_r.acc *= .9;
			SV_r.hitCount = 2;
			SV_r.hitGap *= 1.3;
			SV_r.atkScale = CHAR_VAR_MATK;
			SV_r.defScale = CHAR_VAR_MDEF;
			SV_r.spark_hit = spr_spark_pierce;
			
			break;
			
		case WTAG_TYPE_GNT:
			SV_r.name = "Gauntlet";
			SV_r.desc = "Provides accurate and powerful blows, but exhausts the wielder.";
			SV_r.icon = spr_icon_gnt;
			SV_r.price *= 1.5;
			SV_r.enCost *= 2.5;
			SV_r.cdAdd *= 16;
			SV_r.pwr *= 2;
			SV_r.acc *= .95;
			SV_r.hitCount = 4;
			SV_r.hitGap *= 1.2;
			SV_r.atkScale = CHAR_VAR_MATK;
			SV_r.defScale = CHAR_VAR_MDEF;
			SV_r.spark_hit = spr_spark_bash;
			
			break;
			
		case WTAG_TYPE_PAN:
			SV_r.name = "Pan";
			SV_r.desc = "An unorthodox weapon - weak, but feeds allies if used after preparing food.";
			SV_r.icon = spr_icon_pan;
			SV_r.price *= .5;
			SV_r.enCost *= 1.6;
			SV_r.cdAdd *= 8;
			SV_r.pwr *= 1;
			SV_r.acc = 999;
			SV_r.hitCount = 1;
			SV_r.hitGap *= 2;
			SV_r.atkScale = CHAR_VAR_MATK;
			SV_r.defScale = CHAR_VAR_MDEF;
			SV_r.spark_hit = spr_spark_bash;
			
			break;
			
	#endregion
		
	#region //firearm
	
		case WTAG_TYPE_HGN:
			SV_r.name = "Pistol";
			SV_r.desc = "Lightweight, easy to use weapon. Good backup firearm for recovering EN.";
			SV_r.icon = spr_icon_hgn;
			SV_r.price *= .5;
			SV_r.enCost *= .5;
			SV_r.cdAdd *= 1;
			SV_r.pwr *= 1;
			SV_r.acc *= .8;
			SV_r.hitCount = 3;
			SV_r.hitGap *= 1;
			SV_r.atkScale = CHAR_VAR_FATK;
			SV_r.defScale = CHAR_VAR_FDEF;
			SV_r.spark_hit = spr_spark_shoot;
			
			break;
			
		case WTAG_TYPE_SMG:
			SV_r.name = "SMG";
			SV_r.desc = "Relatively accurate and easy to use weapon, essentially a scaled up pistol.";
			SV_r.icon = spr_icon_smg;
			SV_r.price *= .8;
			SV_r.enCost *= 1;
			SV_r.cdAdd *= 1.4;
			SV_r.pwr *= .5;
			SV_r.acc *= .65;
			SV_r.hitCount = 8;
			SV_r.hitGap *= .6;
			SV_r.atkScale = CHAR_VAR_FATK;
			SV_r.defScale = CHAR_VAR_FDEF;
			SV_r.spark_hit = spr_spark_shoot;
			
			break;
			
		case WTAG_TYPE_SHG:
			SV_r.name = "Shotgun";
			SV_r.desc = "Low accuracy balanced with a flurry of pellets makes this weapon inconsistent but capable of immense damage.";
			SV_r.icon = spr_icon_shg;
			SV_r.price *= 1.5;
			SV_r.enCost *= 3;
			SV_r.cdAdd *= 4;
			SV_r.pwr *= 1;
			SV_r.acc *= .4;
			SV_r.hitCount = 1;
			SV_r.hitSimul = 8;
			SV_r.hitGap *= 1;
			SV_r.atkScale = CHAR_VAR_FATK;
			SV_r.defScale = CHAR_VAR_FDEF;
			SV_r.spark_hit = spr_spark_shoot;
			
			break;
			
		case WTAG_TYPE_LMG:
			SV_r.name = "LMG";
			SV_r.desc = "Hails high power bullets to hit all enemies at random. Unwieldly, but devastating to an isolated target.";
			SV_r.icon = spr_icon_lmg;
			SV_r.tgtType = ACT_TGT_RANDOM;
			SV_r.price *= 2;
			SV_r.enCost *= 3;
			SV_r.cdAdd *= 10;
			SV_r.pwr *= 1.2;
			SV_r.acc *= .7;
			SV_r.hitCount = 10;
			SV_r.hitGap *= .2;
			SV_r.atkScale = CHAR_VAR_FATK;
			SV_r.defScale = CHAR_VAR_FDEF;
			SV_r.spark_hit = spr_spark_shoot;
			
			break;
			
		case WTAG_TYPE_RPG:
			SV_r.name = "Launcher";
			SV_r.desc = "Incredibly slow and exhausting to fire, but deals incredible damage to all enemies.";
			SV_r.icon = spr_icon_rpg;
			SV_r.tgtType = ACT_TGT_WIDE;
			SV_r.price *= 3;
			SV_r.enCost *= 5;
			SV_r.cdAdd *= 20;
			SV_r.pwr *= 8;
			SV_r.acc *= .8;
			SV_r.hitCount = 1;
			SV_r.hitGap *= 1;
			SV_r.atkScale = CHAR_VAR_FATK;
			SV_r.defScale = CHAR_VAR_FDEF;
			SV_r.spark_hit = spr_spark_bash;
			SV_r.spark_end = spr_spark_smoke;
			
			break;
			
		case WTAG_TYPE_RFL:
			SV_r.name = "Rifle";
			SV_r.desc = "Cumbersome, but deals consistently high and accurate damage to single targets.";
			SV_r.icon = spr_icon_rfl;
			SV_r.price *= 1.8;
			SV_r.enCost *= 3;
			SV_r.cdAdd *= 8;
			SV_r.pwr *= 8;
			SV_r.acc *= .95;
			SV_r.hitCount = 1;
			SV_r.hitGap *= 1;
			SV_r.atkScale = CHAR_VAR_FATK;
			SV_r.defScale = CHAR_VAR_FDEF;
			SV_r.spark_hit = spr_spark_pierce;
			SV_r.se_hit = sfx_gun;
			
			break;
			
		case WTAG_TYPE_SLG:
			SV_r.name = "Sling";
			SV_r.desc = "An unorthodox weapon - weak, but inflicts strange effects on enemies if used after preparing food.";
			SV_r.icon = spr_icon_slg;
			SV_r.price *= .5;
			SV_r.enCost *= 1.5;
			SV_r.cdAdd *= 4;
			SV_r.pwr *= 1;
			SV_r.acc = .7;
			SV_r.hitCount = 1;
			SV_r.hitGap *= 2;
			SV_r.atkScale = CHAR_VAR_FATK;
			SV_r.defScale = CHAR_VAR_FDEF;
			
			break;
			
	#endregion
		
	#region //scroll
	
		case WTAG_TYPE_ASC_ARW:
			SV_r.name = "ARROW";
			SV_r.desc = "Simple, easy to use scroll. Best for exploiting elemental weaknesses.";
			SV_r.icon = spr_icon_arw;
			SV_r.price *= .6;
			SV_r.enCost *= 1.5;
			SV_r.cdAdd *= 1.5;
			SV_r.pwr *= 3.5;
			SV_r.acc *= .8;
			SV_r.hitCount = 1;
			SV_r.hitGap *= 1;
			SV_r.atkScale = CHAR_VAR_SATK;
			SV_r.defScale = CHAR_VAR_SDEF;
			SV_r.spark_hit = spr_spark_pierce;
			SV_r.se_hit = sfx_spell;
			
			if(SV_ele == ""){
				SV_ele = choose(CHAR_VAR_ELE_DRK,CHAR_VAR_ELE_LGT,CHAR_VAR_ELE_FIR,CHAR_VAR_ELE_ICE,CHAR_VAR_ELE_ELC,CHAR_VAR_ELE_NAT);
			}
			
			break;
			
		case WTAG_TYPE_ASC_RAY:
			SV_r.name = "RAY";
			SV_r.desc = "Scroll that casts a beam of energy as damaging as it is draining to use.";
			SV_r.icon = spr_icon_ray;
			SV_r.price *= 1;
			SV_r.enCost *= 3;
			SV_r.cdAdd *= 5;
			SV_r.pwr *= 8;
			SV_r.acc *= .85;
			SV_r.hitCount = 1;
			SV_r.hitGap *= 1;
			SV_r.atkScale = CHAR_VAR_SATK;
			SV_r.defScale = CHAR_VAR_SDEF;
			SV_r.spark_hit = spr_spark_bash;
			SV_r.se_hit = sfx_spell;
			
			if(SV_ele == ""){
				SV_ele = choose(CHAR_VAR_ELE_DRK,CHAR_VAR_ELE_LGT,CHAR_VAR_ELE_FIR,CHAR_VAR_ELE_ICE,CHAR_VAR_ELE_ELC,CHAR_VAR_ELE_NAT);
			}
			
			break;
			
		case WTAG_TYPE_ASC_VRT:
			SV_r.name = "VORTEX";
			SV_r.desc = "Complex scroll that damages all enemies. Increases in power with rank, but difficult to use properly.";
			SV_r.icon = spr_icon_vrt;
			SV_r.tgtType = ACT_TGT_WIDE;
			SV_r.price *= 2;
			SV_r.enCost *= 3;
			SV_r.cdAdd *= 4;
			SV_r.pwr *= 4;
			SV_r.acc *= .75;
			SV_r.hitCount = 1;
			SV_r.hitGap *= 1;
			SV_r.atkScale = CHAR_VAR_SATK;
			SV_r.defScale = CHAR_VAR_SDEF;
			SV_r.spark_hit = spr_spark_slash;
			SV_r.se_hit = sfx_spell;
			
			if(SV_ele == ""){
				SV_ele = choose(CHAR_VAR_ELE_DRK,CHAR_VAR_ELE_LGT,CHAR_VAR_ELE_FIR,CHAR_VAR_ELE_ICE,CHAR_VAR_ELE_ELC,CHAR_VAR_ELE_NAT);
			}
			
			break;
			
		case WTAG_TYPE_ASC_BRS:
			SV_r.name = "BURST";
			SV_r.desc = "A reckless scroll that fires off energy at random. Becomes more consistent at higher ranks.";
			SV_r.icon = spr_icon_brt;
			SV_r.price *= 1.8;
			SV_r.enCost *= 1.5;
			SV_r.cdAdd *= 1.5;
			SV_r.pwr *= 3.5;
			SV_r.acc *= .8;
			SV_r.hitCount = 1;
			SV_r.hitGap *= 1;
			SV_r.atkScale = CHAR_VAR_SATK;
			SV_r.defScale = CHAR_VAR_SDEF;
			SV_r.spark_hit = spr_spark_bash;
			SV_r.se_hit = sfx_spell;
			
			if(SV_ele == ""){
				SV_ele = choose(CHAR_VAR_ELE_DRK,CHAR_VAR_ELE_LGT,CHAR_VAR_ELE_FIR,CHAR_VAR_ELE_ICE,CHAR_VAR_ELE_ELC,CHAR_VAR_ELE_NAT);
			}
			
			break;
			
		case WTAG_TYPE_CSC:
			SV_r.name = "FLICT";
			SV_r.desc = "Inflicts ailments on a target. Easier to use at higher ranks, but susceptible to elemental resistances.";
			SV_r.icon = spr_icon_csc;
			SV_r.price *= 1;
			SV_r.enCost *= 2;
			SV_r.cdAdd *= 6;
			SV_r.pwr *= 0;
			SV_r.acc *= .9;
			SV_r.hitCount = 1;
			SV_r.hitGap *= 1;
			SV_r.atkScale = CHAR_VAR_SATK;
			SV_r.defScale = CHAR_VAR_SDEF;
			SV_r.spark_hit = spr_spark_pierce;
			SV_r.se_hit = sfx_spell;
			
			if(SV_ele == ""){
				SV_ele = choose(CHAR_VAR_ELE_DRK,CHAR_VAR_ELE_LGT,CHAR_VAR_ELE_FIR,CHAR_VAR_ELE_ICE,CHAR_VAR_ELE_ELC,CHAR_VAR_ELE_NAT);
			}
			
			var SV_sa = CHAR_SA_BRN;
			
			switch SV_ele{
				case CHAR_VAR_ELE_FIR:
					SV_sa = CHAR_SA_BRN;
					break;
					
				case CHAR_VAR_ELE_ICE:
					SV_sa = CHAR_SA_SLW;
					break;
					
				case CHAR_VAR_ELE_NAT:
					SV_sa = CHAR_SA_SLC;
					break;
					
				case CHAR_VAR_ELE_ELC:
					SV_sa = CHAR_SA_PAR;
					break;
					
				case CHAR_VAR_ELE_DRK:
					SV_sa = CHAR_SA_PSN;
					break;
					
				case CHAR_VAR_ELE_LGT:
					SV_sa = CHAR_SA_BLD;
					break;
			}
			
			SV_r.sa_chance[| SV_sa] = 1;
			SV_r.sa_inflict[| SV_sa] = 10;
			
			break;
			
		case WTAG_TYPE_SSC_HEAL:
			SV_r.tgtEnemy = false;
			SV_r.name = "MEDA";
			SV_r.desc = "Restore an ally's HP. Heal rate scales with rank.";
			SV_r.icon = spr_icon_heal;
			SV_r.price *= 1;
			SV_ele = "";
			SV_r.enCost *= 3;
			SV_r.cdAdd *= 5;
			SV_r.pwr *= 2;
			SV_r.acc = 999;
			SV_r.hitCount = 1;
			SV_r.hitGap *= 1;
			SV_r.atkScale = CHAR_VAR_SATK;
			SV_r.defScale = CHAR_VAR_SDEF;
			SV_r.spark_hit = spr_spark_dot;
			SV_r.se_hit = sfx_item;
			
			break;
			
		case WTAG_TYPE_SSC_CURE:
			SV_r.tgtEnemy = false;
			SV_r.name = "PURA";
			SV_r.desc = "Cure an ally of ailments. Recovery time improves with rank.";
			SV_r.icon = spr_icon_cure;
			SV_r.price *= 1.5;
			SV_ele = "";
			SV_r.enCost *= 5;
			SV_r.cdAdd *= 10;
			SV_r.pwr *= 0;
			SV_r.acc = 999;
			SV_r.hitCount = 1;
			SV_r.hitGap *= 1;
			SV_r.atkScale = CHAR_VAR_SATK;
			SV_r.defScale = CHAR_VAR_SDEF;
			SV_r.spark_start = spr_spark_dot;
			SV_r.effect_start = obj_handler_actEffect_cure;
			SV_r.nonAttack = true;
			SV_r.se_start = sfx_item;
			
			break;
			
		case WTAG_TYPE_SSC_RAISE:
			SV_r.tgtEnemy = false;
			SV_r.name = "VYRA";
			SV_r.desc = "Revive a fallen ally. Recovery time improves with rank.";
			SV_r.icon = spr_icon_raise;
			SV_r.price *= 5;
			SV_ele = "";
			SV_r.enCost *= 20;
			SV_r.cdAdd *= 20;
			SV_r.pwr *= .5;
			SV_r.acc = 999;
			SV_r.hitCount = 1;
			SV_r.hitGap *= 1;
			SV_r.atkScale = CHAR_VAR_SATK;
			SV_r.defScale = CHAR_VAR_SDEF;
			SV_r.spark_hit = spr_spark_dot;
			SV_r.revive = true;
			SV_r.se_hit = sfx_item;
			
			break;
			
	#endregion
		
	#region //shield
	
		case WTAG_TYPE_SHD_FLS:
			SV_r.tgtEnemy = false;
			SV_r.tgtType = ACT_TGT_SELF;
			SV_r.nonAttack = true;
			SV_r.name = "Fl-Shield";
			SV_r.desc = "Flash shield - with proper timing, moderately reduce incoming damage to allies.";
			SV_r.icon = spr_icon_shd;
			SV_r.price *= 1.5;
			SV_ele = "";
			SV_r.enCost *= 2;
			SV_r.cdAdd *= .5;
			SV_r.pwr = 0;
			SV_r.acc = 999;
			SV_r.hitCount = 1;
			SV_r.hitGap *= 1;
			SV_r.spark_start = spr_spark_dot;
			SV_r.effect_start = obj_handler_actEffect_shd;
			ds_list_clear(SV_r.special);
			ds_list_add(SV_r.special,.6); //def
			ds_list_add(SV_r.special,1); //duration
			
			break;
			
		case WTAG_TYPE_SHD_BRN:
			SV_r.tgtEnemy = false;
			SV_r.tgtType = ACT_TGT_SELF;
			SV_r.nonAttack = true;
			SV_r.name = "Br-Shield";
			SV_r.desc = "Burn Shield - slightly reduce incoming damage to allies for a long duration.";
			SV_r.icon = spr_icon_shd;
			SV_r.price *= 1.5;
			SV_ele = "";
			SV_r.enCost *= 1;
			SV_r.cdAdd *= 5;
			SV_r.pwr = 0;
			SV_r.acc = 999;
			SV_r.hitCount = 1;
			SV_r.hitGap *= 1;
			SV_r.spark_start = spr_spark_dot;
			SV_r.effect_start = obj_handler_actEffect_shd;
			ds_list_clear(SV_r.special);
			ds_list_add(SV_r.special,.2); //def
			ds_list_add(SV_r.special,6); //duration
			
			break;
			
		case WTAG_TYPE_SHD_STC:
			SV_r.tgtEnemy = false;
			SV_r.tgtType = ACT_TGT_SELF;
			SV_r.nonAttack = true;
			SV_r.stanceAct = true;
			SV_r.name = "St-Shield";
			SV_r.desc = "[Stance Act] Stance Shield - while active, EN slowly drains but damage to allies is reduced moderately.";
			SV_r.icon = spr_icon_shd;
			SV_r.price *= 2;
			SV_ele = "";
			SV_r.enCost *= .2;
			SV_r.cdAdd *= .5;
			SV_r.pwr = 0;
			SV_r.acc = 999;
			SV_r.hitCount = 1;
			SV_r.hitGap *= 1;
			SV_r.spark_start = spr_spark_dot;
			SV_r.effect_start = obj_handler_actEffect_shd;
			ds_list_clear(SV_r.special);
			ds_list_add(SV_r.special,.4); //def
			ds_list_add(SV_r.special,-1); //duration
			
			break;
			
	#endregion
	
	#region //enemy act
	
		#region //tackle
			case EACT_TACKLE:
				SV_r.name = "Tackle";
				SV_r.desc = "Brute force attack. Not particularly reliable in any way.";
				SV_r.enCost *= 0;
				SV_r.cdAdd *= 1;
				SV_r.pwr *= .8;
				SV_r.acc *= .75;
				SV_r.hitCount = 1;
				SV_r.hitGap *= 1;
				SV_r.atkScale = CHAR_VAR_MATK;
				SV_r.defScale = CHAR_VAR_MDEF;
				SV_r.spark_hit = spr_spark_bash;
				
				break;
		#endregion
			
		#region //paratackle
			case EACT_PARATACKLE:
				SV_r.name = "Shock Tackle";
				SV_r.desc = "Brute force attack. Unreliable, but has a moderate chance to paralyze.";
				SV_r.enCost *= 0;
				SV_r.cdAdd *= 2;
				SV_r.pwr *= .8;
				SV_r.acc *= .75;
				SV_r.hitCount = 1;
				SV_r.hitGap *= 1;
				SV_r.atkScale = CHAR_VAR_MATK;
				SV_r.defScale = CHAR_VAR_MDEF;
				SV_r.spark_hit = spr_spark_bash;
				SV_r.ele = CHAR_VAR_ELE_ELC;
				SV_r.sa_inflict[| CHAR_SA_PAR] = 10;
				SV_r.sa_chance[| CHAR_SA_PAR] = .4;
				
				break;
		#endregion
			
		#region //bite
			case EACT_BITE:
				SV_r.name = "Bite";
				SV_r.desc = "Nimble piercing attack. Weak, but hits twice.";
				SV_r.enCost *= 0;
				SV_r.cdAdd *= 1;
				SV_r.pwr *= .5;
				SV_r.acc *= .8;
				SV_r.hitCount = 2;
				SV_r.hitGap *= 1.4;
				SV_r.atkScale = CHAR_VAR_MATK;
				SV_r.defScale = CHAR_VAR_MDEF;
				SV_r.spark_hit = spr_spark_pierce;
				
				break;
		#endregion
		
		#region //petal snipe
			case EACT_PETALSNIPE:
				SV_r.name = "Petal Snipe";
				SV_r.desc = "Launches razor sharp leaves with pinpoint accuracy.";
				SV_r.enCost *= 0;
				SV_r.cdAdd *= 1;
				SV_r.pwr *= .3;
				SV_r.acc *= .9;
				SV_r.hitCount = 3;
				SV_r.hitGap *= 1;
				SV_r.atkScale = CHAR_VAR_FATK;
				SV_r.defScale = CHAR_VAR_FDEF;
				SV_r.spark_hit = spr_spark_shoot;
				SV_r.ele = CHAR_VAR_ELE_NAT;
				
				break;
		#endregion
		
		#region //toxic petal
			case EACT_TOXICPETAL:
				SV_r.name = "Toxic Petal";
				SV_r.desc = "Launches a caustic leaf, has a low chance of inflicting poison.";
				SV_r.enCost *= 0;
				SV_r.cdAdd *= 2.5;
				SV_r.pwr *= .5;
				SV_r.acc *= .6;
				SV_r.hitCount = 1;
				SV_r.hitGap *= 1;
				SV_r.atkScale = CHAR_VAR_FATK;
				SV_r.defScale = CHAR_VAR_FDEF;
				SV_r.spark_hit = spr_spark_shoot;
				SV_r.ele = CHAR_VAR_ELE_DRK;
				SV_r.sa_inflict[| CHAR_SA_PSN] = 4;
				SV_r.sa_chance[| CHAR_SA_PAR] = .3;
				
				break;
		#endregion
			
	#endregion
	
}

SV_r.ele = SV_ele;

switch(SV_ele){
	case CHAR_VAR_ELE_FIR:
		SV_r.name = "Flar " + SV_r.name;
		
		break;
	case CHAR_VAR_ELE_ICE:
		SV_r.name = "Fros " + SV_r.name;
		
		break;
	case CHAR_VAR_ELE_LGT:
		SV_r.name = "Weiz " + SV_r.name;
		
		break;
	case CHAR_VAR_ELE_DRK:
		SV_r.name = "Warz " + SV_r.name;
		
		break;
	case CHAR_VAR_ELE_ELC:
		SV_r.name = "Tesl " + SV_r.name;
		
		break;
	case CHAR_VAR_ELE_NAT:
		SV_r.name = "Terr " + SV_r.name;
		
		break;
}

if(SV_plus > 0){
	SV_r.pwr *= 1 + (SV_plus * .05);
	SV_r.name += " +" + string(SV_plus);
}

SV_r.price = round(SV_r.price);

return SV_r;