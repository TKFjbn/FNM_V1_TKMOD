/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

for (var i = 0; i < sprite_get_number(sprite_index);i++) {
	
	/*seleccion de opcion del menu al hacer click encima del icono
	MOD: 
	-cambio de horizontal a vertical.
	*/
	
	//if (mouse_check_button_pressed(mb_left) and (point_in_rectangle(mouse_x,mouse_y,90 * i,0, 89 + 90*i,90)))
	if (mouse_check_button_pressed(mb_left) and (point_in_rectangle(mouse_x,mouse_y,0,90 * i,90,89 + 90*i))) {
		
		//opciones del menu
		switch(i) {
			
			case 0: //cambiar fondo.
				
				var new_bg = get_open_filename("Imagen PNG|*.png","background.png");
				
				if (new_bg != "") {
					var capa_id = layer_background_get_id("Background");
					
					global.background = sprite_add(new_bg,1,0,1,0,0);
					
					layer_background_sprite(capa_id,global.background);
					
					sprite_save(global.background,0,global.ruta + "bg.png");
				}
				
			break;
			
			case 1: //seleccion personajes.
				global.seccion_menu = 0;
			break;
			
			case 2: //camara 1.
				global.seccion_menu = 1;
				obj_camara_acomodar.x = global.points_cam[(global.seccion_menu - 1) * 2];
				obj_camara_acomodar.y = global.points_cam[(global.seccion_menu - 1) * 2 + 1];
				obj_camara_acomodar.image_index = global.seccion_menu - 1;
			break;
			
			case 3: //camara 2.
				global.seccion_menu = 2;
				obj_camara_acomodar.x = global.points_cam[(global.seccion_menu - 1) * 2];
				obj_camara_acomodar.y = global.points_cam[(global.seccion_menu - 1) * 2 + 1];
				obj_camara_acomodar.image_index = global.seccion_menu - 1;
			break;
			
			case 4: //camara 3.
				global.seccion_menu = 3;
				obj_camara_acomodar.x = global.points_cam[(global.seccion_menu - 1) * 2];
				obj_camara_acomodar.y = global.points_cam[(global.seccion_menu - 1) * 2 + 1];
				obj_camara_acomodar.image_index = global.seccion_menu - 1;
			break;
			
			case 5: //resetear todo.
				global.points_cam = [];
				global.points_cam[0] = 720;
				global.points_cam[1] = 540;
				global.points_cam[2] = 960;
				global.points_cam[3] = 540;
				global.points_cam[4] = 1200;
				global.points_cam[5] = 540;
				global.data_pos_enemy[0] = 0.55;
				global.data_pos_enemy[1] = 0.55;
				global.data_pos_enemy[2] = 434;
				global.data_pos_enemy[3] = 576;
				global.data_pos_player[0] = 0.55;
				global.data_pos_player[1] = 0.55;
				global.data_pos_player[2] = 1062;
				global.data_pos_player[3] = 576;
				room_restart();
			break;
			
			case 6: //salir.
				save_game(false);
				transition_to(room_creation_menu,10);
			break;
			
		}
		
	}
	
}
