// Hello here
// What is supposed to be here?

var p_gravity = 0.3
var left = keyboard_check(ord("A"))
var right = keyboard_check(ord("D"))
var jump = keyboard_check(vk_space)


enum pState {normal, swing}


switch (state)
{
	case pState.normal:
	{
		// Movement
		
		y_speed += p_gravity

		x_speed = 0

		jump_height = 10
		mov_speed = 13
		if left
		{
		     x_speed = -1 * mov_speed
		}
		
		if right
		{
		     x_speed = 1 * mov_speed
		}
		
		// Jump if you are on the floor
		if place_meeting(x, y+1, oBlock)
		{
		    y_speed = 0
		    if jump
		    {
		         y_speed -= jump_height
		    }

		}
		
		move_and_collide(x_speed, y_speed, oBlock)
		
		if mouse_check_button(mb_left)
		{
			grappleX = mouse_x
			grappleY = mouse_y
			ropeX = x
			ropeY = y
			ropeAngleVelocity = 0;
			ropeAngle = point_direction(grappleX, grappleX, x, y)
			ropeLength = point_distance(grappleX, grappleX, x, y)
			state = pState.swing
		}
		
	}break
	
	case pState.swing:
	{
		var _ropeAngleAcceleration = -0.2 * dcos(ropeAngle)
		ropeAngleVelocity += _ropeAngleAcceleration
		ropeAngle += ropeAngleVelocity
		// ropeAngleVelocity *= 0.99 // Damping effect on the speed
		
		ropeX = grappleX + lengthdir_x(ropeLength, ropeAngle)
		ropeY = grappleY + lengthdir_y(ropeLength, ropeAngle)
		
		hspeed = ropeX - x
		vspeed = ropeY - y
		
		if jump
		{
			state = pState.normal
			vspeed = -jump_height
		}
		
	}break
}

// Collision with Lava

if place_meeting(x, y, oLava)
{
    room_restart()
}