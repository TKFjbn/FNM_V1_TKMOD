// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function export_level(_ruta_export,_ruta_credits){
	
	var zip_charge = zip_create(0);
	
	zip_add_file(zip_charge,global.name + global.separator + "data.lvl",global.ruta + "data.lvl");
	zip_add_file(zip_charge,global.name + global.separator + "bg.png",global.ruta + "bg.png");
	zip_add_file(zip_charge,global.name + global.separator + "credits.txt",_ruta_credits);
	
	for (var i = 0; i < global.cant_musics; i++) {
		zip_add_file(zip_charge,global.name + global.separator + string(i) + ".ogg",global.ruta + string(i) + ".ogg");
	}
	
	for (var i = 0; i < 9; i++) {
		
		if (i < 5) {
			zip_add_file(zip_charge,global.name + global.separator + "E" +string(i) + ".png",global.ruta + "E" +string(i) + ".png");
		}
		
		zip_add_file(zip_charge,global.name + global.separator + "P" +string(i) + ".png",global.ruta + "P" +string(i) + ".png");
		
	}
	
	zip_add_file(zip_charge,global.name + global.separator + "e_faces.png",global.ruta + "e_faces.png");
	zip_add_file(zip_charge,global.name + global.separator + "p_faces.png",global.ruta + "p_faces.png");
	
	zip_save(zip_charge,_ruta_export);
	
	zip_destroy(zip_charge);
	
}