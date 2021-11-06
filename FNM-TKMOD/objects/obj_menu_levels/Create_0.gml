/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if (!variable_global_exists("levelselected")) {
	global.levelselected = 0; //LevelSelected
}

transition = -5;

options_number = array_length(global.name_list); //Level List.

credits_level = [];
ini_open("save_data.ini")
for (var i = 0; i < options_number; i++) {
	credits_level[i] = string_upper(get_credits_name(global.name_list[i]));
	credits_level[i] += "\nPersonal best: " + string(ini_read_real("records",global.name_list[i],0));
}
ini_close();

ant_selection = -1;
music_play_demo = 0;
music_playing_demo = 0;

var capa_id = layer_background_get_id("Background");
layer_background_sprite(capa_id,global.background_menu);
