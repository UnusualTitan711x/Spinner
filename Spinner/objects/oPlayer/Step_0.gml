var p_gravity = 0.3
var left = keyboard_check(ord("A"))
var right = keyboard_check(ord("D"))
var up = keyboard_check(ord("W"))
var down = keyboard_check(ord("S"))

var jump = keyboard_check(vk_space)

var x_input = right - left
var y_input = up - down


enum pState {normal, swing}


switch (state)
{
	case pState.normal:
	{
		// Movement
		
		y_speed += p_gravity

		jump_height = 10
		mov_speed = 13
		
		x_speed = x_input * mov_speed
		
		// Jump if you are on the floor
		if place_meeting(x, y+1, oBlock)
		{
		    y_speed = 0
		    if jump
		    {
		         y_speed -= jump_height
		    }
		}
		
		if mouse_check_button_pressed(mb_left)
		{
			grappleX = mouse_x
			grappleY = mouse_y
			ropeX = x
			ropeY = y
			ropeAngleVelocity = 0;
			ropeAngle = point_direction(grappleX, grappleY, x, y)
			ropeLength = point_distance(grappleX, grappleY, x, y)
			state = pState.swing
		}
		
	}break
	
	case pState.swing:
	{
		var ropeAngleAcceleration = -0.2 * dcos(ropeAngle)
		ropeAngleAcceleration += x_input * 0.08
		ropeLength -= y_input * 2
		ropeLength = max(ropeLength, 5)
		
		ropeAngleVelocity += ropeAngleAcceleration
		ropeAngle += ropeAngleVelocity
		// ropeAngleVelocity *= 0.99 // Damping on the motion
		
		ropeX = grappleX + lengthdir_x(ropeLength, ropeAngle)
		ropeY = grappleY + lengthdir_y(ropeLength, ropeAngle)
		
		x_speed = ropeX - x
		y_speed = ropeY - y
		
		
		if jump || mouse_check_button_released(mb_left)
		{
			state = pState.normal
			y_speed -= jump_height * 0.3
		}

	}break
}

// X Collision
if place_meeting(x + x_speed, y, oBlock)
{
	h_step = sign(x_speed)
	
	while !place_meeting(x + h_step, y, oBlock) && x_speed != 0
	{
		x += h_step
	}
	x_speed = 0
	
	if state = pState.swing
	{
		ropeAngle = point_direction(grappleX, grappleY, x, y)
		ropeAngleVelocity = -ropeAngleVelocity
	}
}
else
{
	x += x_speed
}



// Y Collision
if place_meeting(x, y + y_speed, oBlock)
{
	v_step = sign(y_speed)
	
	while !place_meeting(x, y + v_step, oBlock) && y_speed != 0
	{
		y += v_step
	}
	
	y_speed = 0
	
	if state = pState.swing
	{
		ropeAngle = point_direction(grappleX, grappleY, x, y)
		ropeAngleVelocity = 0
	}
}
else
{
	y += y_speed
}

// Collision with Lava
if place_meeting(x, y, oLava)
{
    room_restart()
}