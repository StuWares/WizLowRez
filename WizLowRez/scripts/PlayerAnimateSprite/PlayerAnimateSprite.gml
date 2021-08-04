// Update sprite
function PlayerAnimateSprite(){
	var _cardinalDirection = round(direction/90);
	//var _cardinalDirection = floor(((direction div 45) + 1) * 0.5);
	var _totalFrames = sprite_get_number(sprite_index) / 4;
	image_index = localFrame + (_cardinalDirection * _totalFrames);
	localFrame += sprite_get_speed(sprite_index) / FRAME_RATE;

	// loop animation
	if (localFrame >= _totalFrames) {
		animationEnd = true; // not used yet
		localFrame -= _totalFrames;
	} else {
		animationEnd = false;
	}





}