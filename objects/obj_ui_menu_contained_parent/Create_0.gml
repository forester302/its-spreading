// Overwrite in children to define what is drawn
draw_function = function () {}
has_sprite = sprite_exists(sprite_index)

// fix bug where would render behind the container
depth = -10