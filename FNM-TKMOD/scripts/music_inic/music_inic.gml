
/// @func music_inic(loop)
/// @description start the music.
/// @param {real} loop

function music_inic(){
	global.music_play = [];
	for (var i = 0; i < global.cant_musics; i++) {
		if (argument_count) {
			global.music_play[i] = audio_play_sound(global.music_edit[i],1,0);
		} else {
			global.music_play[i] = audio_play_sound(global.music_edit[i],1,1);
		}
	}
}

function music_pause() {
	for (var i = 0; i < global.cant_musics; i++) {
		audio_pause_sound(global.music_play[i]);
	}
}

function music_resume() {
	for (var i = 0; i < global.cant_musics; i++) {
		audio_resume_sound(global.music_play[i]);
	}
}

function music_destroy() {
	for (var i = 0; i < global.cant_musics; i++) {
		audio_stop_sound(global.music_play[i]);
	}
}

function music_sync() {
	if (global.cant_musics > 1) and (abs(audio_sound_get_track_position(global.music_play[0]) - audio_sound_get_track_position(global.music_play[1])) > 1) {
		for (var i = 1; i < global.cant_musics; i++) {
			audio_sound_set_track_position(global.music_play[i],audio_sound_get_track_position(global.music_play[0]));
		}
	}
}

function music_set_position(_new_position_sound) {
	for (var i = 0; i < global.cant_musics; i++) {
		audio_sound_set_track_position(global.music_play[i],_new_position_sound);
	}
}

function music_mute_fail() {
	if (global.cant_musics > 1) and (obj_reproductor_notas.iniciado = 2) {
		audio_sound_gain(global.music_play[global.cant_musics - 1], 0, 0);
		obj_reproductor_notas.time_mute = 20;
	}
	if (!audio_is_playing(snd_bad_disc)) {
		audio_play_sound(snd_bad_disc,1,0);
	}
}

function music_unmute_fail() {
	if (global.cant_musics > 1) and (obj_reproductor_notas.iniciado = 2) {
		audio_sound_gain(global.music_play[global.cant_musics - 1], 1, 0);
		obj_reproductor_notas.time_mute = 0;
	}
}
