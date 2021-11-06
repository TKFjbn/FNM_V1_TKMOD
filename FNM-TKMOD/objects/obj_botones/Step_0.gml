/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if (collision_point(mouse_x,mouse_y,id,1,0)) {
	
	if (mouse_check_button_pressed(mb_left)) {
		obj_seleccion_sprites.numero += sign(image_xscale);
		
		if (obj_seleccion_sprites.numero < 0) {
			obj_seleccion_sprites.numero = 0;
		} else if (obj_seleccion_sprites.numero > obj_seleccion_sprites.numero_max) {
			obj_seleccion_sprites.numero = obj_seleccion_sprites.numero_max;
		}
	}
	
	image_blend = c_gray;
	
} else {
	image_blend = c_white;
}
