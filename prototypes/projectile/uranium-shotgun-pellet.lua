data.extend({
  {
    type = "projectile",
    name = "uranium-shotgun-pellet",
    hidden = true,
    flags = {"not-on-map"},
    acceleration = 0,
    direction_only = true,
    collision_box = {{-0.05, -0.25}, {0.05, 0.25}},
    action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          type = "damage",
          damage = {
            amount = settings.startup["uranium-shotgun-shell-damage"].value,
            type = "physical"
          },
        },
      },
    },
    animation = {
      filename = "__base__/graphics/entity/piercing-bullet/piercing-bullet.png",
      priority = "high",
      height = 50,
      width = 3,
      draw_as_glow = true,
    },
  }
})
