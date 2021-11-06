/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
if (collision_point(mouse_x,mouse_y,id,1,0)) {
	
	if (mouse_check_button_pressed(mb_left)) {
		
		sprite_set_speed(obj_seleccion_sprites.sprite_index,sprite_get_speed(obj_seleccion_sprites.sprite_index) + sign(image_xscale),spritespeed_framespersecond);
		if (sprite_get_speed(obj_seleccion_sprites.sprite_index) < 0) {
			sprite_set_speed(obj_seleccion_sprites.sprite_index,0,spritespeed_framespersecond);
		} else if (sprite_get_speed(obj_seleccion_sprites.sprite_index) > 60) {
			sprite_set_speed(obj_seleccion_sprites.sprite_index,60,spritespeed_framespersecond);
		}
		
		if (!global.edit_sprite_type) {
			global.enemigo_sprites[obj_seleccion_sprites.numero][1] = sprite_get_speed(obj_seleccion_sprites.sprite_index);
		} else {
			global.player_sprites[obj_seleccion_sprites.numero][1] = sprite_get_speed(obj_seleccion_sprites.sprite_index);
		}
		
	}
	
	image_blend = c_gray;
	
} else {
	image_blend = c_white;
}