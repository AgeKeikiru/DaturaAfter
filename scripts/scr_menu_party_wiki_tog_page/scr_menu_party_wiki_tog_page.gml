///@arg increase
///@arg *refresh

var
_m = ds_stack_top(global.stk_menu);

with _m{
    var _key = string(grd_equipSrc[# menu_x,menu_y]) + string(menu_y);
    
    if(ds_map_exists(global.map_wiki,_key)){
        var
        _arr = global.map_wiki[? _key],
        _len = array_length_1d(_arr) + -1;
        
        global.tempInt = grd_page[# menu_x,menu_y];
        
        if(argument_count <= 1 || !argument[1]){
            scr_menu_toggleBasic(argument[0],"tempInt",1,0,_len + -1);
            
            grd_page[# menu_x,menu_y] = global.tempInt;
        }
        
        grd_desc[# menu_x,menu_y] = _arr[global.tempInt + 1];
        grd_descLabel[# menu_x,menu_y] = "<- " + string(global.tempInt + 1) + "/" + string(_len) + " ->";
    }
}