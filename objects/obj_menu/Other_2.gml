window_set_fullscreen(global.is_game_fullscreen);

audio_master_gain(global.game_volume / 10);

audio_play_sound(snd_music, 0, true);