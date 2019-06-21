/// @description Insert description here
// You can write your code in this editor
event_inherited();

if(scr_exists(src,asset_object)){
	if(src.hpCurr / src.hpMax <= .2){
	    usable = false;
	}
}