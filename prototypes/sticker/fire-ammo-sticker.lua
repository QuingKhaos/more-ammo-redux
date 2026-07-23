data.extend {
  {
    type = "sticker",
    name = "fire-ammo-sticker",
    flags = {"not-on-map"},
    duration_in_ticks = 300,
    target_movement_modifier = 0.8,
    damage_per_tick = {amount = settings.startup["fire-rounds-magazine-damage"].value / 60, type = "fire"},
    spread_fire_entity = "fire-flame-on-tree",
    fire_spread_cooldown = 30,
    fire_spread_radius = 0.75,
    animation = {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-03.png",
      blend_mode = "normal",
      scale = 0.2,
      width = 84,
      height = 124,
      line_length = 10,
      frame_count = 90,
      animation_speed = 1,
      tint = {r = 0.5, g = 0.5, b = 0.5, a = 0.18},
      shift = { -0.0078125, -0.18125 },
      draw_as_glow = true
    },
  }
}
