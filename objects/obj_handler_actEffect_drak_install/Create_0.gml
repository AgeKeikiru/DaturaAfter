
event_inherited();

duration = 10;
durMax = duration;

var _boost = 0.2;

map_statMod[? CHAR_VAR_MATK] = _boost;
map_statMod[? CHAR_VAR_FATK] = _boost;
map_statMod[? CHAR_VAR_SATK] = _boost;

map_statMod[? CHAR_VAR_MDEF] = _boost;
map_statMod[? CHAR_VAR_FDEF] = _boost;
map_statMod[? CHAR_VAR_SDEF] = _boost;

map_statMod[? CHAR_VAR_SPD] = 0.5;