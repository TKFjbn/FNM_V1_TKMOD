/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

var _escala_draw = display_get_gui_width() / 1920;

draw_set_alpha(1);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);

var dist_options = 1080 / options_number
if (string_height("A") > (dist_options * 0.7)) {
	var scale_options = (dist_options * 0.7) / string_height("A");
} else {
	var scale_options = 1;
}

for (var i = 0; i < options_number; i++) {
	
	if (selected = i) {
		draw_set_font(font_menu_inic2);
		draw_set_color(c_black);
		draw_text_transformed(960 * _escala_draw,(dist_options/2 + dist_options * i) * _escala_draw,string_upper(global.text[7+i]),1.3 * scale_options * _escala_draw,1.3 * scale_options * _escala_draw,0);
		draw_set_font(font_menu_inic);
		draw_set_color(c_white);
		draw_text_transformed(960 * _escala_draw,(dist_options/2 + dist_options * i) * _escala_draw,string_upper(global.text[7+i]),1.3 * scale_options * _escala_draw,1.3 * scale_options * _escala_draw,0);
		
	} else {
		draw_set_font(font_menu_inic2);
		draw_set_color(c_white);
		draw_text_transformed(960 * _escala_draw,(dist_options/2 + dist_options * i) * _escala_draw,string_upper(global.text[7+i]),scale_options * _escala_draw,scale_options * _escala_draw,0);
		draw_set_font(font_menu_inic);
		draw_set_color(c_black);
		draw_text_transformed(960 * _escala_draw,(dist_options/2 + dist_options * i) * _escala_draw,string_upper(global.text[7+i]),scale_options * _escala_draw,scale_options * _escala_draw,0);
	}
	
}
