// Hello here
// What is supposed to be here?

var p_gravity = 0.2
var left = keyboard_check(ord("A"))
var right = keyboard_check(ord("D"))
var jump = keyboard_check(vk_space)

y_speed += p_gravity

x_speed = 0

jump_height = 10
mov_speed = 10

if left
{
     x_speed = -1 * mov_speed
}

if right
{
     x_speed = 1 * mov_speed
}

if place_meeting(x, y+1, oBlock)
{
    y_speed = 0
    if jump
    {
         y_speed -= jump_height
    }

}

move_and_collide(x_speed, y_speed, oBlock)

// Collision with Lava

if place_meeting(x, y, oLava)
{
    room_restart()
}