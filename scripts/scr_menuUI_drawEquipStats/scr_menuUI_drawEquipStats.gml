///@arg src

var
_menu = ds_stack_top(global.stk_menu),
SV_src = argument0,
_iww = 120,
_xFlip = _iww > 0,
_x1 = 0,
_y1 = 0,
_x2 = _x1,
_y2 = _y1,
_name = "-noone-",
_strArr = ["---"],
_strCmp = [0],
_str = "",
_label = "",
SV_alpha = 1;

if(scr_exists(_menu,asset_object)){
    _x2 = _menu.link_panel.x + _menu.link_panel.image_xscale;
    _y2 = _menu.link_panel.y + _menu.btn_h + _menu.btn_gapY;
    _x1 = _x2;
    _y1 = _y2 + (_menu.menu_y + -_menu.page_y) * (_menu.btn_h + _menu.btn_gapY);
    
    _x2 += 20;
    _y2 += -20;
}

if(scr_exists(ps_portEquip,asset_object)){
    _iww = 120 * -sign(ps_tgtPortX);
    _xFlip = _iww > 0;
    _x1 = ps_portEquip.x + -ps_tgtPortX;
    _y1 = ps_portEquip.y + -ps_tgtPortY;
    _x2 = _x1 + -(sign(ps_tgtPortX) * 50);
    _y2 = _y1 + -clamp(abs(ps_tgtPortY) * .8,40,80);
    SV_alpha = ps_portEquip.image_alpha;
}

