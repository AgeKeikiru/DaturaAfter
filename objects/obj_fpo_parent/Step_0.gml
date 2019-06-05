/// @description Insert description here
// You can write your code in this editor

if(tween_xPos){
	x = ktk_scr_tween(x,tgt_xPos,tweenSpd,tweenMax);
}
if(tween_yPos){
	y = ktk_scr_tween(y,tgt_yPos,tweenSpd,tweenMax);
}

if(tween_hSpd){
	hspeed = ktk_scr_tween(hspeed,tgt_hSpd,tweenSpd,tweenMax);
}

if(tween_vSpd){
	vspeed = ktk_scr_tween(vspeed,tgt_vSpd,tweenSpd,tweenMax);
}

if(tween_xScale){
	image_xscale = ktk_scr_tween(image_xscale,tgt_xScale,tweenSpd,tweenMax);
}

if(tween_yScale){
	image_yscale = ktk_scr_tween(image_yscale,tgt_yScale,tweenSpd,tweenMax);
}

if(tween_rot){
	image_angle = ktk_scr_tween(image_angle,tgt_rot,tweenSpd,tweenMax);
}

if(tween_alpha){
	image_alpha = ktk_scr_tween(image_alpha,tgt_alpha,tweenSpd,tweenMax);
}