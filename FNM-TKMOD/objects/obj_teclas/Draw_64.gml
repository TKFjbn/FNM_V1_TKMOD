/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

var _escala_draw = display_get_gui_width() / 1920;

draw_set_alpha(1);

for (var i = 0; i < 4;i++) { //dibujar teclas enemigo
	
	#region decidir color
	if (escalas[i] != 1) {
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
	} else {
		_colorNote = c_gray;
	}
	
	#endregion
	
	draw_sprite_ext(sprite_index,i,(x + 180 * i) * _escala_draw,y * _escala_draw,escalas[i] * _escala_draw,escalas[i] * _escala_draw,0,_colorNote,0.9);
	
}

for (var i = 0; i < 4;i++) { //dibujar teclas player
	
	#region decidir color
	
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
	
	#endregion
	
	draw_sprite_ext(sprite_index,i,(x + 1020 + 180 * i) * _escala_draw,y * _escala_draw,escalas[i+4] * _escala_draw,escalas[i+4] * _escala_draw,0,_colorNote,0.9);
	
}
