if (global.is_paused) {
    exit; // Skip further execution if the game is paused
}

/// @description Insert description here
// You can write your code in this editor
// Check if player is high enough to spawn a new platform

if (obj_player.y < next_platform_y) {

   
	while (platforms_generated < platforms_per_height) {
	
    var position_is_valid = false;
    var attempt_count = 0; 
	var platform_x;
	var platform_type = irandom(2); 
	var new_platform;

	if (platform_type == 0) {
	    new_platform = obj_platform;
	} else if (platform_type == 1) {
	    new_platform = obj_platform_breakable;
	} else {
	    new_platform = obj_platform_moving;
	}

    while (!position_is_valid && attempt_count < 10) {
        platform_x = random(room_width-128);
		var plat_y = irandom_range(-150,150)
        position_is_valid = true;

        with (obj_platform) {
            if (y == other.next_platform_y - other.platform_y_spacing && 
			point_distance(platform_x, y, x, y) < other.min_platform_distance) {
                position_is_valid = false; 
                break; 
            }
        }
		with (obj_platform_breakable) {
            if (y == other.next_platform_y - other.platform_y_spacing && 
			point_distance(platform_x, y, x, y) < other.min_platform_distance) {
                position_is_valid = false; 
                break; 
            }
        }
		with (obj_platform_moving) {
            if (y == other.next_platform_y - other.platform_y_spacing && 
			point_distance(platform_x, y, x, y) < other.min_platform_distance) {
                position_is_valid = false; 
                break; 
            }
        }

        attempt_count += 1; 
    } if (position_is_valid) {
		instance_create_layer(platform_x, next_platform_y - platform_y_spacing, "Instances", new_platform);
		platforms_generated += 1;
		var random_food = irandom(10000);
		if (random_food == 3469 || keyboard_check(vk_alt)) {
			instance_create_layer(platform_x, next_platform_y - platform_y_spacing - 150, "Instances", obj_food_star);
		} else if (random_food < 80) { 
		    instance_create_layer(platform_x, next_platform_y - platform_y_spacing - 150 , "Instances", obj_food_walnut);
		} else if (random_food < 200) { 
		    instance_create_layer(platform_x, next_platform_y - platform_y_spacing - 150, "Instances", obj_food_carrot);
		} else if (random_food < 500) { 
		    instance_create_layer(platform_x, next_platform_y - platform_y_spacing - 150, "Instances", obj_food_banana);
		}
	}
	}
	platforms_generated = 0; 
    next_platform_y -= platform_y_spacing;
}

var _camera_bottom_y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])+2000;

with (obj_platform) {
    if (y > _camera_bottom_y) {
        instance_destroy();  
    }
}
with (obj_platform_breakable) {
    if (y > _camera_bottom_y) {
        instance_destroy();  
    }
}
with (obj_platform_moving) {
    if (y > _camera_bottom_y) {
        instance_destroy(); 
    }
}
