/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
global.sprite_logo = spr_logo;

#region install levels

#region scan levels install

var proyectos_install = [];
var carpeta_proyecto = file_find_first(global.ruta_inic + "*.fnm",0);
var contador = 0;
if (carpeta_proyecto != "") {
	do {
		proyectos_install[contador] = carpeta_proyecto;
		contador++;
		carpeta_proyecto = file_find_next();
	} until (carpeta_proyecto = "")
}

file_find_close();

#endregion

if (array_length(proyectos_install) > 0) and ((os_type = os_android) or show_question("¿Install default levels?")) {
	show_debug_message("EJECUTA1")
	for (var i = 0; i < array_length(proyectos_install);i++) {
		zip_unzip(global.ruta_inic + proyectos_install[i],global.ruta_dest);
		//directory_create(global.ruta_dest + string(proyectos_install[i]));
		file_delete(global.ruta_inic + proyectos_install[i]);
	}

} else if (array_length(proyectos_install) > 0) {
	for (var i = 0; i < array_length(proyectos_install);i++) {
		file_delete(global.ruta_inic + proyectos_install[i]);
	}
}

#endregion

#region load list of levels

proyectos = [];
var carpeta_proyecto = file_find_first(global.ruta_dest + "*",fa_directory);
var contador = 0;

if (carpeta_proyecto != "") {
	do {
		proyectos[contador] = carpeta_proyecto;
		contador++;
		carpeta_proyecto = file_find_next()
	} until (carpeta_proyecto = "")
}

file_find_close();

#endregion

base_projects_list = 0;
pos_y_ant_mouse = 0;
pos_y_ant_bar = -1;
