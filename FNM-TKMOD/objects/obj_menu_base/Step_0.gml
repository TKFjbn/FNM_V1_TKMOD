/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if (keyboard_check_pressed(ord("S")) or keyboard_check_pressed(vk_down)) {
	selected += 1;
	audio_play_sound(snd_options,1,0);
}

if (keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up)) {
	selected -= 1;
	audio_play_sound(snd_options,1,0);
}

if (selected < 0) {
	selected = options_number - 1;
} else if (selected >= options_number) {
	selected = 0;
}

#region seleccion

if (keyboard_check_released(vk_enter)) {
	
	switch(selected) {
		
		case 0: //Play
			transition_to(room_menu_selection_level,20);
		break;
		
		case 1: //Options
			transition_to(room_menu_options,20);
		break;
		
		case 2: //Info
			window_set_fullscreen(0);
			url_open("https://kingamescreator.itch.io/friday-night-maker");
		break;
		
	}
	audio_play_sound(snd_selection,1,0);
	
}

#endregion

if (keyboard_check_pressed(vk_escape)) {
	transition_to(room_inicio_play,20);
}

#region movimiento camara

var dest_cam_y = (90 / options_number) * (options_number - selected - 1);

if (camera_get_view_y(view_camera[0]) < dest_cam_y) {
	camera_set_view_pos(view_camera[0],160,camera_get_view_y(view_camera[0]) + 5);
	if (camera_get_view_y(view_camera[0]) > dest_cam_y) {
		camera_set_view_pos(view_camera[0],160,dest_cam_y * selected);
	}
}

if (camera_get_view_y(view_camera[0]) > dest_cam_y) {
	camera_set_view_pos(view_camera[0],160,camera_get_view_y(view_camera[0]) - 5);
	if (camera_get_view_y(view_camera[0]) < dest_cam_y) {
		camera_set_view_pos(view_camera[0],160,dest_cam_y);
	}
}

#endregion
