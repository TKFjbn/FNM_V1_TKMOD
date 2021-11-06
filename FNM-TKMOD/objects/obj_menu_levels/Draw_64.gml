/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

var _escala_draw = display_get_gui_width() / 1920;

draw_set_alpha(1);
draw_set_valign(fa_middle);
draw_set_halign(fa_left);

var dist_options = 170;

for (var i = 0; i < options_number; i++) {
	
	if (global.levelselected = i) {
		draw_set_font(font_levels);
		draw_set_color(c_black);
		draw_text_transformed((40 + 20 * (i - transition + 1)) * _escala_draw,(540 + dist_options * (i - transition)) * _escala_draw,string_upper(global.name_list[i]),1.3 * _escala_draw,1.3 * _escala_draw,0);
		draw_set_font(font_levels2);
		draw_set_color(c_white);
		draw_text_transformed((40 + 20 * (i - transition + 1)) * _escala_draw,(540 + dist_options * (i - transition)) * _escala_draw,string_upper(global.name_list[i]),1.3 * _escala_draw,1.3 * _escala_draw,0);
	} else {
		draw_set_font(font_levels);
		draw_set_color(c_black);
		draw_text_transformed((40 + 20 * (i - transition + 1)) * _escala_draw,(540 + dist_options * (i - transition)) * _escala_draw,string_upper(global.name_list[i]),_escala_draw,_escala_draw,0);
		draw_set_font(font_levels2);
		draw_set_color(c_gray);
		draw_text_transformed((40 + 20 * (i - transition + 1)) * _escala_draw,(540 + dist_options * (i - transition)) * _escala_draw,string_upper(global.name_list[i]),_escala_draw,_escala_draw,0);
	}
	
}

draw_set_font(font_credits);
draw_set_color(c_black);
draw_set_alpha(0.5);
draw_set_halign(fa_right);
draw_set_valign(fa_top);
var credits_width = string_width(credits_level[global.levelselected]) + 20;
var credits_height = string_height(credits_level[global.levelselected]) + 20;
draw_rectangle((1920 - credits_width) * _escala_draw,0,1920 * _escala_draw,credits_height * _escala_draw,0);
draw_set_alpha(1);
draw_set_color(c_white);
draw_text_transformed(1910 * _escala_draw,10 * _escala_draw,credits_level[global.levelselected],_escala_draw,_escala_draw,0);
