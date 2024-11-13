/// @description Insert description here
// You can write your code in this editor
// Check if player is high enough to spawn a new platform

if (obj_player.y < next_platform_y) {

    // Spawn a new platform above the player
	while (platforms_generated < platforms_per_height) {
		// Set up a variable to determine if the position is valid
    var position_is_valid = false;
    var attempt_count = 0; // Limit the number of attempts to find a valid spot
	var platform_x;
	var platform_type = irandom(2); // Randomly choose a platform type (0, 1, or 2)
	var new_platform;

	if (platform_type == 0) {
	    new_platform = obj_platform;
	} else if (platform_type == 1) {
	    new_platform = obj_platform_breakable;
	} else {
	    new_platform = obj_platform_moving;
	}

    while (!position_is_valid && attempt_count < 10) {
        // Generate a random x-coordinate for the platform
        platform_x = random(room_width);

        // Assume the position is valid initially
        position_is_valid = true;

        // Check all existing platforms to see if any are too close
        with (obj_platform) {
            if (y == other.next_platform_y - other.platform_y_spacing && 
			point_distance(platform_x, y, x, y) < other.min_platform_distance) {
                position_is_valid = false; // Mark position as invalid if too close
                break; // Exit the loop to try a new position
            }
        }
		with (obj_platform_breakable) {
            if (y == other.next_platform_y - other.platform_y_spacing && 
			point_distance(platform_x, y, x, y) < other.min_platform_distance) {
                position_is_valid = false; // Mark position as invalid if too close
                break; // Exit the loop to try a new position
            }
        }
		with (obj_platform_moving) {
            if (y == other.next_platform_y - other.platform_y_spacing && 
			point_distance(platform_x, y, x, y) < other.min_platform_distance) {
                position_is_valid = false; // Mark position as invalid if too close
                break; // Exit the loop to try a new position
            }
        }

        attempt_count += 1; // Increment attempt count to avoid infinite loops
    } if (position_is_valid) {
		// Spawn platform at current height
		instance_create_layer(platform_x, next_platform_y - platform_y_spacing, "Instances", new_platform);
		platforms_generated += 1;
		var random_food = irandom(1000);

		if (random_food < 10) { 
		    instance_create_layer(platform_x, next_platform_y - platform_y_spacing - 150, "Instances", obj_food_walnut);
		} else if (random_food < 20) { 
		    instance_create_layer(platform_x, next_platform_y - platform_y_spacing - 150, "Instances", obj_food_carrot);
		} else if (random_food < 30) { 
		    instance_create_layer(platform_x, next_platform_y - platform_y_spacing - 150, "Instances", obj_food_banana);
		}

	}
	}
	// Increase height after reaching the desired number of platforms
	platforms_generated = 0; // Reset the counter
    next_platform_y -= platform_y_spacing;  // Update the position for the next platform
}

// Remove platforms below the camera view to optimize performance
var _camera_bottom_y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])+2000;

with (obj_platform) {
    if (y > _camera_bottom_y) {
        instance_destroy();  // Delete platform if it's below the visible area
    }
}
with (obj_platform_breakable) {
    if (y > _camera_bottom_y) {
        instance_destroy();  // Delete platform if it's below the visible area
    }
}
with (obj_platform_moving) {
    if (y > _camera_bottom_y) {
        instance_destroy();  // Delete platform if it's below the visible area
    }
}
