window_set_size(1280, 720)

colors = ["red", "blue", "yellow", "green"]
color_order = array_shuffle(colors)
collected_colors = []
color_count = 0

for (i = 0; i < array_length(color_order); i+=1)
{
	show_debug_message(color_order[i])
}

show_debug_message(color_order[2])

x_speed = 0
y_speed = 0

state = pState.normal