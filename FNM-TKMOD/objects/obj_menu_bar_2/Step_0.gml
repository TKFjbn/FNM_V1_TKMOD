/// @description Inserte aquí la descripción
// Puede escribir su código en este editor





for (var i = 0; i < sprite_get_number(sprite_index);i++) {
	
	/*seleccion de opcion del menu al hacer click encima del icono
	
	MOD: 
	-cambiar velocidad de las notas dentro del editor
	
	
	*/
	
	
	
	if (mouse_check_button_pressed(mb_left) and (point_in_rectangle(mouse_x,mouse_y,1830,90 * i,1920,89 + 90*i))) {
		
		//opciones del menu
		switch(i) {
			
			case 0: //cambiar velocidad de las notas
				
				#region
				//mensaje emjergente para cambiar la velocidad de las notas
				var _speed_level = round(get_integer(global.text[2],global.speed_notes));
				if(_speed_level = 0 or _speed_level < 5){
					_speed_level = global.speed_notes;
				}else{
					global.speed_notes = _speed_level;
				}

				#endregion
				
			break;
			
			case 1: //editar descripcion
			
				
				show_debug_message("cambio descripcion");
				
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
			
				#region
				
				/*Ejecuta una funcion que utiliza el CMD de windows,
				llama la ruta raiz del nivel para luego abrir su fichero.
				*/
				execute_shell_simple(global.ruta,"","open",5);
				
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