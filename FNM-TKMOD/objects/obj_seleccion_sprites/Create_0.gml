/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

numero = 0;
sprite_actual = 0;
numero_max = 4 + global.edit_sprite_type * 4;

datos_enviados = false;

//cargar imagen inicial

if (global.edit_sprite_type) {
		
	sprite_index = global.player_sprites[numero][0];
	
} else {
	
	sprite_index = global.enemigo_sprites[numero][0];
	
}

set_auto_scale();
//centrar imagen
sprite_set_offset(sprite_index,sprite_get_width(sprite_index)/2,sprite_get_height(sprite_index)/2);
x = room_width / 2;
y = room_height / 2;
