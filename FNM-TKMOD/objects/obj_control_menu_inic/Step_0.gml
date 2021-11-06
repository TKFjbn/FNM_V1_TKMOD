/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

for (var i = 0; i < array_length(proyectos); i++) {
	if (point_in_rectangle(mouse_x,mouse_y,0, 108 * i - base_projects_list,480, 107 + 108 * i - base_projects_list) and (mouse_check_button_released(mb_left))) {
		load_level(proyectos[i]);
		var window_screen = window_get_fullscreen();
		window_set_fullscreen(false);
		show_message(get_credits());
		window_set_fullscreen(window_screen);
		transition_to(room_creation_menu,30);
	}
	if (point_in_rectangle(mouse_x,mouse_y,0, 108 * i - base_projects_list,480, 107 + 108 * i - base_projects_list) and (mouse_check_button_released(mb_right))) {
		load_level(proyectos[i]);
		var window_screen = window_get_fullscreen();
		window_set_fullscreen(false);
		show_message(get_credits());
		window_set_fullscreen(window_screen);
		transition_to(room_gameplay,30);
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

if (keyboard_check_pressed(vk_f5)) {
	transition_to(room_menu_export,40);
}
