// inputs
var _up_key = keyboard_check_pressed(vk_up);
var _down_key = keyboard_check_pressed(vk_down);
var _left_key = keyboard_check_pressed(vk_left);
var _right_key = keyboard_check_pressed(vk_right);
var _confirm_key = keyboard_check_pressed(vk_enter);

op_length = array_length(options[menu_index]);

// move through menu using keyboard
op_index += _down_key - _up_key;
if op_index >= op_length { op_index = 0 };
if op_index < 0 { op_index = op_length - 1 };

if (_down_key or  _up_key) audio_play_sound(snd_select, 0, false);

// move through menu using mouse
var _mouse_over = false;

if (point_in_rectangle(mouse_x, mouse_y, x, y, x + width, y + height))
{
	_mouse_over = true;
	if (mx_prev != mouse_x) || (my_prev != mouse_y)
	{
		var _mouse_hover_line = (mouse_y - y) div op_space;
		_mouse_hover_line = clamp(_mouse_hover_line, 0, op_length - 1);
		if (_mouse_hover_line != op_index) audio_play_sound(snd_select, 0, false);
		op_index = _mouse_hover_line;
	}
}

mx_prev = mouse_x;
my_prev = mouse_y;

// confirm options
if ((mouse_check_button_pressed(mb_left) && _mouse_over) || _confirm_key)
{
	audio_play_sound(snd_select, 0, false);
	
	switch (menu_index)
	{
		case 0:
			switch (op_index)
			{
				case 0: room_goto(rm_gameplay); break;
				case 1:
				menu_index = 1;
				op_index = 0;
				break;
				case 2: game_end(); break;
			}
		case 1:
			switch (op_index)
			{
				case 1:
					var _is_fullscreen = window_get_fullscreen();
					window_set_fullscreen(!_is_fullscreen);
					global.is_game_fullscreen = !_is_fullscreen;
					is_game_fullscreen = !_is_fullscreen;
					options[1, 1] = "Tela Cheia: " + (!_is_fullscreen ? "Sim" : "Não");
					break;
				case 2:
				var _save_data = {
					volume: global.game_volume,
					is_fullscreen: global.is_game_fullscreen
				}
				json_save("config.sav", _save_data);
				menu_index = 0;
				op_index = 0;
				break;
			}
	}
}

// left/right options
if (menu_index ==  1 && op_index == 0)
{
	if (_left_key || (mouse_check_button_pressed(mb_left) && point_in_rectangle(mouse_x, mouse_y, x + op_border + string_width("Volume "), y + op_border, x + op_border + string_width("Volume <"), y + op_border + string_height(options[menu_index, op_index]))))
	{
		volume --;
		volume = clamp(volume, 0, 10);
		audio_master_gain(volume / 10);
		options[menu_index, op_index] = string("Volume < {0} >", volume);
		global.game_volume = volume;
		audio_play_sound(snd_select, 0, false);
	}
	
	if (_right_key || (mouse_check_button_pressed(mb_left) && point_in_rectangle(mouse_x, mouse_y, x + op_border + string_width(options[menu_index, op_index]) - string_width(">"), y + op_border, x + op_border + string_width(options[menu_index, op_index]), y + op_border + string_height(options[menu_index, op_index]))))
	{
		volume ++;
		volume = clamp(volume, 0, 10);
		audio_master_gain(volume / 10);
		options[menu_index, op_index] = string("Volume < {0} >", volume);
		global.game_volume = volume;
		audio_play_sound(snd_select, 0, false);
	}
}