/// @description Player gubbins
keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
keyUp = keyboard_check(vk_up) || keyboard_check(ord("W"));
keyDown = keyboard_check(vk_down) || keyboard_check(ord("S"));
keyAttack = keyboard_check_pressed(vk_space);
keyItem = keyboard_check_pressed(vk_shift);

// creates smoother diagonal movement
inputDirection = point_direction(0,0,keyRight-keyLeft,keyDown-keyUp);

// sets attack direction when stationary
if (keyRight - keyLeft !=0) || (keyDown - keyUp !=0) {
	attackDirection = inputDirection;
}
// prevent invalid combinations
inputMagnitude = (keyRight - keyLeft !=0) || (keyDown - keyUp !=0);

// movement
hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);

PlayerCollision();

// update sprite
var _oldSprite = sprite_index;

if (inputMagnitude != 0) {
	direction = inputDirection;
	sprite_index = spriteRun;
} else {
	sprite_index = spriteIdle;
}
if (_oldSprite != sprite_index) localFrame = 0; // goes to the first frame of the animation

// update image index
PlayerAnimateSprite();


// Basic attack in direction player is facing
basicAttackDelay--;
if (keyAttack) && (basicAttackDelay < 0) {
	with (instance_create_layer(x,y,"Spells",oBasicAttack)) {
		speed = 2;
		direction = other.attackDirection;
		image_angle = direction;
		
		basicAttackDelay = 60;
	}
}