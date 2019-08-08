scr_trace("==DUMPED==");

var SV_f = file_text_open_append(DATA_LOG);

file_text_write_string(SV_f,global.log);

file_text_close(SV_f);

global.log = "";

with obj_handler_menuUI{
    alarm[0] = room_speed * 5;
}