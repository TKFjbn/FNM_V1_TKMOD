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

if (selected != transition) {
	
	transition += sign(selected - transition) * 0.2
	
}

#region seleccion

if (keyboard_check_pressed(vk_enter)) {
	switch (selected) {
		
		case 0: //input
			ini_open("save_data.ini");
			if (global.input_default = 0) {
				global.input_default = 1;
				ini_write_real("settings","input",1);
			} else {
				global.input_default = 0;
				ini_write_real("settings","input",0);
			}
			ini_close();
		break;
		
		case 1: //downscroll
			if (global.posicion_flechas = 0) {
				global.posicion_flechas = 1;
			} else {
				global.posicion_flechas = 0;
			}
			if (room != room_menu_options) {
				music_destroy();
				room_restart();
			}
		break;
		
		case 2: //fullscreen
			if window_get_fullscreen() {
				window_set_fullscreen(false);
			} else {
				window_set_fullscreen(true);
			}
		break;
		case 3: //BACK
			
			if (room = room_menu_options) {
				transition_to(room_menu_reproductor,20);
			} else {
				global.pause = false;
				music_resume();
				instance_destroy();
			}
		break;
		
	}
	audio_play_sound(snd_selection,1,0);
}

#endregion

if (keyboard_check_pressed(vk_escape) and (room = room_menu_options)) {
	transition_to(room_menu_reproductor,20);
}
