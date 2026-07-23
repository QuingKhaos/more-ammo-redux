local khaosbash = require("__khaosbash__.prototypes.lib")
local khaoslib_technology = require("__khaoslib__.prototypes.technology")

if settings.startup["high-capacity-magazines"].value then
  local icons = {{icon = "__more-ammo-redux__/graphics/icons/chevrons.png", icon_size = 64, scale = 0.5, shift = {-48, -48}}}

  if settings.startup["u238-slug-shell"].value then
    icons = util.combine_icons(icons, khaosbash.load_icons("__khaosbash__/graphics/base/icons/filled-shotgun-shell", util.color("60df65")), {scale = 1.8, shift = {30, 30}}, 64)
  end

  icons = util.combine_icons(icons, {{icon = "__base__/graphics/icons/shotgun-shell.png", icon_size = 64}}, {scale = 1.8, shift = {-25, 30}}, 64)
  icons = util.combine_icons(icons, {{icon = "__base__/graphics/icons/piercing-shotgun-shell.png", icon_size = 64}}, {scale = 1.8, shift = {10, -25}}, 64)

  local tech = khaoslib_technology:load {
    type = "technology",
    name = "high-capacity-shotgun-shells",
  } :set_prerequisites {"uranium-ammo"}
    :set_unit {
      time = 60,
      count = 500,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1},
      },
    }
    :set_icons(icons)
    :add_unlock_recipe("high-capacity-empty-shotgun-shell")
    :add_unlock_recipe("high-capacity-shotgun-shell")
    :add_unlock_recipe("high-capacity-piercing-shotgun-shell")

  if settings.startup["u238-slug-shell"].value then
    tech:add_unlock_recipe("high-capacity-uranium-shotgun-shell")
  end

  tech:commit()
end
