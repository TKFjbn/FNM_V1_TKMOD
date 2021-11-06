/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

var _escala_draw = display_get_gui_width() / 1920;
var posicion_musica_base = audio_sound_get_track_position(global.music_play[0]);
var real_x = window_mouse_get_x() / _escala_draw;
var real_y = window_mouse_get_y() / _escala_draw;

music_sync();

#region poner notas
	
	#region notas musicales
		
		#region por ratón
		if (mouse_check_button_pressed(mb_left) and (!collision_point(window_mouse_get_x() / _escala_draw,window_mouse_get_y() / _escala_draw,obj_flecha_editor,1,0)) and (!keyboard_check(vk_shift))) {
		
			for(var i = 0; i < 4; i++) {
				if (point_in_rectangle(window_mouse_get_x() / _escala_draw,window_mouse_get_y() / _escala_draw,x-90 + (180 * i),0,x+90 + (180 * i),1080)) {
					with (instance_create_depth(x + 180 * i, window_mouse_get_y() / _escala_draw,0,obj_flecha_editor)) {
						image_index = i;
						estado = 1;
						y_aument = y - obj_control_editor.y;
					}
				}
			}
		
			for(var i = 0; i < 4; i++) {
				if (point_in_rectangle(window_mouse_get_x() / _escala_draw,window_mouse_get_y() / _escala_draw,1200-90 + (180 * i),0,1200+90 + (180 * i),1080)) {
					with (instance_create_depth(1200 + 180 * i, window_mouse_get_y() / _escala_draw,0,obj_flecha_editor)) {
						image_index = i;
						estado = 1;
						y_aument = y - obj_control_editor.y;
					}
				}
			}
		
		}
		#endregion
		
		#region por teclas
	
		#region tecnicismos
	
		var buttons_check = [];
		buttons_check[0] = (keyboard_check(ord("F")) or keyboard_check(vk_left) or keyboard_check(ord("A")));
		buttons_check[1] = (keyboard_check(vk_down) or keyboard_check(ord("S")));
		buttons_check[2] = (keyboard_check(vk_up) or keyboard_check(ord("W")));
		buttons_check[3] = (keyboard_check(vk_right) or keyboard_check(ord("D")));
		#endregion
	
		#region flechas
	
		if (!keyboard_check(vk_shift)) {
	
			for (var i = 0; i < 4; i++) {
			
				#region crear nota
		
				if (buttons_check[i]) {
					if (creation[i] = -1) {
				
						creation[i] = instance_create_depth((180 * edit) + (1200 * (1 - edit)) + 180 * i, 200,0,obj_flecha_editor);
						with (creation[i]) {
							y_aument = y - obj_control_editor.y;
							y_ant = 120 - obj_control_editor.y;
							image_index = i;
						}
				
					}
				}
		
				#endregion
			
				#region duracion
		
				if (creation[i] != -1) {
			
					if (buttons_check[i]) {
						with (creation[i]) {
							if ((120 - obj_control_editor.y) > y_ant) {
								duracion_nota = ((120 - obj_control_editor.y ) - y_ant) / global.speed_notes;
							} else {
								duracion_nota = 0;
							}
						}
					} else {
						with (creation[i]) {
							if (duracion_nota < 15) {
								duracion_nota = 0;
							}
							obj_control_editor.notas_general[identification] = string(y_aument / global.speed_notes) + ";" + string(x) + ";" + string(duracion_nota) + ";" + string(image_index) + ";";
						}
						creation[i] = -1;
					}
			
				}
		
				#endregion
			
			}
	
		}
		#endregion
	
		#endregion
		
	#endregion
	
	#region notas de la camara
		
		#region por ratón
		if (mouse_check_button_pressed(mb_left)) {
		
			for(var i = 0; i < 3; i++) {
				if (point_in_rectangle(real_x,real_y,825 + (90 * i),0,915 + (90 * i),1080)) {
					with (instance_create_depth(870 + 90 * i,real_y,0,obj_flecha_camara)) {
						image_index = i;
						estado = 1;
						y_aument = y - obj_control_editor.y;
						
						var ant_cam = get_ant_camera();
						
						if (instance_exists(ant_cam)) {
							type_camera = (get_ant_camera().image_index == i);
						} else {
							type_camera = 0;
						}
						
						if (type_camera) {
							sprite_index = spr_camara_zoom;
						}
					}
				}
			}
		
		}
		#endregion
		
		#region por teclas
	
		#region tecnicismos
	
		var buttons_check = [];
		buttons_check[0] = (keyboard_check_pressed(ord("E")));
		buttons_check[1] = (keyboard_check_pressed(ord("R")));
		buttons_check[2] = (keyboard_check_pressed(ord("T")));
	
		#endregion
	
		#region flechas
	
		for (var i = 0; i < 3; i++) {
			#region crear nota
	
			if (buttons_check[i]) {
				with (instance_create_depth(870 + 90 * i, 180,0,obj_flecha_camara)) {
					y_aument = y - obj_control_editor.y;
					image_index = i;
					var ant_cam = get_ant_camera();
					
					if (instance_exists(ant_cam)) {
						type_camera = (get_ant_camera().image_index == i);
					} else {
						type_camera = 0;
					}
					
					if (type_camera) {
						sprite_index = spr_camara_zoom;
					}
				}
			}
	
			#endregion
		}
	
		#endregion
	
		#endregion
		
	#endregion
	
#endregion

 #region movimiento musica

y = (-posicion_musica_base*60) * global.speed_notes;

#endregion

#region scroll

