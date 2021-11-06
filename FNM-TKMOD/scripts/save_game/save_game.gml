// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información

function save_game(_sprites){
	
	if (_sprites) {
		#region sprites
		
		for (var i = 0; i < 9; i++) {
			
			if (i < 5) {
				sprite_save_strip(global.enemigo_sprites[i][0],global.ruta + ("E" + string(i) + ".png"));
			}
			sprite_save_strip(global.player_sprites[i][0],global.ruta + ("P" + string(i) + ".png"));
			
		}
		
		sprite_save_strip(global.face_player,global.ruta + "p_faces.ong");
		sprite_save_strip(global.face_enemy,global.ruta + "e_faces.ong");
		
		#endregion
	}
	
	#region data.lvl
		
		var _save_temp_file =  file_text_open_write(global.ruta + "data.lvl");
		
		#region notas y veloc
		
		file_text_write_string(_save_temp_file,global.notes);
		file_text_writeln(_save_temp_file);
		file_text_write_real(_save_temp_file,global.speed_notes);
		file_text_writeln(_save_temp_file);
		
		#endregion
		
		#region sprites position y scale
		
		var _save_string = "";
		var _save_string2 = "";
		
		for (var i = 0; i < 4; i++) {
			
			_save_string += string(global.data_pos_player[i]) + ";";
			_save_string2 += string(global.data_pos_enemy[i]) + ";";
			
		}
		
		file_text_write_string(_save_temp_file,_save_string);
		file_text_writeln(_save_temp_file);
		file_text_write_string(_save_temp_file,_save_string2);
		file_text_writeln(_save_temp_file);
		
		#endregion
		
		#region sprite speed animation
		
		var _save_string = "";
		var _save_string2 = "";
		
		for (var i = 0; i < 9; i++) {
			
			_save_string += string(global.player_sprites[i][1]) + ";";
			if (i < 5) {
				_save_string2 += string(global.enemigo_sprites[i][1]) + ";";
			}
			
		}
		
		file_text_write_string(_save_temp_file,_save_string);
		file_text_writeln(_save_temp_file);
		file_text_write_string(_save_temp_file,_save_string2);
		file_text_writeln(_save_temp_file);
		
		#endregion
		
		#region cantidad de imagenes en sprites.
		
		var _save_string = "";
		var _save_string2 = "";
		
		for (var i = 0; i < 9;i++) {
			
			if (i < 5) {
				_save_string2 += string(sprite_get_number(global.enemigo_sprites[i][0])) + ";"
			}
			
			_save_string += string(sprite_get_number(global.player_sprites[i][0])) + ";"
			
		}
		
		file_text_write_string(_save_temp_file,_save_string);
		file_text_writeln(_save_temp_file);
		file_text_write_string(_save_temp_file,_save_string2);
		file_text_writeln(_save_temp_file);
		file_text_write_real(_save_temp_file,global.cant_musics)
		file_text_writeln(_save_temp_file);
		
		#endregion
		
		#region camaras
			
			file_text_write_string(_save_temp_file,global.notas_cam);
			file_text_writeln(_save_temp_file);
			var text_save = "";
			for (var i = 0; i < 6; i++) {
				text_save += string(global.points_cam[i]) + ";"
			}
			file_text_write_string(_save_temp_file,text_save);
			
		#endregion
		
		file_text_close(_save_temp_file);
		
	#endregion
	
}
