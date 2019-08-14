var SV_arr,SV_m;

switch global.map_flags[? FG_MSNCLEARS]{
    case 1:
        SV_arr = [MSN_NLOEWI_02,MSN_VWOODS_01];
        
        for(var SV_i = 0;SV_i < array_length_1d(SV_arr);SV_i++){
            scr_unlockMission(SV_arr[SV_i]);
        }
    
        break;
        
    case 3:
        SV_arr = [MSN_DEMOBOSS];
        
        for(var SV_i = 0;SV_i < array_length_1d(SV_arr);SV_i++){
            scr_unlockMission(SV_arr[SV_i]);
        }
    
        break;
}

SV_m = scr_data_getMap(global.grd_missions,MSN_VWOODS_01);

if(SV_m[? MSN_VAR_STATUS] == 2){
    scr_unlockMission(MSN_VCANAL_01);
}