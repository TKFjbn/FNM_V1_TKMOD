/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

#region level list

for (var i = 0; i < array_length(proyectos); i++) {
	if (point_in_rectangle(mouse_x,mouse_y,0, 108 * i - base_projects_list,480, 107 + 108 * i - base_projects_list) and (mouse_check_button_released(mb_left))) {
		#region comprobar si el nivel está o no seleccionado.
		var comprobante = false;
		
		for (var p = 0; p < array_length(selected_levels); p++) {
			if (proyectos[i] = selected_levels[p]) {
				comprobante = true;
				break;
			}
		}
		#endregion
		if (!comprobante) {
			selected_levels[array_length(selected_levels)] = proyectos[i];
			break;
		}
	}
}

#region scroll niveles

if (array_length(proyectos) * 108) > 1080 {
	var escala_barra = 1080 / (array_length(proyectos) * 108);
	if (point_in_rectangle(mouse_x,mouse_y,481,base_projects_list * escala_barra,540,(base_projects_list + 1080) * escala_barra)) and (mouse_check_button_pressed(mb_left)) {
		pos_y_ant_bar = base_projects_list;
		pos_y_ant_mouse = mouse_y;
	}
	if (pos_y_ant_bar != -1) {
		base_projects_list = pos_y_ant_bar + (mouse_y - pos_y_ant_mouse) / escala_barra;
		if mouse_check_button_released(mb_left) {
			pos_y_ant_bar = -1;
		}
	}
	var scroll_raton = mouse_wheel_up() - mouse_wheel_down();
	base_projects_list -= scroll_raton * 108;
	if (base_projects_list < 0) {
		base_projects_list = 0;
	}
	if ((base_projects_list + 1080) * escala_barra > 1080) {
		base_projects_list = ((array_length(proyectos) * 108) - 1080)
	}
}

#endregion

#endregion

#region selected list

for (var i = 0; i < array_length(selected_levels); i++) {
	if (point_in_rectangle(mouse_x,mouse_y,1440, 108 * i - base_projects_list2,1920, 107 + 108 * i - base_projects_list2) and (mouse_check_button_released(mb_left))) {
		#region eliminar de la lista
		
		for (var p = i; p < array_length(selected_levels); p++) {
			if (array_length(selected_levels) > (p + 1)) {
				selected_levels[p] = selected_levels[p + 1];
			}
		}
		
		array_resize(selected_levels,array_length(selected_levels) - 1);
		break;
		#endregion
	}
}

#region scroll list

if (array_length(selected_levels) * 108) > 1080 {
	var escala_barra2 = 1080 / (array_length(selected_levels) * 108);
	if (point_in_rectangle(mouse_x,mouse_y,1380,base_projects_list2 * escala_barra2,1440,(base_projects_list2 + 1080) * escala_barra2)) and (mouse_check_button_pressed(mb_left)) {
		pos_y_ant_bar2 = base_projects_list2;
		pos_y_ant_mouse2 = mouse_y;
	}
	if (pos_y_ant_bar2 != -1) {
		base_projects_list2 = pos_y_ant_bar2 + (mouse_y - pos_y_ant_mouse2) / escala_barra2;
		if mouse_check_button_released(mb_left) {
			pos_y_ant_bar2 = -1;
		}
	}
	var scroll_raton2 = mouse_wheel_up() - mouse_wheel_down();
	base_projects_list2 -= scroll_raton2 * 108;
	if (base_projects_list2 < 0) {
		base_projects_list2 = 0;
	}
	if ((base_projects_list2 + 1080) * escala_barra2 > 1080) {
		base_projects_list2 = ((array_length(selected_levels) * 108) - 1080)
	}
}

#endregion

#endregion

