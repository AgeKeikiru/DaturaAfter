///@arg fname

var _f = "JSON/" + argument0 + ".json";

if(!file_exists(_f)){ return -1 }

var
_buff = buffer_load(_f),
_r = buffer_read(_buff, buffer_string);

buffer_delete(_buff);
return json_decode(_r);