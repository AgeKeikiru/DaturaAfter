///@arg object
///@arg *x
///@arg *y
///@arg *depth

var
_obj = argument[0],
_x = argument_count > 1 ? argument[1] : 0,
_y = argument_count > 2 ? argument[2] : 0,
_d = argument_count > 3 ? argument[3] : 0;

return instance_create_depth(_x,_y,_d,_obj);