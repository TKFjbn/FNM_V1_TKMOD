/// @description UI de la barra del menu
// Puede escribir su código en este editor

/*Dibujado del la UI de la barra del menu

MOD: 
-Cambio de horizontal a vertical.
-draw_set_alpha: de 1 a 0.6.
-cambio del color del rectangulo.
*/

var _escala_draw = display_get_gui_width() / room_width;

draw_set_alpha(0.3);

for (var i = 0; i < sprite_get_number(sprite_index);i++) {
	
	//if (point_in_rectangle(mouse_x,mouse_y,90 * i,0,89 + 90*i,90))
	if (point_in_rectangle(mouse_x,mouse_y,0,90 * i,90,89 + 90*i)) {
		
		if (mouse_check_button(mb_left)) {
			//color cuando el icono es presionado
			draw_set_color($e3cddf);
		} else {
			//color cuando el puntero esta sobre el icono
			draw_set_color($bfa5c9);
		}
		
	} else {
		//color del cuadro del icono por defecto
		draw_set_color(c_black);
	}
	
	//dibujar rectangulo 
	//draw_rectangle(90 * i * _escala_draw,0, (89 + 90*i) * _escala_draw, 90 * _escala_draw,0);
	draw_rectangle(90 * _escala_draw ,90* i * _escala_draw,0,(89 + 90*i) * _escala_draw,0);
	//dibujar el icono
	//draw_sprite_ext(sprite_index,i, 90 * i * _escala_draw,0,_escala_draw,_escala_draw,0,c_white,1);
	draw_sprite_ext(sprite_index,i,0,90 * i * _escala_draw,_escala_draw,_escala_draw,0,c_white,1);
	
}

//puntero de seleccion
for (var i = 0; i < 4; i++) {
	if (global.seccion_menu = i) {
		//draw_sprite_ext(spr_point,0,(89 + 90*i) * _escala_draw,0,_escala_draw,_escala_draw,0,c_white,0.5);
		draw_sprite_ext(spr_point,0,0,(89 + 90*i) * _escala_draw,_escala_draw,_escala_draw,0,c_white,0.5);
	}
}
