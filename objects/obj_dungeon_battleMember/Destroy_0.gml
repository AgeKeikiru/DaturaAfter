/// @description Insert description here
// You can write your code in this editor

if(allyParty == global.grd_party_enemy){
	for(var _i = 0;_i < 8;_i++){
		instance_destroy(act[_i]);
	}
}