/// @description Insert description here
// You can write your code in this editor

if(allyParty == global.grd_party_enemy){
	for(var _i = 0;_i < 8;_i++){
		instance_destroy(act[_i]);
	}
	
	if(hpCurr <= 0 && !noLoot){
		if(random(1) < .3){
			scr_getLoot(LOOT_RACE);
		}
		
		if(random(1) < .2){
			scr_getLoot(LOOT_ELE);
		}
		
		if(random(1) < .02){
			scr_getLoot(LOOT_WPN);
		}
		
		if(random(1) < .02){
			scr_getLoot(LOOT_ARM);
		}
		
		if(random(1) < .5){
			scr_getLoot(LOOT_G);
		}
		
		with obj_handler_dungeon{
			popcornTimer = .5 * room_speed;
		}
	}
}