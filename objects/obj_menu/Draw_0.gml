// dynamically get width and height of menu
var _new_w = 0;
for (var _i = 0; _i < op_length; _i++)
{
	var _op_w = string_width(options[menu_index, _i]);
	_new_w = max(_new_w, _op_w);
}

width = _new_w + op_border * 2;
height = (op_length - 1) * op_space + string_height(options[menu_index, 0]) + op_border * 2;

// center menu
x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - width/2;
y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2 - height/2;

// draw background
draw_sprite_ext(sprite_index, image_index, x, y, width / sprite_width, height / sprite_height, 0, c_white, 1);

// draw options
draw_set_font(fnt_menu);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

for (var _i = 0; _i < op_length; _i++)
{
	var _text_color = c_white;
	if op_index == _i { _text_color = c_yellow };
	draw_set_color(_text_color);
	draw_text(x + op_border, y + op_border + op_space * _i, options[menu_index, _i]);
}


draw_set_color(c_white);