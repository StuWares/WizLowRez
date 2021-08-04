/// @description Player setup

collisionMap = layer_tilemap_get_id(layer_get_id("Coll"));

image_speed = 0;
hSpeed = 0;
vSpeed = 0;
speedWalk = 2.0;

spriteRun = sPlayerWalk;
spriteIdle = sPlayer;
localFrame = 0;

basicAttackDelay = 60;
attackDirection = 0;