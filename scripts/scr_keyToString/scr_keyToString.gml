/// @arg _key

var _key = argument0;

switch _key{
    case vk_enter:
        return "[ENTER]";
        
    case vk_shift:
        return "[SHIFT]";
        
    case vk_control:
        return "[CTRL]";
        
    case vk_alt:
        return "[ALT]";
        
    case vk_space:
        return "[SPACE]";
        
    case vk_backspace:
        return "[BS]";
        
    case vk_tab:
        return "[TAB]";
        
    case vk_left:
        return "[LEFT]";
        
    case vk_right:
        return "[RIGHT]";
        
    case vk_up:
        return "[UP]";
        
    case vk_down:
        return "[DOWN]";
    
    default:
        return "[" + string_lettersdigits(chr(_key)) + "]";
}