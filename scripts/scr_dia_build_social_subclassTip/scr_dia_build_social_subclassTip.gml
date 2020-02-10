ds_grid_destroy(global.grd_dia);
global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep();

if(ds_exists(global.currentSocial,ds_type_map)){
    global.grd_dia[# DIA_NAME,SV_i] = global.currentSocial[? SOC_VAR_NAME];
}

global.grd_dia[# DIA_TXT,SV_i] = "Be careful what you decide on for a subclass. Lots of classes have an auto-stance as their main class skill, and a good deal of its skills are usually tied to it as well.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "A class chip in the 2nd class slot loses the effects of all that, so many aren't really suited to being used as subclasses at all.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Worst comes to worst, you can always stick the rest of your skill points in the sub-skill. It's there specifically for if you want to use a class as a subclass but don't have anymore sub-viable skills to put points into.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_home_endDia;