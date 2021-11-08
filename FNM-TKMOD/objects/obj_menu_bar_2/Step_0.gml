/// @description funciones del menu de opciones derecho

#region //descripcion detallada
	
	/*seleccion de opciones del menu al hacer click encima del icono
	
	MOD: 
	-cambiar velocidad de las notas dentro del editor
	-cambiar Creditos dentro del editor
	-cambiar Musica y vocales dentro del editor
	-abrir la carpeta raiz del nivel
	*/
	
#endregion


for (var i = 0; i < sprite_get_number(sprite_index);i++) {

	
	if (mouse_check_button_pressed(mb_left) and (point_in_rectangle(mouse_x,mouse_y,1830,90 * i,1920,89 + 90*i))) {
		
		//opciones del menu
		switch(i) {
			
			case 0: //cambiar velocidad de las notas
				
				#region //mensaje emergente para cambiar la velocidad de las notas
				
				/* guarda el dato del mensaje emergente en la variable local _speed_level,
				cabe destacar que se utiliza la variable global speed_notes para rescatar
				la velocidad actual del nivel y mostrarla en el mensaje emergente
				*/
				var _speed_level = round(get_integer(global.text[2],global.speed_notes));
				
				/* si se cancela la opcion del mensaje emergente dara valor 0.
				asi que este if revertira el valor 0 por el valor actual del nivel,
				lo mismo sucede si el valor es menor a 5, asi evitando errores.
				*/
				
				if(_speed_level = 0 or _speed_level < 5){
					_speed_level = global.speed_notes;
				}else{
					
					//cambia el valor actual del nivel por el nuevo valor escrito por el usuario
					global.speed_notes = _speed_level;
					save_game(true);
				}

				#endregion
				
			break;
			
			case 1: //editar descripcion
			
				#region //abrir credits.txt desde el editor
				
				var _path = global.ruta + "credits.txt";
				var _txt = file_text_open_write(_path);
				var _windir = environment_get_variable("WINDIR");
				
				/*si el archivo credits.txt no existe, crea uno nuevo, 
				para luego abrirlo con el notepad
				*/
				
				if (!file_exists(global.ruta + "credits.txt")){
					
					#region //contenido de los creditos
					
					file_text_write_string(_txt,"Music -");
					file_text_writeln(_txt);
					file_text_write_string(_txt,"Art -");
					file_text_writeln(_txt);
					file_text_write_string(_txt,"Background - ");
					file_text_writeln(_txt);
					file_text_write_string(_txt,"Notes - ");
					file_text_close(_txt);
					
					#endregion

					execute_shell_simple(_windir + "/Notepad.exe", _path);
				}else{
					//en caso de que exista, simplemente o abre
					execute_shell_simple(_windir + "/Notepad.exe", _path);	
				}
				
				#endregion
							
			break;
			
			case 2: //musica
				
				//si la cantidad de musica esta entre 1 y 3
				if (global.cant_musics >= 1) and (global.cant_musics <= 3) {
							
					var _music_bg;
					var cancel = false;
					
					//escoger el archivo de musica
					_music_bg = get_open_filename("Music |*.ogg","music.ogg");
					//en caso que se cancele la operacion finaliza la operacion
					if (_music_bg = "") or (!file_exists(_music_bg)) { cancel = true; break; }
					else{
						
						/*elimina la version actual de la musica para remplazarla con la version actual
						seleccionada por el usuario
						*/
						file_delete(global.ruta + "0.ogg");
						file_copy(_music_bg,global.ruta + "0.ogg");
					}
				}
				
			break;
			
			case 3: //audio enemigo
				
				//si la cantidad de musica esta entre 1 y 3
				if (global.cant_musics >= 1) and (global.cant_musics <= 3) {
							
					var _enemy_vocal;
					var cancel = false;
					
					//escoger el archivo vocal del enemigo
					_enemy_vocal = get_open_filename("Enemy_vocal |*.ogg","enemy_vocal.ogg");
					//en caso que se cancele la operacion, finaliza la operacion.
					if (_enemy_vocal = "") or (!file_exists(_enemy_vocal)) { cancel = true; break; }
					else{
						//elimina el archivo actual para luego ser remplazado por el nuevo
						if(file_exists(global.ruta + "1.ogg")){
							file_delete(global.ruta + "1.ogg");
						}
						/*verifica si la cantidad de musica es concorde con la cantidad de archivos,
						en el caso contrario, cambiara la cantidad de musica y mostrara un aviso,
						diciendole al player que el nivel se reiniciara al salir.
						
						esto solo sucedera si la cantidad de musica es = 1
						*/
						if(global.cant_musics = 1){
							global.cant_musics = 2;
							global.music_change = true;
							show_message(global.text[61]);
							save_game(true);
						}
						file_copy(_enemy_vocal,global.ruta + "1.ogg");
					}
				}	
			break;

			case 4: //audio jugador
			
				//funcion redundante que hace lo mismo que el caso 3...
			
				//si la cantidad de musica esta entre 1 y 3
				if (global.cant_musics >= 1) and (global.cant_musics <= 3) {
							
					var _player_vocal;
					var cancel = false;
					
					//escoger el archivo vocal del player.
					_player_vocal = get_open_filename("player_vocal |*.ogg","player_vocal.ogg");
					//en caso que se cancele la operacion, finaliza la operacion.
					if (_player_vocal = "") or (!file_exists(_player_vocal)) { cancel = true; break; }
					else{
						//elimina el archivo actual para luego ser remplazado por el nuevo
						if(file_exists(global.ruta + "2.ogg")){
							file_delete(global.ruta + "2.ogg");
						}
						
						/*verifica si la cantidad de musica es concorde con la cantidad de archivos,
						en el caso contrario, cambiara la cantidad de musica y mostrara un aviso,
						diciendole al player que el nivel se reiniciara al salir.
						
						esto solo sucedera si la cantidad de musica es = 2
						*/
						
						if(global.cant_musics = 2){
							global.cant_musics = 3;
							global.music_change = true;
							show_message(global.text[61]);
							save_game(true);
						}
						file_copy(_player_vocal,global.ruta + "2.ogg");
					}
				}
				
			break;
			
			case 5: //carpeta raiz
			
				#region //utiliza el CMD para abrir la carpeta raiz
				
				/*Ejecuta una funcion que utiliza el CMD,
				llama la ruta raiz del nivel para luego abrir su fichero.
				
				(No es totalmente necesario escribir el argumento, la accion y el showcmd,
				ya que los datos por default funcionan para lo que quiero hacer)
				
				la extencion es execute_shell_simple, es bastante util.
				*/
				
				execute_shell_simple(global.ruta);
				
				#endregion
				
			break;
			
			default:
			break;
		}
	}
}
