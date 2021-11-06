
/// @func create_level(name, speed, music1, music2, music3)
/// @description Create a level with the data.
/// @param {string} name The level name.
/// @param {real} speed The level speed.
/// @param {real} music1 The first music to the level.

function create_level(){
	
	var _temp_ruta = global.ruta_dest + argument0 + "/";
	var _cant_musics = argument_count - 2;
	
	#region crear archivo de datos.
	
	var _escribir = file_text_open_write(_temp_ruta + "data.lvl");
	
	
	file_text_writeln(_escribir); //dejar espacio de notas vacio.
	file_text_write_real(_escribir,argument1); //velocidad.
	file_text_writeln(_escribir);
	file_text_write_string(_escribir,"1.11;1.11;1024;360;"); //player datos skin.
	file_text_writeln(_escribir);
	file_text_write_string(_escribir,"1.18;1.18;356;352;"); //Enemy datos skin.
	file_text_writeln(_escribir);
	file_text_write_string(_escribir,"10;15;10;15;10;15;15;15;15;"); //Player datos tiempo anim.
	file_text_writeln(_escribir);
	file_text_write_string(_escribir,"10;15;10;15;10;"); //Enemy datos tiempo anim.
	file_text_writeln(_escribir);
	file_text_write_string(_escribir,"8;2;2;2;2;2;2;2;2;"); //player datos num images.
	file_text_writeln(_escribir);
	file_text_write_string(_escribir,"8;2;2;2;2;"); //Enemy datos num images.
	file_text_writeln(_escribir);
	file_text_write_real(_escribir,_cant_musics); //cantidad de musica
	file_text_writeln(_escribir);
	file_text_writeln(_escribir); //dejar espacio vacio para las notas de la camara.
	file_text_write_string(_escribir,"723;614;956;528;1198;615;"); //posiciones de la camara.
	file_text_close(_escribir);
	
	#endregion
	
	#region cargar músicas
	
	for (var i = 0; i < _cant_musics; i++) {
		file_copy(argument[2 + i],game_save_id + "weeks/weekdefault/" + argument0 + "/" + string(i) + ".ogg");
	}
	
	#endregion
	
	#region CREAR SPRITES.
	
	var sprites_save = [];
	sprites_save[0] = sprite_duplicate(spr_base);
	sprites_save[1] = sprite_duplicate(spr_base_izq);
	sprites_save[2] = sprite_duplicate(spr_base_down);
	sprites_save[3] = sprite_duplicate(spr_base_up);
	sprites_save[4] = sprite_duplicate(spr_base_der);
	
	var sprites_save2 = [];
	sprites_save2[0] = sprite_duplicate(spr_base_p);
	sprites_save2[1] = sprite_duplicate(spr_base_izq_p);
	sprites_save2[2] = sprite_duplicate(spr_base_down_p);
	sprites_save2[3] = sprite_duplicate(spr_base_up_p);
	sprites_save2[4] = sprite_duplicate(spr_base_der_p);
	sprites_save2[5] = sprite_duplicate(spr_player_fall);
	sprites_save2[6] = sprite_duplicate(spr_player_fall);
	sprites_save2[7] = sprite_duplicate(spr_player_fall);
	sprites_save2[8] = sprite_duplicate(spr_player_fall);
	
	for (var i = 0; i < 9; i++) {
		
		if (i < 5) {
			sprite_save_strip(sprites_save[i],_temp_ruta + ("E" + string(i) + ".png"));
			sprite_delete(sprites_save[i]);
		}
		sprite_save_strip(sprites_save2[i],_temp_ruta + ("P" + string(i) + ".png"));
		sprite_delete(sprites_save2[i]);
		
	}
	
	var _save_bg = sprite_duplicate(spr_fondo_provisional);
	sprite_save(_save_bg,0,_temp_ruta + "bg.png");
	sprite_delete(_save_bg);
	
	#endregion
	
}