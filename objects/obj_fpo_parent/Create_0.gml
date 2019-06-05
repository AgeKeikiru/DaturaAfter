/// @description Fake Particle Object
// You can write your code in this editor

tgt_xPos = x;
tgt_yPos = y;

global.temp = id;

layer = global.ly_obj[2];

with obj_fpo_parent{
	if(id != global.temp){
		depth += 3;
	}
}