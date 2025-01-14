/// @description Insert description here
// You can write your code in this editor
if(place_meeting(x, y+1, other) && other.is_broken){
	vspeed += 0.2; 
} else if (vspeed > 0 || place_meeting(x, y+1, obj_floor)) {
	vspeed = 0; 
    vspeed = -11.5;  
	if (jump_boost) {
     vspeed = 0; 
     vspeed = -16; 
	 jump_boost_timer -= 1;
	}
    if (jump_boost_timer <= 0) {
        jump_boost = false;
        vspeed = 0; 
		vspeed = -11;  
    }
	if (!other.is_broken) {
    // Break the platform
	other.alarm[0] = 20;
}
}

