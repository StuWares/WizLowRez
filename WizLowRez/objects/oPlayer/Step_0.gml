/// @description Player gubbins
keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
keyUp = keyboard_check(vk_up) || keyboard_check(ord("W"));
keyDown = keyboard_check(vk_down) || keyboard_check(ord("S"));
keyAttack = keyboard_check_pressed(vk_space);
keyItem = keyboard_check_pressed(vk_shift);

// creates smoother diagonal movement
inputDirection = point_direction(0,0,keyRight-keyLeft,keyDown-keyUp);
// prevent invalid combinations
inputMagnitude = (keyRight - keyLeft !=0) || (keyDown - keyUp !=0);

// movement
hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);

PlayerCollision();