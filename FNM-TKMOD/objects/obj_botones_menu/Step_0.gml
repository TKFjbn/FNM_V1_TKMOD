/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if (collision_point(mouse_x,mouse_y,id,1,0) and (mouse_check_button_released(mb_left))) {
	
	switch(image_index) {
		
		case 0: //editar sprites.
			transition_to(room_creation_skins,10);
		break;
		
		case 1: //jugar.
			transition_to(room_gameplay,40);
		break;
			
		case 2: //editar notas.
			transition_to(room_creation,10);
		break;
		
	}
	
}
