/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if (collision_point(mouse_x,mouse_y,id,1,0)) {
	draw_sprite_ext(sprite_index,image_index,x-10,y+10,image_xscale + 0.1,image_yscale + 0.1,0,c_black,0.5);
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale + 0.1,image_yscale + 0.1,0,c_white,1);
} else {
	draw_sprite_ext(sprite_index,image_index,x-10,y+10,image_xscale,image_yscale,0,c_black,0.5);
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,c_white,1);
}
