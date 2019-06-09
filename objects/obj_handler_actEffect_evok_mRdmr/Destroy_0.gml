/// @description Insert description here
event_inherited();

if(scr_exists(src,asset_object) && src.hpCurr <= 0){
	scr_cEvent(obj_handler_class_evoker,EVENT_EVOK_RBRANDCHECK,src);
}