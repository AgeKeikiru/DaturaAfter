/// @description Insert description here

if(ds_list_size(special) > 0){
	duration = special[| ZODC_EMP_DURATION] * room_speed;
	
	map_statMod[? en_charVar.mAtk] = special[| ZODC_EMP_ATK];
	map_statMod[? en_charVar.fAtk] = special[| ZODC_EMP_ATK];
	map_statMod[? en_charVar.sAtk] = special[| ZODC_EMP_ATK];
	
	map_statMod[? en_charVar.mDef] = special[| ZODC_EMP_DEF];
	map_statMod[? en_charVar.fDef] = special[| ZODC_EMP_DEF];
	map_statMod[? en_charVar.sDef] = special[| ZODC_EMP_DEF];
}

event_inherited();