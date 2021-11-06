/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

draw_set_alpha(0.5);

#region icono enemigo seleccion

if point_in_rectangle(mouse_x,mouse_y,735,1005,959,1080) {
	draw_set_color(c_gray);
} else {
	draw_set_color(c_black);
}

draw_rectangle(735,1005,959,1080,0);

#endregion

#region icono player seleccion

if point_in_rectangle(mouse_x,mouse_y,961,1005,1185,1080) {
	draw_set_color(c_gray);
} else {
	draw_set_color(c_black);
}

draw_rectangle(961,1005,1185,1080,0);

#endregion

for (var i = 0; i < 3; i++) {
	
	draw_sprite_ext(global.face_player,i,998 + 75 * i,1042,player_scale_icon,player_scale_icon,0,c_white,1);
	
	draw_sprite_ext(global.face_enemy,2 - i,922 - 75 * i,1042,enemy_scale_icon,enemy_scale_icon,0,c_white,1);
	
}

