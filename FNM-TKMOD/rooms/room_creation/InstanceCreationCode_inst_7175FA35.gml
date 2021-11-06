var capa_id = layer_background_get_id("Background");
layer_background_sprite(capa_id,global.background);

origin = 0;

image_xscale = global.data_pos_enemy[0];
image_yscale = global.data_pos_enemy[1];
x = global.data_pos_enemy[2];
y = global.data_pos_enemy[3];

obj_control_editor._id_enemigo = id;
depth = 190