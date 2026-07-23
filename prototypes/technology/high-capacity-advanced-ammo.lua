local khaosbash = require("__khaosbash__.prototypes.lib")
local khaoslib_technology = require("__khaoslib__.prototypes.technology")

if settings.startup["advanced-magazines"].value and settings.startup["high-capacity-magazines"].value then
  khaoslib_technology:load {
    type = "technology",
    name = "high-capacity-advanced-ammo",
  } :set_prerequisites {"advanced-ammo"}
    :set_unit {
      time = 45,
      count = 200,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
      },
    }
    :set_icons(util.combine_icons(khaosbash.load_icons("__khaosbash__/graphics/base/technology/ammo", util.color("a800ff64"), util.color("00c23a7f"), util.color("d8d8d8")), {
      {icon = "__more-ammo-redux__/graphics/icons/chevrons.png", icon_size = 64, scale = 0.5, shift = {-48, -48}},
    }, {}, 256))
    :add_unlock_recipe("high-capacity-empty-magazine")
    :add_unlock_recipe("high-capacity-firearm-magazine")
    :add_unlock_recipe("high-capacity-piercing-rounds-magazine")
    :add_unlock_recipe("high-capacity-uranium-rounds-magazine")
    :add_unlock_recipe("high-capacity-hp-rounds-magazine")
    :add_unlock_recipe("high-capacity-fmj-rounds-magazine")
    :add_unlock_recipe("high-capacity-sp-rounds-magazine")
    :commit()
end
