custom neovim header 

/src/nvim/version.c

***

    N_("Welcome, To neovim"),
    "",
    "",
N_("   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠦⢤⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"),
N_("  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠳⢦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀"),
N_("  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⠞⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠈⠛⢦⡄⠀⠀⠀⠀⠀⠀"),
N_("   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢷⡀⠀⠀⠀⠀"),
N_("  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣦⡀⠀⠀"),
N_("  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⡄⠀"),
N_("   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡼⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣉⣉⣙⠣⠄⠀⠀⠀⠉⠉⠉⠛⠶⢦⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡄"),
N_("  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⢀⣡⡴⠾⣿⡉⠛⢿⣦⠀⢀⣰⠶⠛⠛⠻⢶⣄⡙⢢⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁"),
N_(" ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣤⡶⣶⣤⣀⠸⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢷⣿⢃⢴⣿⣿⣿⣶⡀⠹⣶⠟⣡⣾⣿⣿⣶⡄⠙⢷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"),
N_(" ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡼⠋⢁⡴⢧⡀⢉⣛⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⡏⠈⣿⣿⣿⣿⣿⣷⠀⠟⠀⣿⣿⣿⣿⣿⣿⠀⢸⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"),
N_(" ⠀⠀⠀⠀⠀⠀⠀⢀⣴⡟⠁⣰⡿⠁⠀⣹⠟⢋⣡⣿⢧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠟⣷⡀⠸⣿⣿⣿⡿⠃⠀⣦⠀⠛⣿⣿⣿⣿⡏⠀⣼⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"),
N_(" ⠀⠀⠀⠀⢀⣴⡾⠛⠉⡿⠸⡏⠀⢀⡾⠉⢉⣾⠯⣥⡈⠻⣧⠀⠀⠀⠀⠀⠀⠀⠸⣬⣿⡆⠀⠀⠁⠀⢀⣀⠘⢷⣤⡈⠉⠙⠃⣨⣾⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"),
N_(" ⠀⠀⠀⣰⡏⠉⢇⡞⠶⢷⡀⠹⣄⠘⠀⣰⡟⠀⢀⡞⠉⠁⠺⣷⡀⠀⠀⠀⠀⠀⠀⠀⠙⢿⡷⣤⣴⣶⠞⠁⠀⠀⠙⠿⢾⣷⡿⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"),
N_(" ⠀⠀⠀⣿⠠⠀⠈⠓⠀⠠⢷⣄⠘⢷⣀⠹⡄⢠⡼⠀⠀⠀⢀⣿⢻⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"),
N_(" ⠀⠀⢀⣿⠀⠀⠀⠀⠀⠀⠰⡦⠀⠀⠻⣆⡑⠏⠀⠀⠀⠀⣼⣿⡍⠛⢿⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"),
N_(" ⠀⢠⣾⢻⣦⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠚⠻⣦⣤⣤⣴⣿⣋⣹⣷⠀⢠⡈⢻⣿⣷⣦⣄⣤⣤⣄⣀⣤⣤⣤⣤⣤⣤⣤⣠⣤⣤⣤⣤⣤⣤⣤⣤⠀⠀⠀⠀⠀⠀⠀⠀ "),
N_(" ⢠⡟⠀⠘⢿⣆⡈⢷⣄⠀⠀⠀⠙⡄⠀⠛⠂⣀⠘⠠⠟⣿⣿⠁⣿⣀⣼⠟⠉⣀⠀⠸⣿⡟⣿⡿⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⣿⡿⠟⠃⠀⠀⠀⠀⠀⠀⠀⠀"),
N_(" ⢸⠁⠀⠀⠀⠻⠧⣄⣿⣷⡀⠀⠀⠀⠀⠀⠀⠈⠱⠀⠈⠙⣿⣿⣿⣿⡿⠷⠂⠹⢧⠀⣾⣿⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡄⠀"),
N_(" ⢸⠀⠀⠀⠀⠀⠀⠹⠿⣿⣻⣦⡀⠀⠀⠀⠀⠀⢀⡀⠀⠑⠾⣿⣿⡿⠸⠆⠠⠆⠀⠀⢸⢻⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⢣⡾⠃⠀"),
N_(" ⡞⠀⢀⠀⠀⠀⠀⠀⠀⠐⠀⢙⣿⣦⡀⠀⠀⣴⠟⡁⠀⠀⣰⣿⡟⠓⢰⣆⡼⠦⢄⠀⠬⡷⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠴⢞⡵⠛⠀⠀⠀"),
N_(" ⠇⠀⠘⠻⣦⣄⠄⠀⢠⡀⠀⠀⠛⠛⣷⣄⡀⠉⠀⠽⢀⣾⣿⠟⢀⣴⢾⡟⢧⡀⡀⠙⣆⣶⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠜⢃⡴⠋⠀⠀⠀⠀⠀"),
N_(" ⣄⠀⠀⠀⠉⠛⢷⣄⠀⠙⣄⠀⠀⠀⠙⣏⡛⢷⣄⣘⢻⣿⡏⠀⢾⠁⠸⣷⣈⣿⣤⠾⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣎⣵⠾⠋⠀⠀⠀⠀⠀⠀⠀"),
N_(" ⠸⣦⡄⠀⠀⠀⠀⡙⢷⣄⠈⠀⠀⠀⣀⡞⠁⡇⠈⣹⡿⠋⢷⠀⢸⡆⢠⣾⡿⠋⠙⠷⢦⣄⣀⣀⡀⠀⠀⠀⠀⠀⣀⣀⠀⠀⣀⣠⣿⠷⠞⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀"),
N_(" ⠀⠈⠳⣄⡀⠀⠀⠀⠀⠈⠻⣦⣀⠀⠈⠀⠇⣃⡼⠟⠁⠀⠀⠳⢤⣷⡿⠟⠀⠀⠀⠀⠀⠀⠈⠙⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"),
N_(" ⠀⠀⠀⠀⠙⠲⣤⡀⠀⠀⠀⣠⠙⠓⢶⣤⡾⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"),
N_(" ⠀⠀⠀⠀⠀⠀⠉⠓⠶⣤⣀⣘⣴⠞⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ "),
