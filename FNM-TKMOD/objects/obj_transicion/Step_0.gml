/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if (room = room_dest) {
	trans -= 1 / veloc_trans * global.time_delta;
	if (trans <= 0) {
		instance_destroy();
	}
} else {
	trans += 1 / veloc_trans * global.time_delta;
	if (trans >= 1) {
		trans = 1;
		if (room = room_creation_add_skins) {
			for (var i = 0; i < 9; i++) {
				if (i < 5) {
					sprite_set_offset(global.enemigo_sprites[i][0],0,0);
				}
				sprite_set_offset(global.player_sprites[i][0],0,0);
			}
		}
		room_goto(room_dest);
	}
}
