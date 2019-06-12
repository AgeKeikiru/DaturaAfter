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
SV_r.enCost = 100;
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
			SV_r.price *= 1;
			SV_r.enCost *= 1.5;
			SV_r.cdAdd *= 5;
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
			SV_r.price *= 2;
			SV_r.enCost *= 5;
			SV_r.cdAdd *= 12;
			SV_r.pwr *= 8;
			SV_r.acc *= .6;
			SV_r.hitCount = 1;
			SV_r.hitGap *= 1;
			SV_r.atkScale = CHAR_VAR_MATK;
			SV_r.defScale = CHAR_VAR_MDEF;
			SV_r.spark_hit = spr_spark_slash;
			
			break;
			
		case WTAG_TYPE_CSW:
			SV_r.name = "Chainsaw";
			SV_r.desc = "Reckless, difficult to use weapon that hits many times. Effective against unarmored enemies.";
			SV_r.price *= 2;
			
			break;
			
		case WTAG_TYPE_SCY:
			SV_r.name = "Scythe";
			SV_r.desc = "A stylish weapon that trades power for wide range. Best used to get rid of adds.";
			SV_r.price *= 1.5;
			
			break;
			
		case WTAG_TYPE_DGR:
			SV_r.name = "Dagger";
			SV_r.desc = "Lightweight, easy to use melee weapon. Accurate and swift, at the cost of power.";
			SV_r.price *= .5;
			
			break;
			
		case WTAG_TYPE_GNT:
			SV_r.name = "Gauntlet";
			SV_r.desc = "Provides accurate and powerful blows, but exhausts the wielder.";
			SV_r.price *= 1.5;
			
			break;
			
		case WTAG_TYPE_PAN:
			SV_r.name = "Pan";
			SV_r.desc = "An unorthodox weapon - weak, but feeds allies if used after preparing food.";
			SV_r.price *= .5;
			
			break;
			
	#endregion
		
	#region //firearm
	
		case WTAG_TYPE_HGN:
			SV_r.name = "Pistol";
			SV_r.desc = "Lightweight, easy to use weapon. Good backup firearm for recovering EN.";
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
			SV_r.price *= 1.5;
			
			break;
			
		case WTAG_TYPE_LMG:
			SV_r.name = "LMG";
			SV_r.desc = "Hails high power bullets to hit all enemies at random. Unwieldly, but devastating to an isolated target.";
			SV_r.price *= 2;
			
			break;
			
		case WTAG_TYPE_RPG:
			SV_r.name = "Launcher";
			SV_r.desc = "Incredibly slow and exhausting to fire, but deals incredible damage to all enemies.";
			SV_r.price *= 3;
			
			break;
			
		case WTAG_TYPE_RFL:
			SV_r.name = "Rifle";
			SV_r.desc = "Cumbersome, but deals consistently high and accurate damage to single targets.";
			SV_r.price *= 1.8;
			
			break;
			
		case WTAG_TYPE_SLG:
			SV_r.name = "Sling";
			SV_r.desc = "An unorthodox weapon - weak, but inflicts strange effects on enemies if used after preparing food.";
			SV_r.price *= .5;
			
			break;
			
	#endregion
		
	#region //scroll
	
		case WTAG_TYPE_ASC_ARW:
			SV_r.name = "ARROW";
			SV_r.desc = "Simple, easy to use scroll. Best for exploiting elemental weaknesses.";
			SV_r.price *= .6;
			SV_r.enCost *= 1.5;
			SV_r.cdAdd *= 1.5;
			SV_r.pwr *= 3.5;
			SV_r.acc *= .8;
			SV_r.hitCount = 1;
			SV_r.hitGap *= 1;
			SV_r.atkScale = CHAR_VAR_SATK;
			SV_r.defScale = CHAR_VAR_SDEF;
			SV_r.spark_hit = spr_spark_bash;
			
			if(SV_ele == ""){
				SV_ele = choose(CHAR_VAR_ELE_DRK,CHAR_VAR_ELE_LGT,CHAR_VAR_ELE_FIR,CHAR_VAR_ELE_ICE,CHAR_VAR_ELE_ELC,CHAR_VAR_ELE_NAT);
			}
			
			break;
			
		case WTAG_TYPE_ASC_RAY:
			SV_r.name = "RAY";
			SV_r.desc = "Scroll that casts a beam of energy as damaging as it is draining to use.";
			SV_r.price *= 1;
			
			if(SV_ele == ""){
				SV_ele = choose(CHAR_VAR_ELE_DRK,CHAR_VAR_ELE_LGT,CHAR_VAR_ELE_FIR,CHAR_VAR_ELE_ICE,CHAR_VAR_ELE_ELC,CHAR_VAR_ELE_NAT);
			}
			
			break;
			
		case WTAG_TYPE_ASC_VRT:
			SV_r.name = "VORTEX";
			SV_r.desc = "Complex scroll that damages all enemies. Increases in power with rank, but difficult to use properly.";
			SV_r.price *= 2;
			
			if(SV_ele == ""){
				SV_ele = choose(CHAR_VAR_ELE_DRK,CHAR_VAR_ELE_LGT,CHAR_VAR_ELE_FIR,CHAR_VAR_ELE_ICE,CHAR_VAR_ELE_ELC,CHAR_VAR_ELE_NAT);
			}
			
			break;
			
		case WTAG_TYPE_ASC_BRS:
			SV_r.name = "BURST";
			SV_r.desc = "A reckless scroll that fires off energy at random. Becomes more consistent at higher ranks.";
			SV_r.price *= 1.8;
			
			if(SV_ele == ""){
				SV_ele = choose(CHAR_VAR_ELE_DRK,CHAR_VAR_ELE_LGT,CHAR_VAR_ELE_FIR,CHAR_VAR_ELE_ICE,CHAR_VAR_ELE_ELC,CHAR_VAR_ELE_NAT);
			}
			
			break;
			
		case WTAG_TYPE_CSC:
			SV_r.name = "FLICT";
			SV_r.desc = "Inflicts ailments on a target. Easier to use at higher ranks, but susceptible to elemental resistances.";
			SV_r.price *= 1;
			
			if(SV_ele == ""){
				SV_ele = choose(CHAR_VAR_ELE_DRK,CHAR_VAR_ELE_LGT,CHAR_VAR_ELE_FIR,CHAR_VAR_ELE_ICE,CHAR_VAR_ELE_ELC,CHAR_VAR_ELE_NAT);
			}
			
			break;
			
		case WTAG_TYPE_SSC_HEAL:
			SV_r.tgtEnemy = false;
			SV_r.name = "MEDA";
			SV_r.desc = "Restore an ally's HP. Heal rate scales with rank.";
			SV_r.price *= 1;
			SV_ele = "";
			SV_r.enCost *= 3;
			SV_r.cdAdd *= 5;
			SV_r.pwr *= 1;
			SV_r.acc = 999;
			SV_r.hitCount = 1;
			SV_r.hitGap *= 1;
			SV_r.atkScale = CHAR_VAR_SATK;
			SV_r.defScale = CHAR_VAR_SDEF;
			//SV_r.spark_hit = spr_spark_slash;
			
			break;
			
		case WTAG_TYPE_SSC_CURE:
			SV_r.tgtEnemy = false;
			SV_r.name = "PURA";
			SV_r.desc = "Cure an ally of ailments. Becomes easier to use at higher ranks.";
			SV_r.price *= 1.5;
			SV_ele = "";
			SV_r.acc = 999;
			
			break;
			
		case WTAG_TYPE_SSC_RAISE:
			SV_r.tgtEnemy = false;
			SV_r.name = "VYRA";
			SV_r.desc = "Revive a fallen ally. Recovery time and health restored improves with rank.";
			SV_r.price *= 5;
			SV_ele = "";
			SV_r.acc = 999;
			
			break;
			
	#endregion
		
	#region //shield
	
		case WTAG_TYPE_SHD_FLS:
			SV_r.tgtEnemy = false;
			SV_r.name = "Fl-Shield";
			SV_r.desc = "Flash shield - with proper timing, moderately reduce incoming damage to allies.";
			SV_r.price *= 1.5;
			SV_ele = "";
			SV_r.acc = 999;
			
			break;
			
		case WTAG_TYPE_SHD_BRN:
			SV_r.tgtEnemy = false;
			SV_r.name = "Br-Shield";
			SV_r.desc = "Burn Shield - slightly reduce incoming damage to allies for a long duration.";
			SV_r.price *= 1.5;
			SV_ele = "";
			SV_r.acc = 999;
			
			break;
			
		case WTAG_TYPE_SHD_STC:
			SV_r.tgtEnemy = false;
			SV_r.name = "St-Shield";
			SV_r.desc = "[STANCE ACT] Stance Shield - while active, EN does not regenerate but damage to allies is reduced moderately.";
			SV_r.price *= 2;
			SV_ele = "";
			SV_r.acc = 999;
			
			break;
			
	#endregion
	
	#region //enemy act
	
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