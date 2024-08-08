var _confirm_key = keyboard_check_pressed(vk_enter);

var _mouse_over = false;

if (point_in_rectangle(mouse_x, mouse_y, x, y, x + width, y + height))
{
	_mouse_over = true;
}


if (_confirm_key || (_mouse_over && mouse_check_button_pressed(mb_left)))
{
	room_goto(rm_menu);
}

text_color = _mouse_over ? c_yellow : c_white;