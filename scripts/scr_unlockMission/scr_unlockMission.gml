///@arg msnID

var SV_m = scr_data_getMap(global.grd_missions,argument0);

if(SV_m[? MSN_VAR_STATUS] == 0){
    SV_m[? MSN_VAR_STATUS] = 1;
}