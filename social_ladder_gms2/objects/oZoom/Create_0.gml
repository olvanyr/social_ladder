room_status = ds_map_create();

ds_map_add(room_status, room_get_name(rSword),3);
ds_map_add(room_status, room_get_name(room0),4);
ds_map_add(room_status, room_get_name(room1),4);
ds_map_add(room_status, room_get_name(rMaggie),3);

purcent = 0;

view_w = global.ideal_width / 4;
view_h = global.ideal_height / 4;

camera_view_w = global.ideal_width / 4;;
camera_view_h = global.ideal_height / 4;;