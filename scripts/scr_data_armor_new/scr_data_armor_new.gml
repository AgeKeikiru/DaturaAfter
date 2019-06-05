///@arg wtagType
///@arg *rarity
///@arg *plus

//general
var
SV_type = argument[0],
SV_rare = argument_count > 1 ? argument[1] : 0,
SV_plus = argument_count > 2 ? argument[2] : 0,
SV_r = instance_create_depth(0,0,0,obj_handler_armor);

SV_r.name = "???";
SV_r.desc = "A strange object hailing from beyond the void.";
SV_r.price = 1000;
SV_r.rare = SV_rare;
SV_r.plus = SV_plus;
SV_r.type = SV_type;

repeat(4){
    if(choose(true,false)){
        var SV_ele = choose("ele_fir","ele_ice","ele_lgt","ele_drk","ele_elc","ele_nat");
        
        variable_instance_set(SV_r,SV_ele,variable_instance_get(SV_r,SV_ele) + 1);
    }
}

switch(SV_type){
	
	case CHAR_VAR_HP:
		SV_r.name = "Stim";
		SV_r.pwr = 200 * (SV_rare + 1);
		SV_r.desc = "Stimulant patch that boosts the wearer's vitality. HP +" + string(SV_r.pwr);
		SV_r.price *= 1.5;
		
		break;
		
	case CHAR_VAR_EN:
		SV_r.name = "Bangle";
		SV_r.pwr = 200 * (SV_rare + 1);
		SV_r.desc = "Magical wristlet that enhances the wearer's concentration. EN +" + string(SV_r.pwr);
		SV_r.price *= 1.5;
		
		break;
		
	case CHAR_VAR_MATK:
		SV_r.name = "Bracers";
		SV_r.pwr = 10 * (SV_rare + 1);
		SV_r.desc = "Enchanted armbands that enhance the wearer's strength. M-ATK +" + string(SV_r.pwr);
		SV_r.price *= 1.2;
		
		break;
		
	case CHAR_VAR_MDEF:
		SV_r.name = "Plate";
		SV_r.pwr = 10 * (SV_rare + 1);
		SV_r.desc = "Heavy armor protects the wearer from melee strikes. M-DEF +" + string(SV_r.pwr);
		SV_r.price *= 1;
		
		break;
		
	case CHAR_VAR_FATK:
		SV_r.name = "Scanner";
		SV_r.pwr = 10 * (SV_rare + 1);
		SV_r.desc = "Milimeter scanner reveals optimal shooting weakspots. F-ATK +" + string(SV_r.pwr);
		SV_r.price *= 1.2;
		
		break;
		
	case CHAR_VAR_FDEF:
		SV_r.name = "Reflector";
		SV_r.pwr = 10 * (SV_rare + 1);
		SV_r.desc = "Anti-ballistic field protects the wearer from firearm attacks. F-DEF +" + string(SV_r.pwr);
		SV_r.price *= 1;
		
		break;
		
	case CHAR_VAR_SATK:
		SV_r.name = "Talisman";
		SV_r.pwr = 10 * (SV_rare + 1);
		SV_r.desc = "Mystic charm that channels the wearer's mental strength. S-ATK +" + string(SV_r.pwr);
		SV_r.price *= 1.2;
		
		break;
		
	case CHAR_VAR_SDEF:
		SV_r.name = "Absorber";
		SV_r.pwr = 10 * (SV_rare + 1);
		SV_r.desc = "Strange charm protects the wearer from hostile spells. S-DEF +" + string(SV_r.pwr);
		SV_r.price *= 1;
		
		break;
		
	case CHAR_VAR_ACC:
		SV_r.name = "Goggles";
		SV_r.pwr = 2 * (SV_rare + 1);
		SV_r.desc = "High definition goggles that sharpen the wearer's vision. ACC +" + string(SV_r.pwr);
		SV_r.price *= 2;
		
		break;
		
	case CHAR_VAR_EVA:
		SV_r.name = "Camouflage";
		SV_r.pwr = 2 * (SV_rare + 1);
		SV_r.desc = "High tech cloaking device obscures the wearer's position. EVA +" + string(SV_r.pwr);
		SV_r.price *= 2;
		
		break;
		
	case CHAR_VAR_SPD:
		SV_r.name = "Booster";
		SV_r.pwr = 5 * (SV_rare + 1);
		SV_r.desc = "Mounted booster system allows for high speed movement. SPD +" + string(SV_r.pwr);
		SV_r.price *= 2;
		
		break;
		
	case CHAR_VAR_MISC:
		SV_r.name = "Lucky Gem";
		SV_r.pwr = 5 * (SV_rare + 1);
		SV_r.desc = "A bizarre keepsake, it's unsure what benefit is actually has for holding. MISC +" + string(SV_r.pwr);
		SV_r.price *= 2;
		
		break;
}

if(SV_plus > 0){
	SV_r.name += " +" + string(SV_plus);
}

SV_r.price = round(SV_r.price);

return SV_r;