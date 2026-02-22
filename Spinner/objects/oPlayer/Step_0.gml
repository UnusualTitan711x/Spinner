// Hello here
// What is supposed to be here?

y_speed += 0.1

x_speed = 0

jump_height = 5
mov_speed = 5

if keyboard_check(ord("A"))
{
     x_speed = -1 * mov_speed
}

if keyboard_check(ord("D"))
{
     x_speed = 1 * mov_speed
}

if place_meeting(x, y+1, oBlock)
{
    y_speed = 0
    if keyboard_check(vk_space)
    {
         y_speed -= jump_height
    }

}

move_and_collide(x_speed, y_speed, oBlock)