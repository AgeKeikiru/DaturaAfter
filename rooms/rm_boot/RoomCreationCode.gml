
create(gmdebug_handler);

var _date = string(current_month) + "/" + string(current_day) + "/" + string(current_year) + " " + string(current_hour) + ":" + string_format(current_minute,2,0);

file_delete(DATA_LOG);

var _f = file_text_open_write(DATA_LOG);
file_text_close(_f);

global.log = "log start time " + _date + "\n";

scr_writeLog();

room_speed = 60;
window_set_size(1280,720);
window_center();

scr_init();

room_goto(rm_home);