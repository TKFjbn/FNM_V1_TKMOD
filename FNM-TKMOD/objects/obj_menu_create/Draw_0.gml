/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

draw_set_color(c_black);
draw_set_alpha(0.5);

draw_rectangle(480,0,1440,1080,0);

draw_set_alpha(1);

draw_rectangle(660,120,1260,240,0);

if (seleccion_menu) {
	draw_set_color(c_white);
	draw_rectangle(660,120,1260,240,1);
}


