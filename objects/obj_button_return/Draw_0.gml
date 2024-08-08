x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - width/2;
y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2 - height/2;

draw_sprite_ext(sprite_index, image_index, x, y, width / sprite_width, height / sprite_height, 0, c_white, 1);

draw_set_color(text_color);

draw_text(x + width/2 - string_width(text)/2, y + height/2 - string_height(text)/2, text);

draw_set_color(c_white);