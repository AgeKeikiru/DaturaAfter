
event_inherited();

if(decayDelay > 0){
	decayDelay--;
}else{
	charge = max(charge + -(.01 / room_speed),0);
}