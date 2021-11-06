/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

global.time_delta = delta_time * room_speed * 0.000001;

if keyboard_check_pressed(vk_f11) {
	if (window_get_fullscreen()) {
		window_set_fullscreen(0);
		window_set_size(round(window_get_height() * (16/9)),round(window_get_height()))
		vent_height = window_get_height()
		vent_width = window_get_width()
		display_set_gui_size(vent_width,vent_height)
		window_set_position((display_get_width() - window_get_width()) / 2, window_get_y())
		surface_resize(application_surface,vent_width,vent_height)
	} else {
		window_set_fullscreen(1);
		window_set_size(round(window_get_height() * (16/9)),round(window_get_height()))
		vent_height = window_get_height()
		vent_width = window_get_width()
		display_set_gui_size(vent_width,vent_height)
		window_set_position((display_get_width() - window_get_width()) / 2, window_get_y())
		surface_resize(application_surface,vent_width,vent_height)
	}
	
}

if (keyboard_check_pressed(ord("I"))) {
	show_message("CREADO POR KING! GC (KINGAMESCREATOR)\nLOGO DE MENÚ: NOBAKOU_ART\nSPRITES POR DEFECTO: GreenRetroman y T´K\nTRADUCCION: LISANICOLAS366 (@LNICOLAS365)");
}

if window_has_focus() {
	
	if (vent_height != window_get_height()) {
		
		window_set_size(round(window_get_height() * (16/9)),round(window_get_height()))
		vent_height = window_get_height()
		vent_width = window_get_width()
		display_set_gui_size(vent_width,vent_height)
		window_set_position((display_get_width() - window_get_width()) / 2, window_get_y())
		surface_resize(application_surface,vent_width,vent_height)
	}
	else if (vent_width != window_get_width()) {
		
		window_set_size(round(window_get_width()),round(window_get_width() * (9/16)))
		vent_width = window_get_width()
		vent_height = window_get_height()
		display_set_gui_size(vent_width,vent_height)
		window_set_position((display_get_width() - window_get_width()) / 2, window_get_y())
		surface_resize(application_surface,vent_width,vent_height)
	}
}

if ((room = room_menu_reproductor) or (room = room_menu_options) or (room = room_inicio_play)) {
	if (!audio_is_playing(snd_freakyMenu)) {
		global.music_menu_general = audio_play_sound(snd_freakyMenu,1,1);
	}
	if (audio_is_paused(global.music_menu_general)) {
		audio_resume_sound(global.music_menu_general);
	}
} else if (variable_global_exists("music_menu_general")) and (audio_is_playing(global.music_menu_general)) {
	audio_stop_sound(global.music_menu_general);
}
