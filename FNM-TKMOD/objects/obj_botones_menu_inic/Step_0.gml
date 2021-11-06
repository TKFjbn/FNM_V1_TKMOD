/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if (collision_point(mouse_x,mouse_y,id,1,0) and (mouse_check_button_released(mb_left))) {
	
	switch(image_index) {
		
		case 0: //Crear nivel
			#region crear nivel.
			var _name_new_level = string_lower(get_string(global.text[0],"Default"));
			
			if (_name_new_level != "") {
				
				#region ver si ya existe el nivel
				
					var _exist_level = false;
				
					for (var i = 0; i < array_length(obj_control_menu_inic.proyectos); i++) {
						if (string_lower(_name_new_level) = string_lower(obj_control_menu_inic.proyectos[i])) {
							_exist_level = true;
							break;
						}
					}
				
				#endregion
				
				if (_exist_level) {
					show_message(global.text[5]); //ya existe.
					game_restart();
				} else {
					var _speed_new_level = round(get_integer(global.text[2],global.velocidad)); //ingrese velocidad
					
					if (_speed_new_level > 5) {
						
						var _number_music_new_level = round(get_integer(global.text[1],1)); //cantidad musicas
						
						if (_number_music_new_level >= 1) and (_number_music_new_level <= 3) {
							
							#region obtener la cantidad de músicas
							
							var _musics_new_level = [];
							var cancel = false;
							
							for (var i = 0; i < _number_music_new_level; i++) {
								_musics_new_level[i] = get_open_filename("Music |*.ogg","music.ogg");
								if (_musics_new_level[i] = "") or (!file_exists(_musics_new_level[i])) { cancel = true; break; }
								
							}
							
							#endregion
							
							if (array_length(_musics_new_level) = _number_music_new_level) and (!cancel) {
								
								#region crear nivel
								
								switch (_number_music_new_level) {
									case 1:
										create_level(_name_new_level,_speed_new_level,_musics_new_level[0]);
									break;
									case 2:
										create_level(_name_new_level,_speed_new_level,_musics_new_level[0],_musics_new_level[1]);
									break;
									case 3:
										create_level(_name_new_level,_speed_new_level,_musics_new_level[0],_musics_new_level[1],_musics_new_level[2]);
									break;
								}
								
								#endregion
								
								game_restart(); //liberar memoria
								
							}
							
						}
						
					}
					
				}
				
			}
			#endregion
		break;
		
		case 1: //eliminar nivel.
			#region eliminar nivel
			
			var _eliminar = string_lower(get_string(global.text[4],"")); //nombre a eliminar
			
			if (_eliminar != "") {
				directory_destroy(global.ruta_dest + _eliminar);
				game_restart();
			}
			
			#endregion
		break;
			
		case 2: //editar notas.
			#region importar nivel
				zip_unzip(get_open_filename_async("level|*.fnm","level.fnm"),global.ruta_dest)
			game_restart();
			
			#endregion
		break;
		
		case 3: //exportar a ejecutable.
			#region exportar a ejecutable.
			
			transition_to(room_menu_export,10);
			
			#endregion
		break;
		
	}
	
}
