/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if point_in_rectangle(mouse_x,mouse_y,660,120,1260,240) and mouse_check_button_pressed(mb_left) {
	
	if (!seleccion_menu) {
		seleccion_menu = true;
		keyboard_string = nombre_nivel;
	} else if (seleccion_menu) {
		if (keyboard_check_pressed(vk_enter)) {
			seleccion_menu = false;
		} else {
			nombre_nivel = keyboard_string;
		}
	}
	
} else if (mouse_check_button_pressed(mb_left)) {
	seleccion_menu = false;
}
