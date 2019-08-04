scr_trace("==DUMPED==");

var SV_f = file_text_open_write(DATA_LOG);

file_text_write_string(SV_f,global.log);

file_text_close(SV_f);

with obj_handler_menuUI{
    alarm[0] = room_speed * 5;
}