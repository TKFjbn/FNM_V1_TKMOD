/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

#region zoom camera

if (zoom_camera) {
	
	zoom_camera_count += 0.25 * global.time_delta * zoom_camera_direction;
	
	if (zoom_camera_count > 1) {
		zoom_camera_count = 1;
		zoom_camera_direction = -1;
	} else if (zoom_camera_count < 0) {
		zoom_camera_count = 0;
		zoom_camera_direction = 1;
		zoom_camera = false;
	}
	
	camera_set_view_size(view_camera[0],1440 * (1 - zoom_camera_scale * zoom_camera_count),810 * (1 - zoom_camera_scale * zoom_camera_count));
	
}

#endregion

#region movimiento

var distancia_faltante = distance_to_point(global.points_cam[2 * cam_estado],global.points_cam[2 * cam_estado+1]);

var channel_cam = animcurve_get_channel(ac_cam_speed,0);
var channel_cam = animcurve_channel_evaluate(channel_cam,1 - distancia_faltante / distance_points);

if (distancia_faltante > 10) {
	move_towards_point(global.points_cam[2 * cam_estado],global.points_cam[2 * cam_estado + 1], 20 * global.time_delta * channel_cam);
} else {
	speed = 0;
}

#endregion

#region limites

if (x - 720) < 0 {
	x = 720;
	hspeed = 0;
} else if (x + 720) > 1920 {
	x = 1200;
	hspeed = 0;
}

if (y - 405) < 0 {
	y = 405;
	vspeed = 0;
} else if (y + 405) > 1080 {
	y = 675;
	vspeed = 0;
}

#endregion

camera_set_view_pos(view_camera[0],x - camera_get_view_width(view_camera[0]) / 2,y - camera_get_view_height(view_camera[0]) / 2); //posicionamiento camara definitivo

#region test

if keyboard_check_pressed(vk_delete) {
	zoom_camera = true;
}

#endregion
