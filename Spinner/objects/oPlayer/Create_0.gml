window_set_size(960, 540)

colors = ["red", "blue", "yellow", "green"]
global.color_order = array_shuffle(colors)
collected_colors = []
color_count = 0
blocks_cleared = 0

for (i = 0; i < array_length(global.color_order); i+=1)
{
	show_debug_message(global.color_order[i])
}

x_speed = 0
y_speed = 0

state = pState.normal