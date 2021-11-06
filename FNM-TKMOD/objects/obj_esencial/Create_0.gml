/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

//Friday Night General Player 

global.game_version = "V1.4.2.2";
global.posicion_flechas = 0;
global.velocidad = 20;
ini_open("save_data.ini");
global.input_default = ini_read_real("settings","input",0);
ini_close();

global.salida = room_creation_menu;

if (instance_number(obj_esencial) > 1) {
	instance_destroy();
}

vent_height = 1;
vent_width = 1;

global.text = [];
sequence_create()
if (os_get_language() = "es") {
	global.text[0] = "Ingresa el nombre del nivel.";
	global.text[1] = "Ingresa la cantidad de músicas (en caso de ser más de una, la última seleccionada debe ser la voz del jugador).";
	global.text[2] = "Ingresa la velocidad del nivel.";
	global.text[3] = "Para exportar, debe seleccionar un archivo de texto con todos los creditos de los participantes en el nivel.";
	global.text[4] = "Ingrese el nombre del nivel a eliminar.";
	global.text[5] = "Este nivel ya existe.";
	global.text[6] = "¿Eliminar TODAS las notas?\nEsta accion eliminará absolutamente todas las notas que ha puesto en este nivel, incluyendo la camara."
	global.text[7] = "Jugar";
	global.text[8] = "Opciones";
	global.text[9] = "Info";
	
	global.text[20] = "Controles";
	global.text[21] = "Flechas bajas";
	global.text[22] = "Pantalla completa";
	global.text[23] = "Volver";
	
	global.text[30] = ": Desactivado";
	global.text[31] = ": Activado";
	global.text[32] = "¿Tiene un fondo de menú personalizado?\n(NO = Usar fondo por defecto)\n(SI = Seleccionar imagen)";
	global.text[33] = "¿Tiene un logo personalizado? (1060 x 640)\n(NO = Usar logo por defecto)\n(SI = Seleccionar imagen)";
	global.text[34] = "Selecciona los niveles\na exportar en el ejecutable.\nEl orden importa.\n\nPosteriormente se le preguntara por un logo y un fondo (opcional).\nENTER: exportar.\nESCAPE: Volver"
	global.text[35] = "Una exportacion de este tipo puede tomar unos minutos, no cierre el programa!\naunque no responda, está trabajando.";
	global.text[36] = "El nivel ";
	global.text[37] = " necesita creditos (.txt)";
	global.text[38] = "¡El proyecto ha sido exportado con exito!"
	
	global.text[50] = "Continuar o Pausar";
	global.text[51] = "Reiniciar";
	global.text[52] = "Cambio";
	global.text[53] = "Guardar";
	global.text[54] = "Exportar";
	global.text[55] = "Eliminar";
	global.text[56] = "Volver al menu";
	global.text[57] = "";
	global.text[58] = "";
	global.text[59] = "";
	
	global.text[60] = "La velocidad debe ser mayor a 5";
} else {
	global.text[0] = "Insert your level's name.";
	global.text[1] = "Put the number of songs (if there's more than one, the player's voice has to be the last one that you selected).";
	global.text[2] = "Put in your level's velocity.";
	global.text[3] = "To export, you have to put a text file with all the credits in the level.";
	global.text[4] = "Put in the name of the level you wanna delete";
	global.text[5] = "That level already exists.";
	global.text[6] = "Delete ALL notes?\nThis action will delete every note that you put in the level, including the camera.";
	global.text[7] = "Play";
	global.text[8] = "Options";
	global.text[9] = "Info";
	
	global.text[20] = "Input";
	global.text[21] = "Downscroll";
	global.text[22] = "Fullscreen";
	global.text[23] = "Back";
	
	global.text[30] = ": Disabled";
	global.text[31] = ": Activated";
	global.text[32] = "Will you use a custom menu background?\n(NO = Use default background)\n(YEAH = Choose image)";
	global.text[33] = "Do you have a custom logo? (1060 x 640)\n(NO = Use default logo)\n(YEP = Choose image)";
	global.text[34] = "Choose the levels to export in the executable.\nOrder applies.\n\nYou will have to choose a logo and a background (optional).\nENTER: Export.\nESCAPE: Go back."
	global.text[35] = "This kinda exportation might take a few minutes, don't close the program!\nEven if it's not responding, it's running.";
	global.text[36] = "The ";
	global.text[37] = " level need credits (.txt).";
	global.text[38] = "Project has been exported successfully!";
	
	global.text[50] = "Play or Pause";
	global.text[51] = "Restart";
	global.text[52] = "Change";
	global.text[53] = "Save";
	global.text[54] = "Export";
	global.text[55] = "Delete";
	global.text[56] = "Go to menu";
	global.text[57] = "";
	global.text[58] = "";
	global.text[59] = "";
	
	global.text[60] = "Velocity should be above 5";
}

switch (os_type) {
	case os_linux:
		global.ruta_inic = program_directory + "/datagame/";
		global.ruta_dest = game_save_id + "weeks/weekdefault/";
		global.separator = "/";
	break;
	case os_android:
		global.ruta_inic = "datagame/";
		global.ruta_dest = game_save_id + "weeks/weekdefault/";
		global.separator = "/";
	break;
	default:
		global.ruta_inic = program_directory + "\\datagame\\";
		global.ruta_dest = game_save_id + "\\Weeks\\WeekDefault\\";
		global.separator = "\\";
	break;
}
