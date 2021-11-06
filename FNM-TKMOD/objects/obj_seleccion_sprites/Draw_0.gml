/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(x-300,y-300,x+300,y+300,0);
draw_set_alpha(1);

draw_self();

if (numero > 0) {
	
	if (numero > 4) {
		color_blend = c_red;
	} else {
		color_blend = c_white;
	}
	
	draw_sprite_ext(spr_arrow,numero - 1,room_width / 2,120,1,1,0,color_blend,1);
	
}

draw_set_alpha(1);

if (point_in_rectangle(mouse_x,mouse_y,0,0,90,90)) {
	
	if (mouse_check_button(mb_left)) {
		draw_set_color($F5DC20);
	} else {
		draw_set_color($FA802F);
	}
	
} else {
	draw_set_color($E0660B);
}

draw_rectangle(0,0,90,90,0);
draw_sprite(spr_edit_button,sprite_get_number(spr_edit_button) - 1,0,0);
