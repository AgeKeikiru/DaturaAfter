ds_grid_destroy(global.grd_dia);

global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "This looks like a lost package stuck in some wreckage to me.";
global.grd_dia[# DIA_FOCUS_L,SV_i] = true;
global.grd_dia[# DIA_REFR_L,SV_i] = true;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "*Slash*";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Well that was easy enough.";

var SV_c = CHAR_PAPRIKA;

if(scr_isInParty(CHAR_ARI)){
    SV_c = CHAR_ARI;
}

SV_i = scr_dia_newStep(SV_c,false);
global.grd_dia[# DIA_TXT,SV_i] = "Wait, you hear that?";
global.grd_dia[# DIA_REFR_R,SV_i] = true;
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "We got company!";

SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "Of course we do.";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Hmph, bring it on then! I'm not afraid of some mutts!";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_dungeon_endDia;