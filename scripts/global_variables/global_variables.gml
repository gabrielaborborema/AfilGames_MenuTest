var _save_data = json_load("config.sav");

if is_undefined(_save_data)
{
	global.game_volume = 10;
	global.is_game_fullscreen = false;	
}
else
{
	global.game_volume = _save_data.volume;
	global.is_game_fullscreen = _save_data.is_fullscreen;
}