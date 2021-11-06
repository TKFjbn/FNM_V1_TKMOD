/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

#region intercambio de sprite

if (point_in_rectangle(mouse_x,mouse_y,x-300,y-300,x+300,y+300)) {
	
	if (mouse_check_button_released(mb_right)) {
		
		sprite_cargar = get_open_filename("SpriteSheet|*.png|Animated gif|*.gif","");
		
		if (sprite_cargar != "") {
			
			if (filename_ext(sprite_cargar) = ".gif") {
				
				var _temp_var = sprite_add_gif(sprite_cargar,0,0);
				sprite_save_strip(_temp_var, string(global.edit_sprite_type) + "-" + string(numero) + ".png");
				sprite_index = sprite_add(string(global.edit_sprite_type) + "-" + string(numero) + ".png",sprite_get_number(_temp_var),0,1,0,0);
				set_auto_scale();
				sprite_set_offset(sprite_index,sprite_get_width(sprite_index)/2,sprite_get_height(sprite_index)/2);
				
				if (!global.edit_sprite_type) {
					global.enemigo_sprites[numero][0] = sprite_index;
					sprite_set_speed(sprite_index,global.enemigo_sprites[numero][1],spritespeed_framespersecond);
				} else {
					global.player_sprites[numero][0] = sprite_index;
					sprite_set_speed(sprite_index,global.player_sprites[numero][1],spritespeed_framespersecond);
				}
				
				file_delete(string(global.edit_sprite_type) + "-" + string(numero) + ".png");
				
			} else {
				
				datos_enviados = true;
				sprite_number = get_integer_async("Ingrese la cantidad de frames.",5);
				
			}
		}
	}
}

#endregion

#region cambiar opcion sprite

if (sprite_actual != numero) {
	
	sprite_actual = numero;
	
	if (global.edit_sprite_type) {
		
		sprite_index = global.player_sprites[numero][0];
		
	} else {
		
		sprite_index = global.enemigo_sprites[numero][0];
		
	}
	
	set_auto_scale();
	sprite_set_offset(sprite_index,sprite_get_width(sprite_index)/2,sprite_get_height(sprite_index)/2);
	
}

#endregion

if (point_in_rectangle(mouse_x,mouse_y,0,0,90,90) and mouse_check_button(mb_left)) {
	
	save_game(true);
	transition_to(room_creation_skins,10);
	
}
