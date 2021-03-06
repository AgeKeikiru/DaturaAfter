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
SV_r = instance_create_depth(0,0,0,obj_handler_act),
SV_names;

SV_r.baseName = "???";
SV_r.desc = "A strange object hailing from beyond the void.";
SV_r.basePrice = 1000;
SV_r.rare = SV_rare;
SV_r.plus = SV_plus;
SV_r.type = SV_type;
SV_r.tgtType = ACT_TGT_SINGLE;
SV_r.basePwr = 100;
SV_r.acc = 100;
SV_r.hitCount = 1;
SV_r.hitGap = 10;
SV_r.hitSimul = 1;
SV_r.atkScale = CHAR_VAR_MATK;
SV_r.defScale = CHAR_VAR_MDEF;
SV_r.critMod = 0;
SV_r.tgtEnemy = true;
SV_r.spark_start = noone;
SV_r.spark_hit = noone;
SV_r.spark_end = noone;

switch(SV_type){
	
	#region //melee
	
		case WTAG_TYPE_SWD:
			SV_names = [
				"Sword",
				"Gisword",
				"Saber",
				"Gisaber",
				"Claymore",
				"Giclaymore"
			];
			
			if(SV_rare < array_length_1d(SV_names)){
				SV_r.baseName = SV_names[SV_rare];
			}
			
			SV_r.desc = "Balanced, straightforward weapon. Solid choice for any melee class.";
			SV_r.upgDesc = "Upgrade Swords to increase power and accuracy.";
			SV_r.icon = spr_icon_swd;
			SV_r.basePrice *= 1;
			SV_r.enBase *= 1.5;
			SV_r.cdBase *= 4;
			SV_r.basePwr *= 1.5 + (.15 * SV_rare);
			SV_r.acc *= .8 + (.02 * SV_rare);
			SV_r.hitCount = 3;
			SV_r.hitGap *= 1.4;
			SV_r.atkScale = CHAR_VAR_MATK;
			SV_r.defScale = CHAR_VAR_MDEF;
			SV_r.spark_hit = spr_spark_slash;
			
			break;
			
		case WTAG_TYPE_AXE:
			SV_names = [
				"Axe",
				"Giraxe",
				"Rounder",
				"Girounder",
				"Splitter",
				"Gisplitter"
			];
			
			if(SV_rare < array_length_1d(SV_names)){
				SV_r.baseName = SV_names[SV_rare];
			}
			
			SV_r.desc = "Violent weapon that relies on raw power. Cumbersome, but decimates when it hits.";
			SV_r.upgDesc = "Upgrade Axes to increase power.";
			SV_r.icon = spr_icon_axe;
			SV_r.basePrice *= 2;
			SV_r.enBase *= 3;
			SV_r.cdBase *= 12;
			SV_r.basePwr *= 8 + (.5 * SV_rare);
			SV_r.acc *= .6;
			SV_r.hitCount = 1;
			SV_r.hitGap *= 1;
			SV_r.atkScale = CHAR_VAR_MATK;
			SV_r.defScale = CHAR_VAR_MDEF;
			SV_r.spark_hit = spr_spark_slash;
			SV_r.se_hit = sfx_melee;
			
			break;
			
		case WTAG_TYPE_CSW:
			SV_names = [
				"Chainsaw",
				"Gisaw",
				"Chainblade",
				"Giblade",
				"Ripper",
				"Giripper"
			];
			
			if(SV_rare < array_length_1d(SV_names)){
				SV_r.baseName = SV_names[SV_rare];
			}
			
			SV_r.desc = "Reckless, difficult to use weapon that hits many times. Effective against unarmored enemies.";
			SV_r.upgDesc = "Upgrade Chainsaws to increase hit count.";
			SV_r.icon = spr_icon_csw;
			SV_r.basePrice *= 2;
			SV_r.enBase *= 3;
			SV_r.cdBase *= 6;
			SV_r.basePwr *= 1;
			SV_r.acc *= .5;
			SV_r.hitCount = 6 + (1 * SV_rare);
			SV_r.hitGap *= .2;
			SV_r.atkScale = CHAR_VAR_MATK;
			SV_r.defScale = CHAR_VAR_MDEF;
			SV_r.spark_hit = spr_spark_slash;
			
			break;
			
		case WTAG_TYPE_SCY:
			SV_names = [
				"Scythe",
				"Giscythe",
				"Halberd",
				"Gihalberd",
				"Crescent",
				"Giscent"
			];
			
			if(SV_rare < array_length_1d(SV_names)){
				SV_r.baseName = SV_names[SV_rare];
			}
			
			SV_r.desc = "A stylish weapon that trades power for wide range. Best used to get rid of adds.";
			SV_r.upgDesc = "Upgrade Scythes to increase crit rate and hit count (every 2 ranks).";
			SV_r.icon = spr_icon_scy;
			SV_r.tgtType = ACT_TGT_WIDE;
			SV_r.basePrice *= 1.5;
			SV_r.enBase *= 2;
			SV_r.cdBase *= 4;
			SV_r.basePwr *= 1.3;
			SV_r.critMod = .05 * SV_rare;
			SV_r.acc *= .7;
			SV_r.hitCount = floor(1 + (.5 * SV_rare));
			SV_r.hitGap *= .8;
			SV_r.atkScale = CHAR_VAR_MATK;
			SV_r.defScale = CHAR_VAR_MDEF;
			SV_r.spark_hit = spr_spark_slash;
			SV_r.se_hit = sfx_pierce;
			
			break;
			
		case WTAG_TYPE_DGR:
			SV_names = [
				"Dagger",
				"Gidagger",
				"Seax",
				"Giseax",
				"Baselard",
				"Gilard"
			];
			
			if(SV_rare < array_length_1d(SV_names)){
				SV_r.baseName = SV_names[SV_rare];
			}
			
			SV_r.desc = "Lightweight, easy to use melee weapon. Accurate and swift, at the cost of power.";
			SV_r.upgDesc = "Upgrade Daggers to increase EN recovery."; //todo
			SV_r.icon = spr_icon_dgr;
			SV_r.basePrice *= .5;
			SV_r.enBase *= .2;
			SV_r.cdBase *= .5;
			SV_r.basePwr *= 1;
			SV_r.acc *= .9;
			SV_r.hitCount = 2;
			SV_r.hitGap *= 1.3;
			SV_r.atkScale = CHAR_VAR_MATK;
			SV_r.defScale = CHAR_VAR_MDEF;
			SV_r.spark_hit = spr_spark_pierce;
			
			break;
			
		case WTAG_TYPE_GNT:
			SV_names = [
				"Gauntlet",
				"Gigauntlet",
				"Tonfa",
				"Gitonfa",
				"Duster",
				"Giduster"
			];
			
			if(SV_rare < array_length_1d(SV_names)){
				SV_r.baseName = SV_names[SV_rare];
			}
			
			SV_r.desc = "Provides accurate and powerful blows, but exhausts the wielder.";
			SV_r.upgDesc = "Upgrade Gauntlets to add stun chance.";
			SV_r.icon = spr_icon_gnt;
			SV_r.basePrice *= 1.5;
			SV_r.enBase *= 2.5;
			SV_r.cdBase *= 16;
			SV_r.basePwr *= 2;
			SV_r.acc *= .95;
			SV_r.hitCount = 4;
			SV_r.hitGap *= 1.2;
			SV_r.atkScale = CHAR_VAR_MATK;
			SV_r.defScale = CHAR_VAR_MDEF;
			SV_r.spark_hit = spr_spark_bash;
			SV_r.stun_chance = .1 * SV_rare;
			SV_r.stun_onHit = true;
			
			break;
			
		case WTAG_TYPE_PAN:
			SV_names = [
				"Pan",
				"Gipan",
				"Skillet",
				"Giskillet",
				"Wok",
				"Giwok"
			];
			
			if(SV_rare < array_length_1d(SV_names)){
				SV_r.baseName = SV_names[SV_rare];
			}
			
			SV_r.desc = "An unorthodox weapon - weak, but feeds allies if used after preparing food.";
			SV_r.upgDesc = "Upgrade Pans to reduce cooldown duration.";
			SV_r.icon = spr_icon_pan;
			SV_r.basePrice *= .5;
			SV_r.enBase *= 1.6;
			SV_r.cdBase *= 8;
			SV_r.cdRate = -.1;
			SV_r.basePwr *= 1;
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
			SV_names = [
				"Handgun",
				"Handgun M",
				"Tiger",
				"Tiger M",
				"Tomcat",
				"Tomcat X"
			];
			
			if(SV_rare < array_length_1d(SV_names)){
				SV_r.baseName = SV_names[SV_rare];
			}
			
			SV_r.desc = "Lightweight, easy to use weapon. Good backup firearm for recovering EN.";
			SV_r.upgDesc = "Upgrade Handguns to increase EN recovery."; //todo
			SV_r.icon = spr_icon_hgn;
			SV_r.basePrice *= .5;
			SV_r.enBase *= .2;
			SV_r.cdBase *= 1;
			SV_r.basePwr *= 1;
			SV_r.acc *= .8;
			SV_r.hitCount = 3;
			SV_r.hitGap *= 1;
			SV_r.atkScale = CHAR_VAR_FATK;
			SV_r.defScale = CHAR_VAR_FDEF;
			SV_r.spark_hit = spr_spark_shoot;
			
			break;
			
		case WTAG_TYPE_SMG:
			SV_names = [
				"SMG",
				"SMG M",
				"Eagle",
				"Eagle M",
				"Raptor",
				"Raptor X"
			];
			
			if(SV_rare < array_length_1d(SV_names)){
				SV_r.baseName = SV_names[SV_rare];
			}
			
			SV_r.desc = "Relatively accurate and easy to use weapon, essentially a scaled up pistol.";
			SV_r.upgDesc = "Upgrade SMGs to increase accuracy and hit count.";
			SV_r.icon = spr_icon_smg;
			SV_r.basePrice *= .8;
			SV_r.enBase *= 1;
			SV_r.cdBase *= 1.4;
			SV_r.basePwr *= .5;
			SV_r.acc *= .65 + (.01 * SV_rare);
			SV_r.hitCount = 5 + (1 * SV_rare);
			SV_r.hitGap *= .7 + (-.02 * SV_rare);
			SV_r.atkScale = CHAR_VAR_FATK;
			SV_r.defScale = CHAR_VAR_FDEF;
			SV_r.spark_hit = spr_spark_shoot;
			
			break;
			
		case WTAG_TYPE_SHG:
			SV_names = [
				"Shotgun",
				"Shotgun M",
				"Flanker",
				"Flanker M",
				"Berkut",
				"Berkut X"
			];
			
			if(SV_rare < array_length_1d(SV_names)){
				SV_r.baseName = SV_names[SV_rare];
			}
			
			SV_r.desc = "Low accuracy balanced with a flurry of pellets makes this weapon inconsistent but capable of immense damage.";
			SV_r.upgDesc = "Upgrade Shotguns to increase hit count.";
			SV_r.icon = spr_icon_shg;
			SV_r.basePrice *= 1.5;
			SV_r.enBase *= 3;
			SV_r.cdBase *= 4;
			SV_r.basePwr *= 1;
			SV_r.acc *= .4;
			SV_r.hitCount = 1;
			SV_r.hitSimul = 6 + (1 * SV_rare);
			SV_r.hitGap *= 1;
			SV_r.atkScale = CHAR_VAR_FATK;
			SV_r.defScale = CHAR_VAR_FDEF;
			SV_r.spark_hit = spr_spark_shoot;
			
			break;
			
		case WTAG_TYPE_LMG:
			SV_names = [
				"LMG",
				"LMG M",
				"Flogger",
				"Flogger M",
				"Fullback",
				"Fullback X"
			];
			
			if(SV_rare < array_length_1d(SV_names)){
				SV_r.baseName = SV_names[SV_rare];
			}
			
			SV_r.desc = "Hails high power bullets to hit all enemies at random. Unwieldly, but devastating to an isolated target.";
			SV_r.upgDesc = "Upgrade LMGs to add stun chance.";
			SV_r.icon = spr_icon_lmg;
			SV_r.tgtType = ACT_TGT_RANDOM;
			SV_r.basePrice *= 2;
			SV_r.enBase *= 5;
			SV_r.cdBase *= 15;
			SV_r.basePwr *= 1.2;
			SV_r.acc *= .6;
			SV_r.hitCount = 8;
			SV_r.hitGap *= .4;
			SV_r.atkScale = CHAR_VAR_FATK;
			SV_r.defScale = CHAR_VAR_FDEF;
			SV_r.spark_hit = spr_spark_shoot;
			SV_r.stun_chance = .1 * SV_rare;
			SV_r.stun_onHit = true;
			
			break;
			
		case WTAG_TYPE_RPG:
			SV_names = [
				"RPG",
				"RPG M",
				"Corsair",
				"Corsair M",
				"Thunderbolt",
				"Thunderbolt X"
			];
			
			if(SV_rare < array_length_1d(SV_names)){
				SV_r.baseName = SV_names[SV_rare];
			}
			
			SV_r.desc = "Incredibly slow and exhausting to fire, but deals incredible damage to all enemies.";
			SV_r.upgDesc = "Upgrade RPGs to increase power and add stun chance.";
			SV_r.icon = spr_icon_rpg;
			SV_r.tgtType = ACT_TGT_WIDE;
			SV_r.basePrice *= 3;
			SV_r.enBase *= 5;
			SV_r.cdBase *= 20;
			SV_r.basePwr *= 8 + (.2 * SV_rare);
			SV_r.acc *= .8;
			SV_r.hitCount = 1;
			SV_r.hitGap *= 1;
			SV_r.atkScale = CHAR_VAR_FATK;
			SV_r.defScale = CHAR_VAR_FDEF;
			SV_r.spark_hit = spr_spark_bash;
			SV_r.spark_end = spr_spark_smoke;
			SV_r.stun_chance = .05 * SV_rare;
			SV_r.stun_onHit = true;
			
			break;
			
		case WTAG_TYPE_RFL:
			SV_names = [
				"Rifle",
				"Rifle M",
				"Canberra",
				"Canberra M",
				"Blackbird",
				"Blackbird X"
			];
			
			if(SV_rare < array_length_1d(SV_names)){
				SV_r.baseName = SV_names[SV_rare];
			}
			
			SV_r.desc = "Cumbersome, but deals consistently high and accurate damage to single targets.";
			SV_r.upgDesc = "Upgrade Rifles to increase accuracy and crit rate.";
			SV_r.icon = spr_icon_rfl;
			SV_r.basePrice *= 1.8;
			SV_r.enBase *= 3;
			SV_r.cdBase *= 8;
			SV_r.basePwr *= 8;
			SV_r.acc *= .9 + (.05 * SV_rare);
			SV_r.hitCount = 1;
			SV_r.hitGap *= 1;
			SV_r.atkScale = CHAR_VAR_FATK;
			SV_r.defScale = CHAR_VAR_FDEF;
			SV_r.spark_hit = spr_spark_pierce;
			SV_r.critMod = .05 * SV_rare;
			
			break;
			
		case WTAG_TYPE_SLG:
			SV_names = [
				"Sling",
				"Sling M",
				"Sentry",
				"Sentry M",
				"Expeditor",
				"Expeditor X"
			];
			
			if(SV_rare < array_length_1d(SV_names)){
				SV_r.baseName = SV_names[SV_rare];
			}
			
			SV_r.desc = "An unorthodox weapon - weak, but inflicts strange effects on enemies if used after preparing food.";
			SV_r.upgDesc = "Upgrade Slings to reduce cooldown duration.";
			SV_r.icon = spr_icon_slg;
			SV_r.basePrice *= .5;
			SV_r.enBase *= 1.5;
			SV_r.cdBase *= 4;
			SV_r.cdRate = -.1;
			SV_r.basePwr *= 1;
			SV_r.acc *= .7;
			SV_r.hitCount = 1;
			SV_r.hitGap *= 2;
			SV_r.atkScale = CHAR_VAR_FATK;
			SV_r.defScale = CHAR_VAR_FDEF;
			
			break;
			
	#endregion
		
	#region //scroll
	
		case WTAG_TYPE_ASC_ARW:
			SV_names = [
				"",
				"II",
				"III",
				"IV",
				"V",
				"VI"
			];
			
			if(SV_rare < array_length_1d(SV_names)){
				SV_r.baseName = "ARROW " + SV_names[SV_rare];
			}
			
			SV_r.desc = "Simple, easy to use scroll. Best for exploiting elemental weaknesses.";
			SV_r.upgDesc = "Upgrade ARROW to greatly increase crit rate.";
			SV_r.icon = spr_icon_arw;
			SV_r.basePrice *= .6;
			SV_r.enBase *= 1.5;
			SV_r.cdBase *= 1.5;
			SV_r.basePwr *= 3.5;
			SV_r.acc *= .8;
			SV_r.hitCount = 1;
			SV_r.hitGap *= 1;
			SV_r.atkScale = CHAR_VAR_SATK;
			SV_r.defScale = CHAR_VAR_SDEF;
			SV_r.spark_hit = spr_spark_pierce;
			SV_r.se_hit = sfx_spell;
			SV_r.critMod = .15 * SV_rare;
			
			if(SV_ele == ""){
				SV_ele = choose(CHAR_VAR_ELE_DRK,CHAR_VAR_ELE_LGT,CHAR_VAR_ELE_FIR,CHAR_VAR_ELE_ICE,CHAR_VAR_ELE_ELC,CHAR_VAR_ELE_NAT);
			}
			
			break;
			
		case WTAG_TYPE_ASC_RAY:
			SV_names = [
				"",
				"II",
				"III",
				"IV",
				"V",
				"VI"
			];
			
			if(SV_rare < array_length_1d(SV_names)){
				SV_r.baseName = "RAY " + SV_names[SV_rare];
			}
			
			SV_r.desc = "Scroll that casts a beam of energy as damaging as it is draining to use.";
			SV_r.upgDesc = "Upgrade RAY to increase accuracy and add stun chance.";
			SV_r.icon = spr_icon_ray;
			SV_r.basePrice *= 1;
			SV_r.enBase *= 3;
			SV_r.cdBase *= 5;
			SV_r.basePwr *= 8;
			SV_r.acc *= .8 + (.01 * SV_rare);
			SV_r.hitCount = 1;
			SV_r.hitGap *= 1;
			SV_r.atkScale = CHAR_VAR_SATK;
			SV_r.defScale = CHAR_VAR_SDEF;
			SV_r.spark_hit = spr_spark_bash;
			SV_r.se_hit = sfx_spell;
			SV_r.stun_chance = .1 * SV_rare;
			SV_r.stun_onHit = true;
			
			if(SV_ele == ""){
				SV_ele = choose(CHAR_VAR_ELE_DRK,CHAR_VAR_ELE_LGT,CHAR_VAR_ELE_FIR,CHAR_VAR_ELE_ICE,CHAR_VAR_ELE_ELC,CHAR_VAR_ELE_NAT);
			}
			
			break;
			
		case WTAG_TYPE_ASC_VRT:
			SV_names = [
				"",
				"II",
				"III",
				"IV",
				"V",
				"VI"
			];
			
			if(SV_rare < array_length_1d(SV_names)){
				SV_r.baseName = "VORTEX " + SV_names[SV_rare];
			}
			
			SV_r.desc = "Complex scroll that damages all enemies. Increases in power with rank, but difficult to use properly.";
			SV_r.upgDesc = "Upgrade VORTEX to increase power.";
			SV_r.icon = spr_icon_vrt;
			SV_r.tgtType = ACT_TGT_WIDE;
			SV_r.basePrice *= 2;
			SV_r.enBase *= 3;
			SV_r.cdBase *= 4;
			SV_r.basePwr *= 4 + (.4 * SV_rare);
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
			SV_names = [
				"",
				"II",
				"III",
				"IV",
				"V",
				"VI"
			];
			
			if(SV_rare < array_length_1d(SV_names)){
				SV_r.baseName = "BURST " + SV_names[SV_rare];
			}
			
			SV_r.desc = "A reckless scroll that fires off energy at random. Becomes more volatile at higher ranks.";
			SV_r.upgDesc = "Upgrade BURST to increase power and hit count (every 2 ranks).";
			SV_r.icon = spr_icon_brt;
			SV_r.tgtType = ACT_TGT_RANDOM;
			SV_r.basePrice *= 1.8;
			SV_r.enBase *= 1.5;
			SV_r.cdBase *= 1.5;
			SV_r.basePwr *= 2 + (.2 * SV_rare);
			SV_r.acc *= .7;
			SV_r.hitCount = floor(3 + (.5 * SV_rare));
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
			SV_names = [
				"",
				"II",
				"III",
				"IV",
				"V",
				"VI"
			];
			
			if(SV_rare < array_length_1d(SV_names)){
				SV_r.baseName = "FLICT " + SV_names[SV_rare];
			}
			
			SV_r.desc = "Inflicts ailments on a target. Easier to use at higher ranks, but susceptible to elemental resistances.";
			SV_r.upgDesc = "Upgrade FLICT to increase accuracy and effect duration.";
			SV_r.icon = spr_icon_csc;
			SV_r.basePrice *= 1;
			SV_r.enBase *= 2;
			SV_r.cdBase *= 6;
			SV_r.basePwr *= 0;
			SV_r.acc *= 999;
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
			
			SV_r.sa_chance[| SV_sa] = .4 + (.1 * SV_rare);
			SV_r.sa_inflict[| SV_sa] = 3 + (1 * SV_rare);
			
			break;
			
		case WTAG_TYPE_SSC_HEAL:
			SV_r.tgtEnemy = false;
			
			SV_names = [
				"",
				"II",
				"III",
				"IV",
				"V",
				"VI"
			];
			
			if(SV_rare < array_length_1d(SV_names)){
				SV_r.baseName = "MEDA " + SV_names[SV_rare];
			}
			
			SV_r.desc = "Restore an ally's HP. Heal rate scales with rank.";
			SV_r.upgDesc = "Upgrade MEDA to increase heal power.";
			SV_r.icon = spr_icon_heal;
			SV_r.basePrice *= 1;
			SV_ele = "";
			SV_r.enBase *= 3;
			SV_r.cdBase *= 5;
			SV_r.basePwr *= 2 + (1.5 * SV_rare);
			SV_r.acc = 999;
			SV_r.hitCount = 1;
			SV_r.hitGap *= 1;
			SV_r.atkScale = CHAR_VAR_SDEF;
			SV_r.defScale = CHAR_VAR_SDEF;
			SV_r.spark_hit = spr_spark_dot;
			SV_r.se_hit = sfx_item;
			
			break;
			
		case WTAG_TYPE_SSC_CURE:
			SV_r.tgtEnemy = false;
			
			SV_names = [
				"",
				"II",
				"III",
				"IV",
				"V",
				"VI"
			];
			
			if(SV_rare < array_length_1d(SV_names)){
				SV_r.baseName = "PURA " + SV_names[SV_rare];
			}
			
			SV_r.desc = "Cure an ally of ailments. Recovery time improves with rank.";
			SV_r.upgDesc = "Upgrade PURA to reduce cooldown duration.";
			SV_r.icon = spr_icon_cure;
			SV_r.basePrice *= 1.5;
			SV_ele = "";
			SV_r.enBase *= 5;
			SV_r.cdBase *= 10;
			SV_r.cdRate = -.12;
			SV_r.basePwr *= 0;
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
			
			SV_names = [
				"",
				"II",
				"III",
				"IV",
				"V",
				"VI"
			];
			
			if(SV_rare < array_length_1d(SV_names)){
				SV_r.baseName = "VYRA " + SV_names[SV_rare];
			}
			
			SV_r.desc = "Revive a fallen ally. Recovery time improves with rank.";
			SV_r.upgDesc = "Upgrade VYRA to reduce cooldown duration.";
			SV_r.icon = spr_icon_raise;
			SV_r.basePrice *= 5;
			SV_ele = "";
			SV_r.enBase *= 20;
			SV_r.cdBase *= 20;
			SV_r.cdRate = -.05;
			SV_r.basePwr *= .5;
			SV_r.acc = 999;
			SV_r.hitCount = 1;
			SV_r.hitGap *= 1;
			SV_r.atkScale = CHAR_VAR_SDEF;
			SV_r.defScale = CHAR_VAR_SDEF;
			SV_r.spark_hit = spr_spark_dot;
			SV_r.revive = true;
			SV_r.se_hit = sfx_item;
			
			break;
			
	#endregion
		
	#region //shield
	
		case WTAG_TYPE_SHD_FLS:
			SV_names = [
				"Shield",
				"Shielder",
				"Shieldest",
				"Shield[cl-r]",
				"Shield:CTB",
				"Shield Xrd"
			];
			
			if(SV_rare < array_length_1d(SV_names)){
				SV_r.baseName = "Fl-" + SV_names[SV_rare];
			}
		
			SV_r.tgtEnemy = false;
			SV_r.tgtType = ACT_TGT_SELF;
			SV_r.nonAttack = true;
			SV_r.desc = "Flash shield - with proper timing, moderately reduce incoming damage to allies.";
			SV_r.upgDesc = "Upgrade Shields to increase damage protection.";
			SV_r.icon = spr_icon_shd;
			SV_r.basePrice *= 1.5;
			SV_ele = "";
			SV_r.enBase *= 2;
			SV_r.cdBase *= .5;
			SV_r.basePwr = 0;
			SV_r.acc = 999;
			SV_r.hitCount = 1;
			SV_r.hitGap *= 1;
			SV_r.spark_start = spr_spark_dot;
			SV_r.effect_start = obj_handler_actEffect_shd;
			ds_list_clear(SV_r.special);
			ds_list_add(SV_r.special,.6 + (.2 * SV_rare)); //def
			ds_list_add(SV_r.special,1); //duration
			
			break;
			
		case WTAG_TYPE_SHD_BRN:
			SV_names = [
				"Shield",
				"Shielder",
				"Shieldest",
				"Shield[cl-r]",
				"Shield:CTB",
				"Shield Xrd"
			];
			
			if(SV_rare < array_length_1d(SV_names)){
				SV_r.baseName = "Br-" + SV_names[SV_rare];
			}
		
			SV_r.tgtEnemy = false;
			SV_r.tgtType = ACT_TGT_SELF;
			SV_r.nonAttack = true;
			SV_r.desc = "Burn Shield - slightly reduce incoming damage to allies for a long duration.";
			SV_r.upgDesc = "Upgrade Shields to increase damage protection.";
			SV_r.icon = spr_icon_shd;
			SV_r.basePrice *= 1.5;
			SV_ele = "";
			SV_r.enBase *= 1;
			SV_r.cdBase *= 5;
			SV_r.basePwr = 0;
			SV_r.acc = 999;
			SV_r.hitCount = 1;
			SV_r.hitGap *= 1;
			SV_r.spark_start = spr_spark_dot;
			SV_r.effect_start = obj_handler_actEffect_shd;
			ds_list_clear(SV_r.special);
			ds_list_add(SV_r.special,.2 + (.2 * SV_rare)); //def
			ds_list_add(SV_r.special,6); //duration
			
			break;
			
		case WTAG_TYPE_SHD_STC:
			SV_names = [
				"Shield",
				"Shielder",
				"Shieldest",
				"Shield[cl-r]",
				"Shield:CTB",
				"Shield Xrd"
			];
			
			if(SV_rare < array_length_1d(SV_names)){
				SV_r.baseName = "St-" + SV_names[SV_rare];
			}
			
			SV_r.tgtEnemy = false;
			SV_r.tgtType = ACT_TGT_SELF;
			SV_r.nonAttack = true;
			SV_r.stanceAct = true;
			SV_r.desc = "[Stance Act] Stance Shield - while active, EN slowly drains but damage to allies is reduced moderately.";
			SV_r.upgDesc = "Upgrade Shields to increase damage protection.";
			SV_r.icon = spr_icon_shd;
			SV_r.basePrice *= 2;
			SV_ele = "";
			SV_r.enBase *= .2;
			SV_r.cdBase *= .5;
			SV_r.basePwr = 0;
			SV_r.acc = 999;
			SV_r.hitCount = 1;
			SV_r.hitGap *= 1;
			SV_r.spark_start = spr_spark_dot;
			SV_r.effect_start = obj_handler_actEffect_shd;
			ds_list_clear(SV_r.special);
			ds_list_add(SV_r.special,.4 + (.1 * SV_rare)); //def
			ds_list_add(SV_r.special,-1); //duration
			
			break;
			
	#endregion
	
	#region //enemy act
	
		#region //tackle
			case EACT_TACKLE:
				SV_r.baseName = "Tackle";
				SV_r.desc = "Brute force attack. Not particularly reliable in any way.";
				SV_r.enBase *= 0;
				SV_r.cdBase *= 1;
				SV_r.basePwr *= .8;
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
				SV_r.baseName = "Shock Tackle";
				SV_r.desc = "Brute force attack. Unreliable, but has a moderate chance to paralyze.";
				SV_r.enBase *= 0;
				SV_r.cdBase *= 2;
				SV_r.basePwr *= .8;
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
		
		#region //frostackle
			case EACT_FROSTACKLE:
				SV_r.baseName = "Freeze Tackle";
				SV_r.desc = "Brute force attack. Unreliable, but has a moderate chance to slow.";
				SV_r.enBase *= 0;
				SV_r.cdBase *= 2;
				SV_r.basePwr *= .8;
				SV_r.acc *= .75;
				SV_r.hitCount = 1;
				SV_r.hitGap *= 1;
				SV_r.atkScale = CHAR_VAR_MATK;
				SV_r.defScale = CHAR_VAR_MDEF;
				SV_r.spark_hit = spr_spark_bash;
				SV_r.ele = CHAR_VAR_ELE_ICE;
				SV_r.sa_inflict[| CHAR_SA_SLW] = 5;
				SV_r.sa_chance[| CHAR_SA_SLW] = .6;
				
				break;
		#endregion
		
		#region //barrier
			case EACT_BARRIER:
				SV_r.baseName = "Barrier";
				SV_r.desc = "Slightly increases the DEF of self.";
				SV_r.enBase *= 0;
				SV_r.cdBase *= 1;
				SV_r.basePwr *= 0;
				SV_r.acc = 999;
				SV_r.hitCount = 1;
				SV_r.hitGap *= 1;
				SV_r.atkScale = CHAR_VAR_MATK;
				SV_r.defScale = CHAR_VAR_MDEF;
				SV_r.spark_hit = spr_spark_dot;
				SV_r.tgtType = ACT_TGT_SELF;
				SV_r.tgtEnemy = false;
				SV_r.effect_start = obj_handler_actEffect_barrier;
				
				break;
		#endregion
		
		#region //agility
			case EACT_AGILITY:
				SV_r.baseName = "Agility";
				SV_r.desc = "Slightly increases the EVA of self.";
				SV_r.enBase *= 0;
				SV_r.cdBase *= 1;
				SV_r.basePwr *= 0;
				SV_r.acc = 999;
				SV_r.hitCount = 1;
				SV_r.hitGap *= 1;
				SV_r.atkScale = CHAR_VAR_MATK;
				SV_r.defScale = CHAR_VAR_MDEF;
				SV_r.spark_hit = spr_spark_dot;
				SV_r.tgtType = ACT_TGT_SELF;
				SV_r.tgtEnemy = false;
				SV_r.effect_start = obj_handler_actEffect_agility;
				
				break;
		#endregion
		
		#region //acidSpray
			case EACT_ACIDSPRAY:
				SV_r.baseName = "Acid Spray";
				SV_r.desc = "Shoot a volatile mix at random, low chance to poison.";
				SV_r.enBase *= 0;
				SV_r.cdBase *= 3;
				SV_r.basePwr *= .2;
				SV_r.acc *= .60;
				SV_r.hitCount = 5;
				SV_r.hitGap *= .8;
				SV_r.atkScale = CHAR_VAR_SATK;
				SV_r.defScale = CHAR_VAR_SDEF;
				SV_r.spark_hit = spr_spark_pierce;
				SV_r.ele = CHAR_VAR_ELE_DRK;
				SV_r.sa_inflict[| CHAR_SA_PSN] = 4;
				SV_r.sa_chance[| CHAR_SA_PSN] = .2;
				SV_r.tgtType = ACT_TGT_RANDOM;
				
				break;
		#endregion
		
		#region //airburst
			case EACT_AIRBURST:
				SV_r.baseName = "Airburst";
				SV_r.desc = "Shoot intense gusts of wind at random, low chance to silence.";
				SV_r.enBase *= 0;
				SV_r.cdBase *= 3;
				SV_r.basePwr *= .2;
				SV_r.acc *= .60;
				SV_r.hitCount = 5;
				SV_r.hitGap *= .8;
				SV_r.atkScale = CHAR_VAR_SATK;
				SV_r.defScale = CHAR_VAR_SDEF;
				SV_r.spark_hit = spr_spark_slash;
				SV_r.ele = CHAR_VAR_ELE_NAT;
				SV_r.sa_inflict[| CHAR_SA_SLC] = 4;
				SV_r.sa_chance[| CHAR_SA_SLC] = .2;
				SV_r.tgtType = ACT_TGT_RANDOM;
				
				break;
		#endregion
		
		#region //slimeSummon
			case EACT_SLIMESUMMON:
				SV_r.baseName = "Slime Summon";
				SV_r.desc = "Summon 2 slime allies.";
				SV_r.enBase *= 0;
				SV_r.cdBase *= 0.5;
				SV_r.basePwr *= 0;
				SV_r.acc = 999;
				SV_r.hitCount = 1;
				SV_r.hitGap *= 1;
				SV_r.atkScale = CHAR_VAR_MATK;
				SV_r.defScale = CHAR_VAR_MDEF;
				SV_r.spark_hit = spr_spark_dot;
				SV_r.tgtType = ACT_TGT_SELF;
				SV_r.tgtEnemy = false;
				SV_r.effect_start = obj_handler_actEffect_slimeSummon;
				
				break;
		#endregion
		
		#region //quake
			case EACT_QUAKE:
				SV_r.baseName = "Quake";
				SV_r.desc = "A powerful, brute force wide range attack.";
				SV_r.enBase *= 0;
				SV_r.cdBase *= 5;
				SV_r.basePwr *= 1;
				SV_r.acc *= .9;
				SV_r.hitCount = 1;
				SV_r.hitGap *= 1;
				SV_r.atkScale = CHAR_VAR_MATK;
				SV_r.defScale = CHAR_VAR_MDEF;
				SV_r.spark_hit = spr_spark_bash;
				SV_r.tgtType = ACT_TGT_WIDE;
				
				break;
		#endregion
			
		#region //bite
			case EACT_BITE:
				SV_r.baseName = "Bite";
				SV_r.desc = "Nimble piercing attack. Weak, but hits twice.";
				SV_r.enBase *= 0;
				SV_r.cdBase *= 1;
				SV_r.basePwr *= .5;
				SV_r.acc *= .8;
				SV_r.hitCount = 2;
				SV_r.hitGap *= 1.4;
				SV_r.atkScale = CHAR_VAR_MATK;
				SV_r.defScale = CHAR_VAR_MDEF;
				SV_r.spark_hit = spr_spark_pierce;
				
				break;
		#endregion
		
		#region //razor claw
			case EACT_RAZORCLAW:
				SV_r.baseName = "Razor Claw";
				SV_r.desc = "Swift Melee attack. Powerful, and has a wide range.";
				SV_r.enBase *= 0;
				SV_r.cdBase *= 2;
				SV_r.basePwr *= 2;
				SV_r.acc *= .85;
				SV_r.hitCount = 1;
				SV_r.hitGap *= 1;
				SV_r.atkScale = CHAR_VAR_MATK;
				SV_r.defScale = CHAR_VAR_MDEF;
				SV_r.spark_hit = spr_spark_slash;
				SV_r.tgtType = ACT_TGT_WIDE;
				
				break;
		#endregion
		
		#region //petal snipe
			case EACT_PETALSNIPE:
				SV_r.baseName = "Petal Snipe";
				SV_r.desc = "Launches razor sharp leaves with pinpoint accuracy.";
				SV_r.enBase *= 0;
				SV_r.cdBase *= 1;
				SV_r.basePwr *= .3;
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
				SV_r.baseName = "Toxic Petal";
				SV_r.desc = "Launches a caustic leaf, has a low chance of inflicting poison.";
				SV_r.enBase *= 0;
				SV_r.cdBase *= 2.5;
				SV_r.basePwr *= .5;
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
		
		#region //wave cannon
			case EACT_WAVECANNON:
				SV_r.baseName = "Wave Cannon";
				SV_r.desc = "A powerful mystic surge of light that leaves the user vulnerable.";
				SV_r.enBase *= 0;
				SV_r.cdBase *= 2;
				SV_r.basePwr *= 2;
				SV_r.acc *= .8;
				SV_r.hitCount = 1;
				SV_r.hitGap *= 1;
				SV_r.atkScale = CHAR_VAR_SATK;
				SV_r.defScale = CHAR_VAR_SDEF;
				SV_r.spark_hit = spr_spark_bash;
				SV_r.ele = CHAR_VAR_ELE_LGT;
				
				break;
		#endregion
		
		#region //detonate
			case EACT_DETONATE:
				SV_r.baseName = "Detonate";
				SV_r.desc = "A kamikaze attack that deals moderate Spell damage to all enemies.";
				SV_r.enBase *= 0;
				SV_r.cdBase *= 1;
				SV_r.basePwr *= 3;
				SV_r.acc *= 99;
				SV_r.hitCount = 1;
				SV_r.hitGap *= 1;
				SV_r.atkScale = CHAR_VAR_SATK;
				SV_r.defScale = CHAR_VAR_SDEF;
				SV_r.spark_hit = spr_spark_bash;
				SV_r.spark_end = spr_spark_smoke;
				SV_r.ele = CHAR_VAR_ELE_FIR;
				SV_r.tgtType = ACT_TGT_WIDE;
				
				break;
		#endregion
		
		#region //sVulcan
			case EACT_SVULCAN:
				SV_r.baseName = "S. Vulcan";
				SV_r.desc = "A quick volley of weak but accurate bullets.";
				SV_r.enBase *= 0;
				SV_r.cdBase *= 1;
				SV_r.basePwr *= .3;
				SV_r.acc *= .7;
				SV_r.hitCount = 4;
				SV_r.hitGap *= .7;
				SV_r.atkScale = CHAR_VAR_FATK;
				SV_r.defScale = CHAR_VAR_FDEF;
				SV_r.spark_hit = spr_spark_shoot;
				
				break;
		#endregion
		
		#region //fireball
			case EACT_FIREBALL:
				SV_r.baseName = "Fireball";
				SV_r.desc = "A powerful blast of fire, moderate chance to burn.";
				SV_r.enBase *= 0;
				SV_r.cdBase *= 1;
				SV_r.basePwr *= 1.5;
				SV_r.acc *= .8;
				SV_r.hitCount = 1;
				SV_r.hitGap *= 1;
				SV_r.atkScale = CHAR_VAR_SATK;
				SV_r.defScale = CHAR_VAR_SDEF;
				SV_r.spark_hit = spr_spark_bash;
				SV_r.ele = CHAR_VAR_ELE_FIR;
				SV_r.sa_inflict[| CHAR_SA_BRN] = 6;
				SV_r.sa_chance[| CHAR_SA_BRN] = .5;
				
				break;
		#endregion
		
		#region //flameSweep
			case EACT_FLAMESWEEP:
				SV_r.baseName = "Flame Sweep";
				SV_r.desc = "A wide range stream of fire, low chance to burn.";
				SV_r.enBase *= 0;
				SV_r.cdBase *= 2;
				SV_r.basePwr *= .3;
				SV_r.acc *= .75;
				SV_r.hitCount = 3;
				SV_r.hitGap *= .8;
				SV_r.atkScale = CHAR_VAR_SATK;
				SV_r.defScale = CHAR_VAR_SDEF;
				SV_r.spark_hit = spr_spark_bash;
				SV_r.ele = CHAR_VAR_ELE_FIR;
				SV_r.sa_inflict[| CHAR_SA_BRN] = 6;
				SV_r.sa_chance[| CHAR_SA_BRN] = .1;
				SV_r.tgtType = ACT_TGT_WIDE;
				
				break;
		#endregion
		
		#region //analyze
			case EACT_ANALYZE:
				SV_r.baseName = "Analyze";
				SV_r.desc = "Stores movement patterns to reduce target's evasion.";
				SV_r.enBase *= 0;
				SV_r.cdBase *= 1;
				SV_r.basePwr *= 0;
				SV_r.acc *= 1;
				SV_r.hitCount = 1;
				SV_r.hitGap *= 1;
				SV_r.atkScale = CHAR_VAR_FATK;
				SV_r.defScale = CHAR_VAR_FDEF;
				SV_r.spark_hit = spr_spark_dotDn;
				SV_r.effect_start = obj_handler_actEffect_analyze;
				
				break;
		#endregion
		
		#region //lifeStim
			case EACT_LIFESTIM:
				SV_r.baseName = "Lifestim";
				SV_r.desc = "Slightly restores the HP of all party members.";
				SV_r.enBase *= 0;
				SV_r.cdBase *= 3;
				SV_r.basePwr *= 2;
				SV_r.acc = 999;
				SV_r.hitCount = 1;
				SV_r.hitGap *= 1;
				SV_r.atkScale = CHAR_VAR_SATK;
				SV_r.defScale = CHAR_VAR_SDEF;
				SV_r.spark_hit = spr_spark_dot;
				SV_r.tgtType = ACT_TGT_WIDE;
				SV_r.tgtEnemy = false;
				
				break;
		#endregion
		
		#region //atkStim
			case EACT_BLASTSTIM:
				SV_r.baseName = "Blaststim";
				SV_r.desc = "Slightly increases the ATK of all party members.";
				SV_r.enBase *= 0;
				SV_r.cdBase *= 3;
				SV_r.basePwr *= 0;
				SV_r.acc = 999;
				SV_r.hitCount = 1;
				SV_r.hitGap *= 1;
				SV_r.atkScale = CHAR_VAR_MATK;
				SV_r.defScale = CHAR_VAR_MDEF;
				SV_r.spark_hit = spr_spark_dot;
				SV_r.tgtType = ACT_TGT_WIDE;
				SV_r.tgtEnemy = false;
				SV_r.effect_start = obj_handler_actEffect_stim;
				ds_list_clear(SV_r.special);
				ds_list_add(SV_r.special,true);
				
				break;
		#endregion
		
		#region //defStim
			case EACT_GUARDSTIM:
				SV_r.baseName = "Guardstim";
				SV_r.desc = "Slightly increases the DEF of all party members.";
				SV_r.enBase *= 0;
				SV_r.cdBase *= 3;
				SV_r.basePwr *= 0;
				SV_r.acc = 999;
				SV_r.hitCount = 1;
				SV_r.hitGap *= 1;
				SV_r.atkScale = CHAR_VAR_MATK;
				SV_r.defScale = CHAR_VAR_MDEF;
				SV_r.spark_hit = spr_spark_dot;
				SV_r.tgtType = ACT_TGT_WIDE;
				SV_r.tgtEnemy = false;
				SV_r.effect_start = obj_handler_actEffect_stim;
				ds_list_clear(SV_r.special);
				ds_list_add(SV_r.special,false);
				
				break;
		#endregion
			
	#endregion
	
}

SV_r.ele = SV_ele;

scr_cEvent_id(SV_r,EVENT_ACT_REFRESHINFO);

return SV_r;