if (keyboard_check_pressed(vk_enter) and (!instance_exists(obj_transicion)) and (array_length(selected_levels) > 0)) {
	
	show_message(global.text[35]);
	
	var interrupcion = false;
	#region obtener creditos
	for (var i = 0; i < array_length(selected_levels); i++) {
		if (!file_exists(global.ruta_dest + selected_levels[i] + global.separator + "credits.txt")) {
			show_message(global.text[36] + selected_levels[i] + global.text[37]);
			var ruta_creditos = get_open_filename("Credits (.txt)|*.txt","credits.txt");
			if (ruta_creditos != "") {
				file_copy(ruta_creditos,global.ruta_dest + selected_levels[i] + global.separator + "credits.txt")
			} else {
				interrupcion = true;
				break;
			}
		}
	}
	#endregion
	
	if (!interrupcion) { //ruta exportar
		var directory = get_save_filename("ejecutable|*.zip","");
	}
	
	#region preparar datos
	
	if (directory != "") and (!interrupcion) {
		
		if (string_count(directory,".zip") = 0) {
			directory = directory + ".zip";
		}
		
		window_set_fullscreen(false);
		
		if show_question(global.text[32]) {
			var temp_bg_export = get_open_filename("image png|*.png","");
			if (temp_bg_export != "") {
				file_copy(temp_bg_export,game_save_id + "temp_background.png");
			} else {
				sprite_save(sprite_duplicate(spr_background),0,game_save_id + "temp_background.png");
			}
		} else {
			sprite_save(sprite_duplicate(spr_background),0,game_save_id + "temp_background.png");
		}
		
		if show_question(global.text[33]) {
			var temp_logo_export = get_open_filename("image png|*.png","");
			if (temp_logo_export != "") {
				file_copy(temp_logo_export,game_save_id + "temp_logo.png");
			} else {
				sprite_save(sprite_duplicate(spr_logo),0,game_save_id + "temp_logo.png");
			}
		} else {
			sprite_save(sprite_duplicate(spr_logo),0,game_save_id + "temp_logo.png");
		}
		
		var temp_text = file_text_open_write(game_save_id + "temp.txt");
		
		for (var i = 0; i < array_length(selected_levels); i++) {
			
			file_text_write_string(temp_text,selected_levels[i]);
			if (i < (array_length(selected_levels) - 1)) {
				file_text_writeln(temp_text);
			}
			load_level(selected_levels[i]);
			export_level(game_save_id + string(i) + ".fnm",global.ruta + global.separator + "credits.txt");
			
		}
		file_text_close(temp_text);
		
	}
	
	#endregion
	
	#region exportar
	
	var game_export = zip_create();
	
	zip_add_file(game_export,"datagame" + global.separator + "info.txt",game_save_id + "temp.txt");
	zip_add_file(game_export,"datagame"+ global.separator + "bgm.png",game_save_id + "temp_background.png");
	zip_add_file(game_export,"datagame" + global.separator + "logo.png",game_save_id + "temp_logo.png");
	for (var i = 0; i < array_length(selected_levels); i++) {
		zip_add_file(game_export,"datagame" + global.separator + selected_levels[i] + ".fnm",game_save_id + string(i) + ".fnm");
	}
	zip_add_file(game_export,"data.win",global.ruta_inic + "export_data" + global.separator + "data.win");
	zip_add_file(game_export,"libfilesystem.dll",global.ruta_inic + "export_data" + global.separator + "libfilesystem.dll");
	zip_add_file(game_export,"Player.exe",global.ruta_inic + "export_data" + global.separator + "NightPlayer.exe");
	zip_add_file(game_export,"options.ini",global.ruta_inic + "export_data" + global.separator + "options.ini");
	zip_add_file(game_export,"splash.png",global.ruta_inic + "export_data" + global.separator + "splash.png");
	
	zip_save(game_export,directory);
	
	#endregion
	
	#region limpiar
	
	file_delete(game_save_id + "temp.txt");
	file_delete(game_save_id + "temp_background.png");
	file_delete(game_save_id + "temp_logo.png");
	for (var i = 0; i < array_length(selected_levels); i++) {
		file_delete(game_save_id + string(i) + ".fnm");
	}
	
	#endregion
	
	show_message(global.text[38]);
	
}

if (keyboard_check_pressed(vk_escape)) {
	transition_to(room_menu_inic,30);
}
