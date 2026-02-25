start_x = 799
start_y = 31
box_size = 40
spacing = 20

for (i = 0; i < array_length(global.color_order); i+=1)
{
	var color_name = global.color_order[i]
	
	// set the appropriate start size for the box
	var box_x = start_x + (i * (box_size + spacing))
	
	switch (color_name)
	{
		case "red": draw_set_colour(#EE1C24) break;
		case "green": draw_set_colour(#00FF00) break;
		case "blue": draw_set_colour(#00D4FF) break;
		case "yellow": draw_set_colour(#FFF200) break;
		
	}
	
	draw_rectangle(box_x, start_y, box_x + box_size, start_y + box_size, false)
}
