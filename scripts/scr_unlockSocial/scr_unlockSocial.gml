/// @arg _key

var _key = argument0;
_key = SOC_FG_STATUS + _key;

if(!global.map_flags[? _key]){
	global.map_flags[? _key] = 1;
}