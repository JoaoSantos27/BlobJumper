/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_center);
draw_set_font(Font1)
draw_set_color(c_black);

var y_offset = 300;
var count = 0;

for (var i = 0; i < ds_priority_size(global.scores); i++) {
    var s = ds_priority_find_min(global.scores);
    draw_text(200, y_offset + (count * 30), string(count + 1) + ". " + string(s));
    ds_priority_delete_min(global.scores);
    count += 1;
    if (count >= 10) break; // Display top 10 scores
}
