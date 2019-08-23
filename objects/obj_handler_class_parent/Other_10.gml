/// @description custom events

switch(cEvent){
	#region //class_SkillRefresh
		case EVENT_CLASS_SKILLREFRESH:
		    event_inherited();
		
			for(var _ix = 0;_ix < ds_grid_width(grd_skills);_ix++){
			    for(var _iy = 0;_iy < ds_grid_height(grd_skills);_iy++){
	    		    var _obj = grd_skillAct[# _ix,_iy];
	    		    
	    		    if(scr_exists(_obj,asset_object)){
	    		        _obj.baseName = grd_skillName[# _ix,_iy];
	    		        _obj.desc = grd_skillDesc[# _ix,_iy];
	    		        _obj.rare = grd_skills[# _ix,_iy];
	    		        _obj.icon = grd_skillIcon[# _ix,_iy];
	    		        
	    		        scr_cEvent(_obj,EVENT_ACT_REFRESHINFO);
	    		        
	    		        _obj.name = _obj.baseName;
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
			_act = noone,
			_first = true,
			_substr = "",
			_num = [0,0];
			
			if(_x >= 0){
				_str = grd_skillName[# _x,_y] + " Lv." + string(grd_skills[# _x,_y] + 1) + "\n\n" + grd_skillTooltip[# _x,_y];
				_act = grd_skillAct[# _x,_y];
				_first = !grd_skills[# _x,_y];
			}else{
				_str = ss_name + " Lv." + string(ss_level + 1) + "\n\n" + ss_toolTip;
				_first = !ss_level;
			}
			
			if(global.tempStr == ""){
				if(_x >= 0){
					_num[0] = (grd_skills[# _x,_y]) * grd_skillRate[# _x,_y];
					_num[1] = (grd_skills[# _x,_y] + 1) * grd_skillRate[# _x,_y];
				}else{
					_num[0] = (ss_level) * ss_rate;
					_num[1] = (ss_level + 1) * ss_rate;
				}
				
				_substr = scr_class_generateSkillTTStat(_num[0],_num[1],string_pos("%",_str),_first);
				global.tempStr = string_replace_all(_str,"!",_substr);
			}
			
			if(scr_exists(_act,asset_object)){
				_num[0] = round(_act.enBase * (1 + (_act.rare * _act.enRate)));
				_num[1] = round(_act.enBase * (1 + ((_act.rare + 1) * _act.enRate)));
				global.tempStr += "\n EN Cost: " + scr_class_generateSkillTTStat(_num[0],_num[1],false,_first,8);
				
				_num[0] = round(_act.cdBase * (1 + (_act.rare * _act.cdRate)));
				_num[1] = round(_act.cdBase * (1 + ((_act.rare + 1) * _act.cdRate)));
				global.tempStr += "\nCooldown: " + scr_class_generateSkillTTStat(_num[0],_num[1],false,_first,8);
			}
		
			break;
	#endregion
		
	default:
	    event_inherited();
	    break;
}