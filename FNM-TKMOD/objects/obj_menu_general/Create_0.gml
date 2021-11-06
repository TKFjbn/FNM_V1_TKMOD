/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

#region load levels

proyectos = [];
var carpeta_proyecto = file_find_first(global.ruta_dest + "*",0);
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
