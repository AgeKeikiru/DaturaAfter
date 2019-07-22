var SV_m,SV_arr;

switch global.map_flags[? FG_MSNCLEARS]{
    case 1:
        SV_arr = [MSN_NLOEWI_02,MSN_VWOODS_01];
        
        for(var SV_i = 0;SV_i < array_length_1d(SV_arr);SV_i++){
            SV_m = scr_data_getMap(global.grd_missions,SV_arr[SV_i]);
            SV_m[? MSN_VAR_STATUS] = 1;
        }
    
        break;
        
    case 3:
        SV_arr = [MSN_DEMOBOSS];
        
        for(var SV_i = 0;SV_i < array_length_1d(SV_arr);SV_i++){
            SV_m = scr_data_getMap(global.grd_missions,SV_arr[SV_i]);
            SV_m[? MSN_VAR_STATUS] = 1;
        }
    
        break;
}