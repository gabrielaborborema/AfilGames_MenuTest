width = 0;
height = 0;

op_border = 30;
op_space = 60;

op_index = 0;
menu_index = 0;

volume = global.game_volume;
is_game_fullscreen = global.is_game_fullscreen;

options =
[	// main menu
	["Jogar", "Configurações", "Sair"],
	// config menu
	[string("Volume < {0} >", volume), "Tela Cheia: " + (is_game_fullscreen ? "Sim" : "Não"), "Voltar"]
];

op_length = 0;

mx_prev = mouse_x;
my_prev = mouse_y;