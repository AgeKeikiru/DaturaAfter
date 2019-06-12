/// @description Insert description here

event_inherited();

if(scr_exists(src,asset_object) && ds_list_size(special) > 0){
	if(src.allyParty == global.grd_party_enemy){
		src.enemyWait = src.enemyWaitMax;
	}
	
	duration = special[| 0];
}