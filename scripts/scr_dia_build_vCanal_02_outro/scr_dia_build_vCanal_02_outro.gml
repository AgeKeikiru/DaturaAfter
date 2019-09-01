ds_grid_destroy(global.grd_dia);

global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_NAME,SV_i] = "Intercom";
global.grd_dia[# DIA_TXT,SV_i] = "Hm... I see.";
global.grd_dia[# DIA_FOCUS_L,SV_i] = false;
global.grd_dia[# DIA_REFR_L,SV_i] = true;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "That concludes the test. Thank you again for your assistance.";

global.tempBool = false;

with obj_handler_dungeon{
    if(missionComplete){
        global.tempBool = true;
    }
}

if(global.tempBool){
    SV_i = scr_dia_newStep();
    global.grd_dia[# DIA_NAME,SV_i] = "Tear";
    global.grd_dia[# DIA_TXT,SV_i] = "Excellent work, you lot.";
    
    SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
    global.grd_dia[# DIA_TXT,SV_i] = "Hmph, barely broke a sweat!";
    global.grd_dia[# DIA_FOCUS_L,SV_i] = true;
}

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_dungeon_endDia;