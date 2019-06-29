/// @description custom events

switch(cEvent){
	#region //class_SkillRefresh
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
			
			level = ds_grid_get_sum(grd_skills,0,0,ds_grid_width(grd_skills) + -1,ds_grid_height(grd_skills) + -1) + ss_level;
			
			break;
	#endregion
	
	#region //class_fetchToolTip
		case EVENT_CLASS_FETCHTOOLTIP:
			var
			_x = cArgs[| 0],
			_y = cArgs[| 1],
			_str = "",
			_act = noone;
			
			if(_x >= 0){
				_str = grd_skillName[# _x,_y] + " Lv." + string(grd_skills[# _x,_y] + 1) + "\n\n" + grd_skillTooltip[# _x,_y];
				_act = grd_skillAct[# _x,_y];
			}else{
				_str = ss_name + " Lv." + string(ss_level + 1) + "\n\n" + ss_toolTip;
			}
			
			if(global.tempStr == ""){
				var
				_substr = "",
				_num = 0;
				
				if(_x >= 0){
					_num = (grd_skills[# _x,_y] + 1) * grd_skillRate[# _x,_y];
				}else{
					_num = (ss_level + 1) * ss_rate;
				}
				
				if(string_pos("%",_str) == 0){
					_substr = string_format(_num,1,2);
				}else{
					_substr = string_format(_num * 100,1,2);
				}
				
				global.tempStr = string_replace_all(_str,"!",_substr);
			}
			
			if(scr_exists(_act,asset_object)){
				global.tempStr += "\nEN Cost: " + string(_act.enCost)
				+ "\nCooldown: " + string(_act.cdAdd);
			}
		
			break;
	#endregion
		
	default:
	    event_inherited();
	    break;
}