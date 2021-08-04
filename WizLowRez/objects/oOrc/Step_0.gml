

if (orcHp < 1) instance_destroy();

// shamble towards player
if (object_exists(oPlayer)) {
	
	move_towards_point(oPlayer.x,oPlayer.y,orcMove);
}
