/// @description Insert description here
// You can write your code in this editor

switch(cEvent){
	case EVENT_EFFECT_STANCEDRAW:
	    event_inherited();
	    
	    var
	    _x1 = cArgs[| 0] + 3,
	    _y1 = cArgs[| 1] + 3,
	    _c = cArgs[| 2],
	    _x2 = _x1 + 95,
	    _y2 = _y1 + 18,
	    _xFill = _x2 + -(abs(_x1 + -_x2) * (buffCount / 20));
	    
	    draw_set_color(c_dkgray);
	    
	    draw_rectangle(_x1,_y1,_x2,_y2,false);
	    
	    draw_set_color(CC_STANCE_EVOK);
	    draw_set_alpha(1);
	    
	    if(buffCount == 20){
	        draw_set_alpha((abs(sin(current_time / 400)) * .3) + .7);
	    }
	    
	    draw_rectangle(_xFill,_y1,_x2,_y2,false);
	    
	    draw_set_color(_c);
	    draw_set_alpha(1);
	    
	    draw_rectangle(_x2,_y1,_x2 + -56,_y2 + -4,false);
	    draw_triangle(_x2 + -56,_y1 + -1,_x2 + -56,_y2 + -4,_x2 + -66,_y1 + -1,false);
	    
	    draw_set_color(c_dkgray);
	    draw_set_halign(fa_right);
	    draw_set_valign(fa_top);
	    draw_set_font(ft_dungeonBold);
	    
	    draw_text_transformed(_x2,_y1 + 1,"DSTR",1,1,0);
	
	    break;
	    
	case EVENT_BATTLE_ENEMYKILLED:
		event_inherited();
	
	    var
	    _src = cArgs[| 0],
	    _tgt = cArgs[| 1];
	    
	    if(ds_list_size(special) > 0 && scr_exists(src,asset_object) && _src == src && random(1) < special[| 0] && buffCount < 20){
	        buffCount++;
	        
	        var
            _stat = ds_list_create(),
            _txt = ds_list_create(),
            _boost = ds_list_create();
            
            ds_list_add(_stat,
                CHAR_VAR_MATK,
                CHAR_VAR_MDEF,
                CHAR_VAR_FATK,
                CHAR_VAR_FDEF,
                CHAR_VAR_SATK,
                CHAR_VAR_SDEF,
                CHAR_VAR_ACC,
                CHAR_VAR_EVA,
                CHAR_VAR_SPD
            );
            
            ds_list_add(_txt,
                "MATK++",
                "MDEF++",
                "FATK++",
                "FDEF++",
                "SATK++",
                "SDEF++",
                "ACC++",
                "EVA++",
                "SPD++"
            );
            
            ds_list_add(_boost,
                .05,
                .05,
                .05,
                .05,
                .05,
                .05,
                .02,
                .02,
                .05
            );
            
            var
            _i = irandom(ds_list_size(_stat) + -1);
            
            map_statMod[? _stat[| _i]] += _boost[| _i];
            scr_createEffectTxt(src,_txt[| _i]);
            scr_cEvent_id(src,EVENT_BATTLM_ICONREFRESH);
	    }
	    
	    break;
	    
	case EVENT_BATTLE_HEALED:
		event_inherited();
	
	    var
	    _src = cArgs[| 0],
	    _tgt = cArgs[| 1],
	    _act = cArgs[| 2];
	    
	    if(scr_exists(src,asset_object) && _tgt == src){
	        buffCount = 0;
	        
	        map_statMod[? CHAR_VAR_MATK] = 0;
            map_statMod[? CHAR_VAR_MDEF] = 0;
            map_statMod[? CHAR_VAR_FATK] = 0;
            map_statMod[? CHAR_VAR_FDEF] = 0;
            map_statMod[? CHAR_VAR_SATK] = 0;
            map_statMod[? CHAR_VAR_SDEF] = 0;
            map_statMod[? CHAR_VAR_ACC] = 0;
            map_statMod[? CHAR_VAR_EVA] = 0;
            map_statMod[? CHAR_VAR_SPD] = 0;
            
            scr_cEvent_id(src,EVENT_BATTLM_ICONREFRESH);
	    }
	    
	    break;
	    
	default:
	    event_inherited();
}