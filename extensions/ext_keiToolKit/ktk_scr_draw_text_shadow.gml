#define ktk_scr_draw_text_shadow
///draw_text_shadow(x, y, string, textColor, shadowColor, shadowDist);
//By Blokatt - @blokatt, blokatt.net


draw_text_transformed_color(argument0 + argument5, argument1, string(argument2), 1, 1, 0, argument4, argument4, argument4, argument4, draw_get_alpha());
draw_text_transformed_color(argument0, argument1 + argument5, string(argument2), 1, 1, 0, argument4, argument4, argument4, argument4, draw_get_alpha());
draw_text_transformed_color(argument0 + argument5, argument1 + argument5, string(argument2), 1, 1, 0, argument4, argument4, argument4, argument4, draw_get_alpha());


draw_text_transformed_color(argument0, argument1, string(argument2), 1, 1, 0, argument3, argument3, argument3, argument3, draw_get_alpha());

