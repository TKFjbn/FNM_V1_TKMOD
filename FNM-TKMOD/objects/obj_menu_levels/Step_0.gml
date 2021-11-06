/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if (keyboard_check_pressed(ord("S")) or keyboard_check_pressed(vk_down)) {
	global.levelselected += 1;
	audio_play_sound(snd_options,1,0);
}

if (keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up)) {
	global.levelselected -= 1;
	audio_play_sound(snd_options,1,0);
}

if (global.levelselected < 0) {
	global.levelselected = options_number - 1;
} else if (global.levelselected >= options_number) {
	global.levelselected = 0;
}

if (global.levelselected != transition) {
	transition += sign(global.levelselected - transition) * 0.2;
}

#region seleccion

if (keyboard_check_released(vk_enter)) {
	global.salida = room;
	load_level(global.name_list[global.levelselected]);
	audio_stop_all();
	audio_destroy_stream(music_play_demo);
	audio_play_sound(snd_selection,1,0);
	transition_to(room_gameplay,40);
}

#endregion

if (keyboard_check_pressed(vk_escape)) {
	audio_stop_all();
	audio_destroy_stream(music_play_demo);
	transition_to(room_menu_reproductor,20);
}

if (global.levelselected != ant_selection) and (!instance_exists(obj_transicion)) {
	ant_selection = global.levelselected;
	var temp_path = global.ruta_dest + global.name_list[global.levelselected] + "/";
	if (audio_is_playing(music_playing_demo)) {
		audio_stop_sound(music_playing_demo);
	}
	music_play_demo = audio_create_stream(temp_path + "0.ogg");
	music_playing_demo = audio_play_sound(music_play_demo,0,1);
}
