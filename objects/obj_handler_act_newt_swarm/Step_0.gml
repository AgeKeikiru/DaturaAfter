
event_inherited();

if(cdCurr > 0 && scr_exists(src) && scr_exists(src.stance) && object_is_ancestor(src.stance.object_index,obj_handler_actEffect_newt_orb_parent)){
	cdCurr = max(cdCurr + -scr_timeMod(1),0);
}