/// @description Custom events

switch cEvent{
    case MHE_INIT:
        layer_background_sprite(global.ly_bg[0],bg_forest);
        
        break;
        
    default:
        event_inherited();
        break;
}