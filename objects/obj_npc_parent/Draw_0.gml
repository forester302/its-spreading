// Draws the sprite of this NPC
draw_self()

// Draws the status icon depending on the infected level of this NPC at the top right of the NPC
draw_sprite(spr_status_icon, infected_level, x+5, y-45)