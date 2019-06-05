#define ktk_scr_tween
var _sv,_tv,_rate,_max,_r;
_sv = argument0; //starting value
_tv = argument1; //target value
_rate = argument2; //tween speed, LOWER = faster, down to 1
_max = argument3; //max tween per step, 0 for no cap

_r = (_tv - _sv) / _rate;

if(_max > 0){
    _r = sign(_r) * min(abs(_r),abs(_max));
}

return _sv + _r;

