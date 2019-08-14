ds_grid_destroy(global.grd_dia);

global.grd_dia = ds_grid_create(8,0);

var
SV_i = scr_dia_newStep(),
SV_map = scr_data_getMap(global.grd_missions,global.missionCurr);


global.grd_dia[# DIA_NAME,SV_i] = "Tear";
global.grd_dia[# DIA_TXT,SV_i] = "This is an emergency request from Lainarch's Knight Guild, \"Layered\".";
global.grd_dia[# DIA_SCR,SV_i] = scr_dia_build_vCanal_01_brief_img01;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Venus City's underground canal is currently under siege by a large group of monsters, and a small squad of Knights have been dispatched to deal with this sudden threat.";
global.grd_dia[# DIA_SCR,SV_i] = scr_dia_build_vCanal_01_brief_img02;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "The objective of this attack is unclear, but if the control center deep within the canal were to sustain damage from this it would wreak havok on the city above.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Layered's forces are too far spread at the moment and are reaching out to adventurers to secure different sectors of the canal.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "You lot will begin at the northwest entrance and make your way to the control center to assist the Layered squad, eliminating any monsters encountered along the way.";
global.grd_dia[# DIA_SCR,SV_i] = scr_dia_build_vCanal_01_brief_img03;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Take care not to get lost in the canal's maze-like structure and low visibility - you may find it harder to get your attacks to land as well so execute your battles wisely.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Again, this is a priority request from a high-profile client. Don't screw this up.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "";
global.grd_dia[# DIA_TXT,SV_i] =
"Location: " + SV_map[? MSN_VAR_DESC_LOC] +
"\nTarget: " + SV_map[? MSN_VAR_DESC_TGT] +
"\nObjective: " + SV_map[? MSN_VAR_DESC_OBJ];

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_menu_briefConfirm;