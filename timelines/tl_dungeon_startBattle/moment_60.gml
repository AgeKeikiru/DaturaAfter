with obj_handler_dungeon{
    timeline_speed = 1;
    
    scr_cEvent(obj_fpo_battleBanner,EVENT_FPO_FADEKILL);
    
    popcornTimer = .5 * room_speed;
    
    var
    _i = !state_fixedBattle ? irandom_range(1,ds_grid_width(grd_mobPool) + -1) : 0;
    
    state_fixedBattle = false;
    
    for(var _i2 = 0;_i2 < 3;_i2++){
    	if(grd_mobPool[# _i,DH_MOB_ID1 + _i2] != noone){
    		var _o = scr_spawnEnemy(grd_mobPool[# _i,DH_MOB_ID1 + _i2],_i2,grd_mobPool[# _i,DH_MOB_LV1 + _i2]);
    		_o.image_alpha = -abs(ceil((_i2 + -1) * 1.5)) * 1;
    		_o.enemyWait = UNIVERSAL_COOLDOWN + abs(ceil((_i2 + -1) * 1.5)) * 3000;
    		_o.enemyWaitMax = _o.enemyWait;
    	}
    }
    
    repeat(irandom_range(grd_mobPool[# _i,DH_MOB_PMIN],grd_mobPool[# _i,DH_MOB_PMAX])){
    	ds_list_shuffle(lst_popcornPool);
    	ds_list_add(lst_popcorn,lst_popcornPool[| 0]);
    }
    
    global.playerControl = true;
}