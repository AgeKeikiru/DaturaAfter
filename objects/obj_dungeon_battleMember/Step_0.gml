/// @description Insert description here
// You can write your code in this editor
if(true){
	for(var _i = 0;_i < 6;_i++){
		if(ailment[_i] > 0){
			ailment[_i] += -1;
			ailment[_i] = max(ailment[_i],0);
		}
	}
}

if(instance_exists(actUsing) && actUsing.cdCurr <= 0 && enCurr >= actUsing.enCost){
	enCurr += -actUsing.enCost;
	
	globalvar G_tmp;
	with obj_handler_dungeon{
		G_tmp = tgtSlot;
	}
	
	tgtIndex = G_tmp;
	
	scr_cEvent(actUsing,EVENT_ACT_USE);
	
	for(var _i = 0;_i < 8;_i++){
		var _act = act[_i];
		
		if(instance_exists(_act)){
			_act.cdCurr += UNIVERSAL_COOLDOWN;
			_act.cdMax = _act.cdCurr;
		}
	}
	
	actUsing.cdCurr += actUsing.cdAdd;
	actUsing.cdMax = actUsing.cdCurr;
	
	actUsing = noone;
}

if(hpCurr > 0){
	enCurr += .1 / (1 + ((ailment[CHAR_SA_SLW] > 0) * 3));
	enCurr = min(enCurr,enMax);
	
	if(ailment[CHAR_SA_PSN] > 0){
		hpCurr += -hpMax * .0005;
	}
	
	if(enemyWait > 0){
		enemyWait += -(100 + spd) / (1 + (ailment[CHAR_SA_SLW] > 0));
	
		if(enemyWait <= 0){
			var _act = act[0];
		
			enemyWait = UNIVERSAL_COOLDOWN;
		
			if(instance_exists(_act)){
				enemyWait += _act.cdAdd;
			
				scr_cEvent(_act,EVENT_ACT_USE);
			}
		
			enemyWaitMax = enemyWait;
		}
	}
}else if(allyParty == global.grd_party_enemy && instance_number(obj_fpo_actBanner) == 0){
	globalvar G_tmp;
	G_tmp = true;
	
	with obj_handler_act{
		if(using){
			G_tmp = false;
		}
	}
	
	if(G_tmp){
		instance_destroy();
	}
}

if(hurtShake > 0){
	direction += 180 + random_range(-60,60);
}

hurtShake = ktk_scr_tween(hurtShake,0,4,.1);