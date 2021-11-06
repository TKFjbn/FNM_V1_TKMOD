/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

#region cargar nivel

#region teclas

if (global.notes != "") {
	
	var array_temp = string_to_array_real(global.notes,";");
	
	for (var i = 0; i < array_length(array_temp); i+=4) {
		with (instance_create_depth(array_temp[1 + i], (array_temp[i] * global.speed_notes) + y,0,obj_flecha_editor)) {
			image_index = array_temp[3 + i];
			estado = 0;
			duracion_nota = array_temp[2 + i];
			y_aument = array_temp[i] * global.speed_notes;
		}
	}
	
}

#endregion

#region camaras

if (global.notas_cam != "") {
	
	var array_temp = string_to_array_real(global.notas_cam,";");
	
	var aux_pos_cam = -1;
	
	for (var i = 0; i < array_length(array_temp); i+=2) {
		with (instance_create_depth(870 + 90 * array_temp[1 + i], (array_temp[i] * global.speed_notes) + y,0,obj_flecha_camara)) {
			image_index = array_temp[1 + i];
			estado = 0;
			y_aument = array_temp[i] * global.speed_notes;
			
			type_camera = (aux_pos_cam == array_temp[1 + i])
			
			if (!type_camera) {
				aux_pos_cam = array_temp[1 + i];
			} else {
				sprite_index = spr_camara_zoom;
			}
			
		}
	}
	
}

#endregion

#endregion

depth = -1;

music_inic(); //comienza a reproducir la música.

edit = 0; //si editar manualmente el enemigo o el jugador

//scroll
tamano = audio_sound_length(global.music_edit[0]) * global.speed_notes * 60;
aux = 1080 / tamano;
scroll = false;
point_y_ant = mouse_y;
point_y_ant_me = y;

notas_general[0] = "";

for (var i = 0; i < 4; i++) {
	creation[i] = -1;
}

camaras = [];

global.ult_cam_position = noone;

button_select = "";
