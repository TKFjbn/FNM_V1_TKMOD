/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

var i_d = ds_map_find_value(async_load, "id");

if  (datos_enviados = true) and (i_d == sprite_number) {
	
	if ds_map_find_value(async_load, "status") {
		
		sprite_index = sprite_add(sprite_cargar,ds_map_find_value(async_load, "value"),0,1,0,0);
		set_auto_scale();
		sprite_set_offset(sprite_index,sprite_get_width(sprite_index)/2,sprite_get_height(sprite_index)/2);
		datos_enviados = false;
		if (!global.edit_sprite_type) {
			global.enemigo_sprites[numero][0] = sprite_index;
			sprite_set_speed(sprite_index,global.enemigo_sprites[numero][1],spritespeed_framespersecond);
		} else {
			global.player_sprites[numero][0] = sprite_index;
			sprite_set_speed(sprite_index,global.player_sprites[numero][1],spritespeed_framespersecond);
		}
		
	}
	
}
