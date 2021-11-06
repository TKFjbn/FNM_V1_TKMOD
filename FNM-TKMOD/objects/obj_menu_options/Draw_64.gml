/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

var _escala_draw = display_get_gui_width() / 1920;

draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(0,0,display_get_gui_width(),display_get_gui_height(),0);

draw_set_alpha(1);
draw_set_valign(fa_middle);
draw_set_halign(fa_left);

var dist_options = 170;

for (var i = 0; i < options_number; i++) {
	
	switch (i) {
		
		case 0:
			if (global.input_default = 0) {
				var text_add = ": WASD";
			} else {
				var text_add = ": DFJK";
			}
		break;
		case 1:
			if (global.posicion_flechas = 0) {
				var text_add = global.text[30];
			} else {
				var text_add = global.text[31];
			}
		break;
		case 2:
			if window_get_fullscreen() {
				var text_add = global.text[31];
			} else {
				var text_add = global.text[30];
			}
		break;
		case 3:
			var text_add = "";
		break;
		
	}
	
	if (selected = i) {
		draw_set_font(font_levels);
		draw_set_color(c_black);
		draw_text_transformed((40 + 20 * (i - transition + 1)) * _escala_draw,(540 + dist_options * (i - transition)) * _escala_draw,string_upper(string(global.text[20 + i]) + text_add),_escala_draw,_escala_draw,0);
		draw_set_font(font_levels2);
		draw_set_color(c_white);
		draw_text_transformed((40 + 20 * (i - transition + 1)) * _escala_draw,(540 + dist_options * (i - transition)) * _escala_draw,string_upper(string(global.text[20 + i]) + text_add),_escala_draw,_escala_draw,0);
	} else {
		draw_set_font(font_levels);
		draw_set_color(c_black);
		draw_text_transformed((40 + 20 * (i - transition + 1)) * _escala_draw,(540 + dist_options * (i - transition)) * _escala_draw,string_upper(string(global.text[20 + i]) + text_add),_escala_draw,_escala_draw,0);
		draw_set_font(font_levels2);
		draw_set_color(c_gray);
		draw_text_transformed((40 + 20 * (i - transition + 1)) * _escala_draw,(540 + dist_options * (i - transition)) * _escala_draw,string_upper(string(global.text[20 + i]) + text_add),_escala_draw,_escala_draw,0);
	}
	
}
