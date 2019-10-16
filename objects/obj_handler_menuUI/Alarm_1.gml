rndTxt_tgt += " \n\n ";

if(rndTxt_draw > 1000){
	rndTxt_draw = 0;
	rndTxt_tgt = "";
}

repeat(irandom_range(10,100)){
	rndTxt_tgt += chr(irandom_range(ord("a"),ord("z")));
	
	if(random(1) < 0.2){
		rndTxt_tgt += " ";
	}
}

alarm[1] = room_speed * 5;