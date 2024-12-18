/// @description Insert description here
// You can write your code in this editor
if (ds_list_find_index(global.unlocked_skins, 
ds_list_find_value(obj_storecontroller.store_items, item_index)[3])!=-1)
{
	is_purchased=true;
}
if (is_purchased) {
    image_index = 1; // Greyed-out subimage
} else {
    image_index = 0; // Normal subimage
}
draw_sprite(spr_buy_buttone, image_index,x,y);