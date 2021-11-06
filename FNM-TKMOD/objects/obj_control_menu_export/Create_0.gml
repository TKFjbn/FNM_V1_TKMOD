/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

#region load list of levels

proyectos = [];
var carpeta_proyecto = file_find_first(global.ruta_dest + "*",fa_directory);
var contador = 0;

if (carpeta_proyecto != "") {
	do {
		proyectos[contador] = carpeta_proyecto;
		contador++;
		carpeta_proyecto = file_find_next();
	} until (carpeta_proyecto = "")
}

file_find_close();

#endregion

base_projects_list = 0;
pos_y_ant_mouse = 0;
pos_y_ant_bar = -1;

selected_levels = [];
base_projects_list2 = 0;
pos_y_ant_mouse2 = 0;
pos_y_ant_bar2 = -1;
