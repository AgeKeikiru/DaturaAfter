for(var _i = 0;_i < 3;_i++){
	var
	_o = global.grd_party_player[# _i,0],
	_x = 640 + (380 * (_i + -1)),
	_y = 650;
	
	if(scr_exists(_o,asset_object)){
		_o.x = _x;
		_o.y = _y;
		_o.allyParty = global.grd_party_player;
		_o.enemyParty = global.grd_party_enemy;
	}
	
	_o = global.grd_party_player[# _i,1];
	
	if(scr_exists(_o,asset_object)){
		_o.x = _x;
		_o.y = _y;
		_o.allyParty = global.grd_party_player;
		_o.enemyParty = global.grd_party_enemy;
	}
}