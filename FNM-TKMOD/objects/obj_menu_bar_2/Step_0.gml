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
					
					file_text_write_string(_txt,"Music:");
					file_text_writeln(_txt);
					file_text_write_string(_txt,"Art:");
					file_text_writeln(_txt);
					file_text_write_string(_txt,"Background:");
					file_text_writeln(_txt);
					file_text_write_string(_txt,"Notes:");
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
				
				show_debug_message("cambio musica");
				
			break;
			
			case 3: //audio enemigo
				
				show_debug_message("cambio audio enemigo");
				
			break;
			
			case 4: //audio jugador
			
				show_debug_message("cambio audio jugador");
				
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
			
			case 6: 
				#region debug feo
				
				show_debug_message("");
				show_debug_message("===========debug feo===========");
				show_debug_message("");
				
				//notes
				show_debug_message("[notes]");
				show_debug_message(global.notes);
				//vel notes
				show_debug_message("[vel notes]");
				show_debug_message(global.speed_notes);
				//player dat skin
				show_debug_message("[player dat skin]");
				show_debug_message(global.data_pos_player);
				//enemy data skin
				show_debug_message("[enemy data skin]");
				show_debug_message(global.data_pos_enemy);
				//player time anim
				show_debug_message("[player time anim]");
				
				//enemy time anim
				show_debug_message("[enemy time anim]");
				
				//player num images
				show_debug_message("[player num images]");
				show_debug_message(global.player_sprite_nums);
				//enemy num images
				show_debug_message("[enemy num images]");
				show_debug_message(global.enemy_sprite_nums);
				//music num
				show_debug_message("[music num]");
				show_debug_message(global.cant_musics);
				//camera notes
				show_debug_message("[camera notes]");
				show_debug_message(global.notas_cam);
				//camera pos
				show_debug_message("[camera pos]");
				show_debug_message(global.points_cam);
				
				show_debug_message("");
				show_debug_message("===============================");
				
				#endregion
			break;
			
			default:
			break;
			
		}
		
	}
	
}