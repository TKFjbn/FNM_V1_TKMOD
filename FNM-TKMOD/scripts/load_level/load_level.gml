// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function load_level(_level_name){
	
	global.name = _level_name;
	global.ruta = global.ruta_dest + _level_name + global.separator;
	var _leer = file_text_open_read(global.ruta + "data.lvl");
	
	#region cargar datos.
		
		global.notes = file_text_read_string(_leer); //notas.
		file_text_readln(_leer);
		global.speed_notes = file_text_read_real(_leer); //velocidad del juego.
		file_text_readln(_leer);
		global.data_pos_player = string_to_array_real(file_text_read_string(_leer),";") //posicion player.
		file_text_readln(_leer);
		global.data_pos_enemy = string_to_array_real(file_text_read_string(_leer),";"); //posicion enemy.
		file_text_readln(_leer);
		
		#region cargar datos velocidad sprite personaje.
		var aux_load = file_text_read_string(_leer);
		var aux_content = "";
		var aux_count = 0;
		var aux_result;
		aux_result[0][0] = 0;
		for (var i = 0; i < string_length(aux_load);i++) {
			if (string_char_at(aux_load,i+1) != ";") {
				aux_content += string_char_at(aux_load,i+1);
			} else {
				aux_result[aux_count][1] = real(aux_content);
				aux_content = "";
				aux_count++;
			}
		}
		global.player_sprites = aux_result;
		file_text_readln(_leer);
		#endregion
		
		#region cargar datos velocidad sprite enemigo.
		var aux_load = file_text_read_string(_leer);
		var aux_content = "";
		var aux_count = 0;
		var aux_result2;
		aux_result[0][0] = 0;
		for (var i = 0; i < string_length(aux_load);i++) {
			if (string_char_at(aux_load,i+1) != ";") {
				aux_content += string_char_at(aux_load,i+1);
			} else {
				aux_result2[aux_count][1] = real(aux_content);
				aux_content = "";
				aux_count++;
			}
		}
		global.enemigo_sprites = aux_result2;
		file_text_readln(_leer);
		#endregion
		
		global.player_sprite_nums = string_to_array_real(file_text_read_string(_leer),";"); //numeros sprites jugador.
		file_text_readln(_leer);
		global.enemy_sprite_nums = string_to_array_real(file_text_read_string(_leer),";"); //numeros sprites enemigo
		file_text_readln(_leer);
		global.cant_musics = file_text_read_real(_leer); //cantidad de musicas.
		file_text_readln(_leer);
		global.notas_cam = file_text_read_string(_leer); //notas de la camara.
		file_text_readln(_leer);
		global.points_cam = string_to_array_real(file_text_read_string(_leer),";"); //posiciones de la camara.
		file_text_close(_leer);
		
	#endregion
	
	#region cargar sprites.
	
	for (var i = 0; i < 9; i++) {
		
		if (i < 5) {
			global.enemigo_sprites[i][0] = sprite_add(global.ruta + "E" + string(i) + ".png",global.enemy_sprite_nums[i],0,1,0,0);
			sprite_set_speed(global.enemigo_sprites[i][0],global.enemigo_sprites[i][1],spritespeed_framespersecond);
		}
		global.player_sprites[i][0] = sprite_add(global.ruta + "P" + string(i) + ".png",global.player_sprite_nums[i],0,1,0,0);
		sprite_set_speed(global.player_sprites[i][0],global.player_sprites[i][1],spritespeed_framespersecond);
	}
	
	global.background = sprite_add(global.ruta + "bg.png",1,0,1,0,0);
	
	#endregion
	
	#region cargar iconos personajes.
	
	if (file_exists(global.ruta + "p_faces.png")) {
		global.face_player = sprite_add(global.ruta + "p_faces.png",3,0,1,0,0);
		global.face_enemy = sprite_add(global.ruta + "e_faces.png",3,0,1,0,0);
	} else {
		global.face_player = sprite_duplicate(spr_player_icons);
		global.face_enemy = sprite_duplicate(spr_enemy_icons);
		sprite_save_strip(global.face_player,global.ruta + "p_faces.png");
		sprite_save_strip(global.face_enemy,global.ruta + "e_faces.png");
	}
	
	sprite_set_offset(global.face_player,sprite_get_width(global.face_player) / 2,sprite_get_height(global.face_player) / 2);
	sprite_set_offset(global.face_enemy,sprite_get_width(global.face_enemy) / 2,sprite_get_height(global.face_enemy) / 2);
	
	#endregion
	
	#region cargar musicas.
	
	global.music_edit = [];
	for (var i = 0; i < global.cant_musics; i++) {
		global.music_edit[i] = audio_create_stream(global.ruta + string(i) + ".ogg");
	}
	
	#endregion
}