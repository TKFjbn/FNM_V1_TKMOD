/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

window_set_cursor(cr_none)

general = false;

#region install levels

#region scan levels install
var proyectos_install = [];
var carpeta_proyecto = file_find_first(global.ruta_inic + "*.fnm",0);
var contador = 0;

if (carpeta_proyecto != "") {
	do {
		proyectos_install[contador] = carpeta_proyecto;
		contador++;
		carpeta_proyecto = file_find_next()
	} until (carpeta_proyecto = "")
}

file_find_close();

#endregion

for (var i = 0; i < array_length(proyectos_install);i++) {
	zip_unzip(global.ruta_inic + proyectos_install[i],global.ruta_dest)
	file_delete(global.ruta_inic + proyectos_install[i])
}

#endregion

if (!general) {
#region cargar nombres niveles

global.name_list = [];

var aux_count = 0;

var temp_archive = file_text_open_read(global.ruta_inic + "info.txt");
global.background_menu = sprite_add(global.ruta_inic + "bgm.png",1,0,1,0,0);
global.sprite_logo = sprite_add(global.ruta_inic + "logo.png",1,0,1,0,0);

sprite_set_offset(global.sprite_logo,sprite_get_width(global.sprite_logo) / 2,sprite_get_height(global.sprite_logo) / 2);

do {
	global.name_list[aux_count] = file_text_read_string(temp_archive);
	aux_count ++;
	file_text_readln(temp_archive);
} until (file_text_eof(temp_archive));

file_text_close(temp_archive);

#endregion
} else {
#region cargar nombre niveles General Player

global.name_list = [];
var carpeta_proyecto = file_find_first(global.ruta_dest + "*",fa_directory);
var contador = 0;

if (carpeta_proyecto != "") {
	do {
		global.name_list[contador] = carpeta_proyecto;
		contador++;
		carpeta_proyecto = file_find_next()
	} until (carpeta_proyecto = "")
}

file_find_close();

global.sprite_logo = spr_logo;
global.background_menu = spr_background;

#endregion
}

var capa_id = layer_background_get_id("Background");
layer_background_sprite(capa_id,global.background_menu);

//global.name_list = ["Ho","parish","Superiority","vs monocrom","juvs masses","contenta","contrapunto humano vs computadora"];

//global.music_menu_general = audio_play_sound(snd_freakyMenu,1,1);
