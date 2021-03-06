///@arg grdIndex
///@arg charID
///@arg *partyMember

var SV_r = ds_map_create();

//general
SV_r[? CHAR_VAR_ID] = string(argument[1]);
SV_r[? CHAR_VAR_NAMEFULL] = "???";
SV_r[? CHAR_VAR_NAMEDISP] = "???";
SV_r[? CHAR_VAR_DESC] = "An unknown entity hailing from beyond the void.";
SV_r[? CHAR_VAR_DESCFULL] = "An unknown entity hailing from beyond the void.";
SV_r[? CHAR_VAR_RACE] = RACE_HUMAN;

//stats
SV_r[? CHAR_VAR_LEVEL] = 0;
SV_r[? CHAR_VAR_HP] = 1;
SV_r[? CHAR_VAR_EN] = 1;
SV_r[? CHAR_VAR_MATK] = 0;
SV_r[? CHAR_VAR_MDEF] = 0;
SV_r[? CHAR_VAR_FATK] = 0;
SV_r[? CHAR_VAR_FDEF] = 0;
SV_r[? CHAR_VAR_SATK] = 0;
SV_r[? CHAR_VAR_SDEF] = 0;
SV_r[? CHAR_VAR_ACC] = 0;
SV_r[? CHAR_VAR_EVA] = 0;
SV_r[? CHAR_VAR_SPD] = 0;
SV_r[? CHAR_VAR_MISC] = 0;
		
//resistances
SV_r[? CHAR_VAR_ELE_FIR] = 0;
SV_r[? CHAR_VAR_ELE_ICE] = 0;
SV_r[? CHAR_VAR_ELE_NAT] = 0;
SV_r[? CHAR_VAR_ELE_ELC] = 0;
SV_r[? CHAR_VAR_ELE_DRK] = 0;
SV_r[? CHAR_VAR_ELE_LGT] = 0;

//hotbar
SV_r[? CHAR_VAR_HB0] = noone;
SV_r[? CHAR_VAR_HB1] = noone;
SV_r[? CHAR_VAR_HB2] = noone;
SV_r[? CHAR_VAR_HB3] = noone;
SV_r[? CHAR_VAR_HB4] = noone;
SV_r[? CHAR_VAR_HB5] = noone;
SV_r[? CHAR_VAR_HB6] = noone;
SV_r[? CHAR_VAR_HB7] = noone;

//armors
SV_r[? CHAR_VAR_ARM0] = noone;
SV_r[? CHAR_VAR_ARM1] = noone;

//classes
SV_r[? CHAR_VAR_CLS0] = noone;
SV_r[? CHAR_VAR_CLS1] = noone;
SV_r[? CHAR_VAR_CLS2] = noone;
SV_r[? CHAR_VAR_UCLASS] = noone;

//act banner drawing offsets
SV_r[? CHAR_VAR_ABDO_X] = 0;
SV_r[? CHAR_VAR_ABDO_Y] = 0;

//party screen drawing offsets
SV_r[? CHAR_VAR_PSDO_ACT_X] = 0;
SV_r[? CHAR_VAR_PSDO_ACT_Y] = 0;
SV_r[? CHAR_VAR_PSDO_ARM_X] = 0;
SV_r[? CHAR_VAR_PSDO_ARM_Y] = 0;
SV_r[? CHAR_VAR_PSDO_CLS_X] = 0;
SV_r[? CHAR_VAR_PSDO_CLS_Y] = 0;

SV_r[? CHAR_VAR_GUEST] = false;

var _y = argument[0];
global.grd_chars[# 0,_y] = argument[1];
global.grd_chars[# 1,_y] = SV_r;

if(argument_count > 2 && argument[2]){
	var SV_o = instance_create_depth(0,0,0,obj_dungeon_battleMember);
	SV_o.src = SV_r;
	global.map_chars[? argument[1]] = SV_o;
}

return SV_r;