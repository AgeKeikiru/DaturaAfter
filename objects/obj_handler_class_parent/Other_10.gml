/// @description custom events

switch(cEvent){
	case EVENT_CLASS_SKILLREFRESH:
	    event_inherited();
	
		for(var _ix = 0;_ix < ds_grid_width(grd_skills);_ix++){
		    for(var _iy = 0;_iy < ds_grid_height(grd_skills);_iy++){
    		    var _obj = grd_skillAct[# _ix,_iy];
    		    
    		    if(scr_exists(_obj,asset_object)){
    		        _obj.name = grd_skillName[# _ix,_iy];
    		        _obj.desc = grd_skillDesc[# _ix,_iy];
    		        _obj.rare = grd_skills[# _ix,_iy];
    		    }
    		}
		}
		
		break;
		
	default:
	    event_inherited();
	    break;
}