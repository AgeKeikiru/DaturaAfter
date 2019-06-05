#define ktk_scr_draw_text_stroke
///draw_text_colour_outline(x, y, string, textColor, strokeColor, strokeWeight, quality);
//By Blokatt - @blokatt, blokatt.net

var i;
for (i = 0; i < 360; i += 360 / argument6){
    draw_text_transformed_color(argument0 + lengthdir_x(argument5, i), argument1 + lengthdir_y(argument5, i), string(argument2), 1, 1, 0, argument4, argument4, argument4, argument4, 1);
}
draw_text_transformed_color(argument0, argument1, string(argument2), 1, 1, 0, argument3, argument3, argument3, argument3, 1);

