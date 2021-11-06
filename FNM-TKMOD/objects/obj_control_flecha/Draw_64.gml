/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

var _escala_draw = display_get_gui_width() / room_width;

draw_set_alpha(0.3);

if (point_in_rectangle(mouse_x,mouse_y,630,0,1360,180 )) {
		
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
	
draw_rectangle(630 * _escala_draw, 0 ,1360 * _escala_draw, 180 * _escala_draw,0);


for (var i = 0; i < 4;i++) { //dibujar teclas player
	
	/*#region decidir color
	
	if (escalas[i+4] > 1) {
		switch (i) {
			case 0:
				var _colorNote = make_color_rgb(196,40,138); //rosa
			break;
			case 1:
				_colorNote = make_color_rgb(3,229,254); //azul
			break;
			case 2:
				_colorNote = make_color_rgb(0,213,2); //verde
			break;
			case 3:
				_colorNote = make_color_rgb(239,29,29); //rojo
			break;
		}
		_colorNote = merge_color(_colorNote,c_white,0.35 + 0.15 * (escalas[i+4] - 1) / 0.1);
	} else {
		_colorNote = c_gray;
	}
	
	#endregion*/
	
	//draw_sprite_ext(sprite_index,i,(x + 1020 + 180 * i) * _escala_draw,y * _escala_draw,escalas[i+4] * _escala_draw,escalas[i+4] * _escala_draw,0,_colorNote,0.9);
	draw_sprite_ext(sprite_index,i,(730 + 180*i) * _escala_draw,90 * _escala_draw,_escala_draw,_escala_draw,0,c_white,1);
	
}
