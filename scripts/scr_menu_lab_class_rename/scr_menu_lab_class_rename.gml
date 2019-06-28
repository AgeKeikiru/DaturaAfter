var
SV_menu = ds_stack_top(global.stk_menu),
SV_obj = SV_menu.grd_equipSrc[# SV_menu.menu_x,SV_menu.menu_y];

if(scr_exists(SV_obj,asset_object)){
    var
    SV_str = get_string("Enter custom name (max 10 char):",SV_obj.cName),
    SV_x = SV_menu.menu_x,
    SV_y = SV_menu.menu_y;
    
    if(SV_str != ""){
        SV_obj.cName = string_copy(SV_str,1,10);
        
        SV_menu.grd_txt[# SV_x,SV_y] = SV_obj.name + " \"" + SV_obj.cName + "\"";
        
        if(SV_obj.src != noone){
    		SV_menu.grd_txt[# SV_x,SV_y] = "[E]" + SV_menu.grd_txt[# SV_x,SV_y];
    	}
    }
}