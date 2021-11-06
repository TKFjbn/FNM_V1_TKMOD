/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);

draw_set_color(c_aqua);

draw_set_font(font_press);
draw_text(960,1000,"Press Enter to Begin");

draw_set_font(font_fps);
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_valign(fa_top);
draw_set_halign(fa_right);

if (general) {
	var decir = "Friday Night Player " + global.game_version;
} else {
	var decir = "Created in Friday Night Maker " + global.game_version;
}

draw_text_transformed(1920,0,decir,0.5,0.5,0);
