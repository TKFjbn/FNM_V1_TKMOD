/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

switch(iniciado) {
	case 0:
		#region iniciar sonido 3 2 1
		if (!instance_exists(obj_transicion)) {
			iniciado = 1;
			iniciando_sound = audio_play_sound(snd_count_start,1,0);
			paso = ((180 / global.speed_notes) - (audio_sound_length(iniciando_sound) - audio_sound_get_track_position(iniciando_sound)) * 60);
		}
		#endregion
	break;
	case 1:
		#region mientras se reproduce el 3 2 1
		if audio_is_playing(iniciando_sound) {
			paso = ((180 / global.speed_notes) - (audio_sound_length(iniciando_sound) - audio_sound_get_track_position(iniciando_sound)) * 60);
		} else if (!instance_exists(obj_transicion)) {
			iniciado = 2;
			music_inic(true);
		}
		#endregion
	break;
	case 2:
		#region durante el nivel
		if (keyboard_check_pressed(vk_enter)) {
			if (!global.pause) {
				instance_create_depth(0,0,-101,obj_menu_options);
				music_pause();
				global.pause = true;
			}
		}
		
		if (audio_is_playing(global.music_play[0])) { //Definir tiempo nivel
			
			paso = (audio_sound_get_track_position(global.music_play[0]) * 60 + (180 / global.speed_notes));
			
		} else if (!instance_exists(obj_transicion)) { //Concluir nivel (Ganar)
			
			if (global.salida = room_menu_selection_level) {
				ini_open("save_data.ini");
				if (global.score_level > ini_read_real("records",global.name,0)) {
					ini_write_real("records",global.name,global.score_level);
				}
			}
			ini_close();
			transition_to(global.salida,10);
			
		}
		#endregion
	break;
}

if (!global.pause) and (iniciado > 0) {
	#region crear notas
	if (nota_siguiente < array_length(notas_creacion)) {//filtro de seguridad
		if ((paso + retraso) >= (notas_creacion[nota_siguiente])) { //si ya se debe crear la nota...
			var nota_creada = instance_create_depth(notas_creacion[nota_siguiente + 1] + (obj_teclas.x - 180),-90 + 1260 * (1 - global.posicion_flechas),0,obj_flechas);
			with(nota_creada) {
				duration = obj_reproductor_notas.notas_creacion[obj_reproductor_notas.nota_siguiente + 2];
				image_index = obj_reproductor_notas.notas_creacion[obj_reproductor_notas.nota_siguiente + 3];
				image_blend = definir_color(image_index);
			}
			nota_siguiente += 4;
		}
	}
	#endregion
	
	//CAMARA
	if (cam_siguiente < array_length(cam_movement)) and (paso >= cam_movement[cam_siguiente]) {
		if (obj_camara.cam_estado != cam_movement[cam_siguiente + 1]) {
			obj_camara.cam_estado = cam_movement[cam_siguiente + 1];
			cam_siguiente += 2;
		} else {
			obj_camara.zoom_camera = true;
			cam_siguiente += 2;
		}
	}
	
	if (global.salida = room_menu_selection_level) and (keyboard_check_pressed(vk_escape)) and (!instance_exists(obj_menu_options)) {
		music_destroy();
		transition_to(global.salida,20);
	}
}

#region perder

if (points_player <= 0) {
	points_player = 0;
	music_destroy();
	transition_to(global.salida,10);
} else if (points_player > 100) {
	points_player = 100;
}

#endregion

#region iconos

anim_icons += global.time_delta * (global.speed_notes / 20);

if (anim_icons >= 60) {
	anim_icons -= 60;
	scale_anim_icons = 1.15;
}

if (scale_anim_icons > 1) {
	scale_anim_icons -= 0.02 * global.time_delta;
	if (scale_anim_icons < 1) {
		scale_anim_icons = 1;
	}
}

#endregion

if (time_mute > 0) {
	time_mute -= global.time_delta;
	if (time_mute <= 0) {
		music_unmute_fail();
		time_mute = 0;
	}
}