#region barra

if (point_in_rectangle(window_mouse_get_x() / _escala_draw,window_mouse_get_y() / _escala_draw,1860,-y*aux,1920,(-y+1080) * aux)) and (mouse_check_button_pressed(mb_left)) {
	scroll = true;
	point_y_ant = window_mouse_get_y() / _escala_draw;
	point_y_ant_me = y;
}

if (scroll = true) {
	if (!mouse_check_button(mb_left)) {
		scroll = false;
	} else {
		music_set_position((-point_y_ant_me + (window_mouse_get_y() / _escala_draw-point_y_ant) / aux) / global.speed_notes / 60);
	}
}

#endregion

#region scroll raton

if (mouse_wheel_up()) {
	
	var new_pos_aud = max(0,posicion_musica_base - 0.5);
	
	music_set_position(new_pos_aud);
	
} else if (mouse_wheel_down()) {
	
	if ((posicion_musica_base + 0.5) < audio_sound_length(global.music_edit[0])) {
		var new_pos_aud = posicion_musica_base + 0.5;
		music_set_position(new_pos_aud);
	} else {
		music_set_position(0);
	}
	
}

#endregion

#endregion

#region botones izquierda

var tam_botones = 1080 / (sprite_get_number(spr_botones) - 1);

for (var i = 0; i < (sprite_get_number(spr_botones) - 1); i++) {
	
	if (point_in_rectangle(window_mouse_get_x() / _escala_draw,window_mouse_get_y() / _escala_draw,0,i * tam_botones,60,(i+1) * tam_botones) and mouse_check_button_released(mb_left)) {
		
		switch(i) {
			
			case 0:
				#region reproducir-pausar
				
				if (audio_is_paused(global.music_play[0])) {
					music_resume();
				} else {
					music_pause();
				}
				
				#endregion
			break;
			
			case 1:
				music_set_position(0); //Inicio de la música
			break;
			
			case 2:
				if (edit = 0) { edit = 1; } else { edit = 0; }
			break;
			
			case 3: //guardar
				music_pause();
				#region save
				
				#region notas
					global.notes = "";
					
					orden_prioritario = ds_priority_create();
					
					with (obj_flecha_editor) {
						ds_priority_add(obj_control_editor.orden_prioritario,identification,y_aument);
					}
					
					repeat (ds_priority_size(orden_prioritario)) {
						global.notes += notas_general[ds_priority_delete_min(orden_prioritario)];
					}
					
					ds_priority_destroy(orden_prioritario);
				#endregion
				
				#region camara
				global.notas_cam = "";
				
				orden_prioritario = ds_priority_create();
				
				with (obj_flecha_camara) {
					ds_priority_add(obj_control_editor.orden_prioritario,identificator,y_aument);
				}
				
				repeat (ds_priority_size(orden_prioritario)) {
					global.notas_cam += camaras[ds_priority_delete_min(orden_prioritario)];
				}
				
				ds_priority_destroy(orden_prioritario);
				#endregion
				
				save_game(false);
				#endregion
			break;
			
			case 4:
				
				#region export
				
				if (!file_exists(global.ruta + "credits.txt")) {
					show_message(global.text[3]); //mensaje exportar.
					var _creditos = get_open_filename("text file|*.txt",global.name + "-credits.txt");
				} else {
					var _creditos = global.ruta + global.separator + "credits.txt";
				}
				
				if (_creditos != "") {
					var _direccion_guardado = get_save_filename("level|*.fnm",global.name + ".fnm");
					
					if (_direccion_guardado != "") {
						music_pause();
						export_level(_direccion_guardado,_creditos);
					}
				}
				
				#endregion
				
			break;
			
			case 5:
				
				#region BORRAR
				
				music_pause();
				if (show_question(global.text[6])) {
					instance_destroy(obj_flecha_editor);
					instance_destroy(obj_flecha_camara);
					array_resize(notas_general,1);
					array_resize(camaras,1);
					notas_general[0] = "";
					camaras = [];
					global.ult_cam_position = noone;
				}
				
				#endregion
				
			break;
			
			case 6:
				
				#region salir
				
				music_destroy();
				
				global.notes = "";
				
				orden_prioritario = ds_priority_create();
				
				with (obj_flecha_editor) {
					ds_priority_add(obj_control_editor.orden_prioritario,identification,y_aument);
				}
				
				repeat (ds_priority_size(orden_prioritario)) {
					global.notes += notas_general[ds_priority_delete_min(orden_prioritario)];
				}
				
				ds_priority_destroy(orden_prioritario);
				
				#region camara
				global.notas_cam = "";
				
				orden_prioritario = ds_priority_create();
				
				with (obj_flecha_camara) {
					ds_priority_add(obj_control_editor.orden_prioritario,identificator,y_aument);
				}
				
				repeat (ds_priority_size(orden_prioritario)) {
					global.notas_cam += camaras[ds_priority_delete_min(orden_prioritario)];
				}
				
				ds_priority_destroy(orden_prioritario);
				#endregion
				
				save_game(false);
				transition_to(room_creation_menu,10);
				
				#endregion
				
			break;
			
		}
		
	}
	
}

#endregion

#region atajos de teclado

if (keyboard_check_pressed(vk_space)) { //pausar o reanudar.
	if (audio_is_paused(global.music_play[0])) {
		music_resume();
	} else {
		music_pause();
	}
}

if (keyboard_check_pressed(ord("C"))) { //intercambio de personaje
	if (edit = 0) { edit = 1; } else { edit = 0; }
}

#endregion
