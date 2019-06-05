/// @description Custom events
// You can write your code in this editor

switch(cEvent){
	case EVENT_DND_ENCOUNTER:
	case EVENT_DND_ENCOUNTER_FIXED:
		battleChance = -.4;
		state_battle = true;
	
		var
		_i = cEvent == EVENT_DND_ENCOUNTER ? irandom_range(1,ds_grid_width(grd_mobPool) + -1) : 0,
		_gap = 380,
		_x = 640 + -_gap,
		_y = 380;
		
		for(var _i2 = 0;_i2 < 3;_i2++){
			if(grd_mobPool[# _i,_i2] != noone){
				var _o = instance_create_depth(_x,_y,0,obj_dungeon_battleMember);
				_o.src = scr_data_getMap(global.grd_chars,grd_mobPool[# _i,_i2]);
				_o.allyParty = global.grd_party_enemy;
				_o.enemyParty = global.grd_party_player;
				scr_cEvent(_o,EVENT_BATTLM_INIT);
				_o.enemyWait = UNIVERSAL_COOLDOWN + random_range(-5000,5000);
				_o.enemyWaitMax = _o.enemyWait;
				
				global.grd_party_enemy[# _i2,0] = _o;
			}
			
			_x += _gap;
		}
	
		break;
	case EVENT_DND_BATTLEWIN:
		state_battle = false;
		tgtSlot = -1;
		
		with obj_dungeon_battleMember{
			actUsing = noone;
		}
		
		break;
}