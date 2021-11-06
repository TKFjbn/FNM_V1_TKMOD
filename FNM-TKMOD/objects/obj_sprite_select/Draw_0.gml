/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
draw_self();

if (global.selection = id) and (global.seccion_menu = 0) {
	
	draw_set_color(c_blue);
	draw_set_alpha(1);
	draw_rectangle(x,y,x+sprite_width,y+sprite_height,1);
	draw_sprite_ext(spr_escalar,0,x + sprite_width,y+sprite_height,sign(image_xscale),sign(image_yscale),0,c_white,1);
	
}
