// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información

function set_auto_scale() {
	
	image_xscale = 600 / max(sprite_get_width(sprite_index),sprite_get_height(sprite_index));
	image_yscale = image_xscale;
	
}