if(scr_exists(_menu,asset_object) && scr_exists(SV_src,asset_object)){
    
    if(object_is_ancestor(SV_src.object_index,obj_handler_act) || SV_src.object_index == obj_handler_act){
        
        #region //act
            _strArr = [
            	"---", //rank
            	"---", //pwr
            	"---", //acc
            	"---", //enCost
            	"---", //cd
            	"---", //typ
            	"---", //tgt
            	"---" //ele
            ];
            _strCmp = array_create(array_length_1d(_strArr));
            _str = "";
            _label =
                "RANK:\n" +
                " PWR:\n" +
                " ACC:\n" +
                "COST:\n" +
                "  CD:\n" +
                " TYP:\n" +
                " TGT:\n" +
                " ELE:";
            
            if(scr_exists(SV_src,asset_object)){
            	_name = SV_src.name;
            	
            	var SV_i = 0;
            	
            	_strArr[SV_i] = string(SV_src.rare);
            	
            	if(scr_exists(compareItem,asset_object)){
            	    _strCmp[SV_i] = SV_src.rare + -compareItem.rare;
            	}
            	
            	SV_i++;
            	
            	if(SV_src.pwr > 0){
            		_strArr[SV_i] = string(round(SV_src.pwr)) + "x" + string(SV_src.hitCount * SV_src.hitSimul);
            		
            		if(scr_exists(compareItem,asset_object) && compareItem.pwr > 0){
                	    _strCmp[SV_i] = SV_src.pwr + -compareItem.pwr;
                	}
            	}
            	
            	SV_i++;
            	
            	if(SV_src.acc <= 100){
            		_strArr[SV_i] = string(round(SV_src.acc));
            		
            		if(scr_exists(compareItem,asset_object) && compareItem.acc <= 100){
                	    _strCmp[SV_i] = SV_src.acc + -compareItem.acc;
                	}
            	}
            	
            	SV_i++;
            	
            	if(SV_src.enCost > 0){
            		_strArr[SV_i] = string(round(SV_src.enCost));
            		
            		if(scr_exists(compareItem,asset_object) && compareItem.enCost > 0){
                	    _strCmp[SV_i] = -(SV_src.enCost + -compareItem.enCost);
                	}
            	}
            	
            	SV_i++;
            	
            	if(SV_src.cdAdd > 0){
            		_strArr[SV_i] = string(round(SV_src.cdAdd));
            		
            		if(scr_exists(compareItem,asset_object) && compareItem.cdAdd > 0){
                	    _strCmp[SV_i] = -(SV_src.cdAdd + -compareItem.cdAdd);
                	}
            	}
            	
            	SV_i++;
            	
            	switch(SV_src.atkScale){
            		case CHAR_VAR_MATK:
            		case CHAR_VAR_MDEF:
            			_strArr[SV_i] = "M"
            			
            			break;
            		case CHAR_VAR_FATK:
            		case CHAR_VAR_FDEF:
            			_strArr[SV_i] = "F"
            			
            			break;
            		case CHAR_VAR_SATK:
            		case CHAR_VAR_SDEF:
            			_strArr[SV_i] = "S"
            			
            			break;
            	}
            	
            	if(SV_src.tgtEnemy){
            		switch(SV_src.defScale){
            			case CHAR_VAR_MDEF:
            				_strArr[SV_i] += "vM"
            				
            				break;
            			case CHAR_VAR_FDEF:
            				_strArr[SV_i] += "vF"
            				
            				break;
            			case CHAR_VAR_SDEF:
            				_strArr[SV_i] += "vS"
            				
            				break;
            		}
            	}
            	
            	SV_i++;
            	
            	switch(SV_src.tgtType){
            		case ACT_TGT_SINGLE:
            			_strArr[SV_i] = "SINGLE"
            			
            			break;
            		case ACT_TGT_WIDE:
            			_strArr[SV_i] = "WIDE"
            			
            			break;
            		case ACT_TGT_RANDOM:
            			_strArr[SV_i] = "RANDOM"
            			
            		case ACT_TGT_SELF:
            			_strArr[SV_i] = "SELF"
            			
            			break;
            	}
            	
            	SV_i++;
            	
            	switch(SV_src.ele){
            		case CHAR_VAR_ELE_FIR:
            			_strArr[SV_i] = "FIRE"
            			
            			break;
            		case CHAR_VAR_ELE_ICE:
            			_strArr[SV_i] = "ICE"
            			
            			break;
            		case CHAR_VAR_ELE_DRK:
            			_strArr[SV_i] = "DARK"
            			
            			break;
            		case CHAR_VAR_ELE_LGT:
            			_strArr[SV_i] = "LIGHT"
            			
            			break;
            		case CHAR_VAR_ELE_ELC:
            			_strArr[SV_i] = "ELEC"
            			
            			break;
            		case CHAR_VAR_ELE_NAT:
            			_strArr[SV_i] = "NATURE"
            			
            			break;
            	}
            	
            	SV_i++;
            }
            
            for(var SV_i2 = 0;SV_i2 < SV_i;SV_i2++){
            	_str += _strArr[SV_i2] + "\n";
            }
        #endregion
        
    }else if(object_is_ancestor(SV_src.object_index,obj_handler_armor) || SV_src.object_index == obj_handler_armor){
        
        #region //armor
        	_strArr = [
        		"---", //main
        		"---", //fir
        		"---", //ice
        		"---", //elc
        		"---", //nat
        		"---", //lgt
        		"---" //drk
        	];
        	_str = "";
        	_label = "\nFIR:\nICE:\nELC:\nNAT:\nLGT:\nDRK:";
        	
        	if(SV_src != noone && SV_src != undefined && instance_exists(SV_src)){
        		_name = SV_src.name;
        		
        		switch(SV_src.type){
        			case CHAR_VAR_HP:
        				_label = "HP" + _label;
        				break;
        				
        			case CHAR_VAR_EN:
        				_label = "EN" + _label;
        				break;
        				
        			case CHAR_VAR_MATK:
        				_label = "M-ATK" + _label;
        				break;
        				
        			case CHAR_VAR_MDEF:
        				_label = "M-DEF" + _label;
        				break;
        				
        			case CHAR_VAR_FATK:
        				_label = "F-ATK" + _label;
        				break;
        				
        			case CHAR_VAR_FDEF:
        				_label = "F-DEF" + _label;
        				break;
        				
        			case CHAR_VAR_SATK:
        				_label = "S-ATK" + _label;
        				break;
        				
        			case CHAR_VAR_SDEF:
        				_label = "S-DEF" + _label;
        				break;
        				
        			case CHAR_VAR_ACC:
        				_label = "ACC" + _label;
        				break;
        				
        			case CHAR_VAR_EVA:
        				_label = "EVA" + _label;
        				break;
        				
        			case CHAR_VAR_SPD:
        				_label = "SPD" + _label;
        				break;
        				
        			case CHAR_VAR_MISC:
        				_label = "MISC" + _label;
        				break;
        		}
        		
        		_strArr[0] = "+" + string(SV_src.pwr);
        		_strArr[1] = "+" + string(SV_src.ele_fir * SV_src.plus);
        		_strArr[2] = "+" + string(SV_src.ele_ice * SV_src.plus);
        		_strArr[3] = "+" + string(SV_src.ele_elc * SV_src.plus);
        		_strArr[4] = "+" + string(SV_src.ele_nat * SV_src.plus);
        		_strArr[5] = "+" + string(SV_src.ele_lgt * SV_src.plus);
        		_strArr[6] = "+" + string(SV_src.ele_drk * SV_src.plus);
        	}
        	
        	for(var _i = 0;_i < 7;_i++){
        		_str += _strArr[_i] + "\n";
        	}
        #endregion
        
    }else if(object_is_ancestor(SV_src.object_index,obj_handler_class_parent) || SV_src.object_index == obj_handler_class_parent){
        
        #region //class
        	_strArr = [
        		"---", //lvl
        		"---" //skills
        	];
        	_str = "";
        	_label = "LEVEL:\nSKILLS:";
        	
        	if(SV_src != undefined && instance_exists(SV_src)){
        		_name = SV_src.name;
        		
        		_strArr[0] = string(ds_grid_get_sum(SV_src.grd_skills,0,0,ds_grid_width(SV_src.grd_skills) + -1,ds_grid_height(SV_src.grd_skills) + -1));
        		
        		var _skills = 0;
        		
        		for(var _ix = 0;_ix < ds_grid_width(SV_src.grd_skills);_ix++){
        			for(var _iy = 0;_iy < ds_grid_height(SV_src.grd_skills);_iy++){
        				_skills += sign(SV_src.grd_skills[# _ix,_iy]);
        			}
        		}
        		
        		_strArr[1] = string(_skills);
        	}
        	
        	for(var _i = 0;_i < 2;_i++){
        		_str += _strArr[_i] + "\n";
        	}
    	#endregion
    	
    }
}

draw_set_font(ft_menuSub);
draw_set_halign(!_xFlip ? fa_right : fa_left);
draw_set_valign(fa_bottom);
draw_set_color(c_dkgray);
draw_set_alpha(SV_alpha * .7);

draw_rectangle(_x2,_y2,_x2 + _iww,_y2 + string_height(_label) + 4,false);

draw_set_alpha(SV_alpha);
draw_set_color(c_ltgray);

draw_line_width(_x1,_y1,_x2,_y2,4);
draw_line_width(_x2,_y2,_x2 + _iww,_y2,4);

draw_set_color(c_dkgray);

draw_line_width(_x1,_y1,_x2,_y2,2);
draw_line_width(_x2,_y2,_x2 + _iww,_y2,2);

ktk_scr_draw_text_stroke(_x2,_y2,_name,c_dkgray,c_ltgray,1,10);

draw_set_valign(fa_top);
draw_set_halign(fa_right);

ktk_scr_draw_text_shadow(_x2 + (_iww * _xFlip) + -3,_y2 + 4,_str,c_white,c_dkgray,1);

draw_set_halign(fa_left);

for(var SV_i = 0;SV_i < array_length_1d(_strCmp);SV_i++){
    var
    _int = round(_strCmp[SV_i]),
    _cmpDraw = string_repeat("\n",SV_i) + (_int > 0 ? "+" : "") + string(_int),
    _col = _int > 0 ? CC_ENBLUE : c_orange;
    
    if(_int != 0 && scr_exists(ps_portEquip,asset_object) && _menu.link_panel.txt[0] != "party/equip/.."){
        ktk_scr_draw_text_stroke_ext(_x2 + (_iww * _xFlip) + 2,_y2 + 4,_cmpDraw,c_white,_col,SV_alpha,c_dkgray,c_dkgray,SV_alpha,2,10,1,1,0);
    }
}

ktk_scr_draw_text_shadow(_x2 + (_iww * !_xFlip) + 3,_y2 + 4,_label,c_white,c_dkgray,1);