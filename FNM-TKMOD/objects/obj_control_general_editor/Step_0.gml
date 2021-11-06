/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if (keyboard_check_pressed(vk_escape)) {
	audio_stop_all();
	var save_sprites_yes_or_no = (room == room_creation_add_skins);
	save_game(save_sprites_yes_or_no);
	if (room != room_creation_menu) {
		transition_to(room_creation_menu,20);
	} else {
		transition_to(room_menu_inic,20);
		instance_destroy();
	}
}
