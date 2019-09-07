var SV_arr,SV_m;

switch global.map_flags[? FG_MSNCLEARS]{
    case 6:
        SV_arr = [MSN_DEMOBOSS];
        
        for(var SV_i = 0;SV_i < array_length_1d(SV_arr);SV_i++){
            scr_unlockMission(SV_arr[SV_i]);
        }
    
        break;
}