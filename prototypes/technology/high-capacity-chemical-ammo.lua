local khaosbash = require("__khaosbash__.prototypes.lib")
local khaoslib_technology = require("__khaoslib__.prototypes.technology")

if settings.startup["chemical-magazines"].value and settings.startup["high-capacity-magazines"].value then
  khaoslib_technology:load {
    type = "technology",
    name = "high-capacity-chemical-ammo",
  } :set_prerequisites {"chemical-ammo"}
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
    :set_icons(util.combine_icons(khaosbash.load_icons("__khaosbash__/graphics/base/technology/ammo", util.color("00f4fc7f"), util.color("e04800c8"), util.color("ff0086c8")), {
      {icon = "__more-ammo-redux__/graphics/icons/chevrons.png", icon_size = 64, scale = 0.5, shift = {-48, -48}},
    }, {}, 256))
    :add_unlock_recipe("high-capacity-empty-magazine")
    :add_unlock_recipe("high-capacity-acid-rounds-magazine")
    :add_unlock_recipe("high-capacity-fire-rounds-magazine")
    :add_unlock_recipe("high-capacity-he-rounds-magazine")
    :commit()
end
