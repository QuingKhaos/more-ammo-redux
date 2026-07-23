local khaosbash = require("__khaosbash__.prototypes.lib")
local khaoslib_technology = require("__khaoslib__.prototypes.technology")

if settings.startup["advanced-magazines"].value then
  khaoslib_technology:load {
    type = "technology",
    name = "advanced-ammo",
  } :set_prerequisites {"military-3"}
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
    :set_icons(khaosbash.load_icons("__khaosbash__/graphics/base/technology/ammo", util.color("a800ff64"), util.color("00c23a7f"), util.color("d8d8d8")))
    :add_unlock_recipe("hp-rounds-magazine")
    :add_unlock_recipe("fmj-rounds-magazine")
    :add_unlock_recipe("sp-rounds-magazine")
    :commit()
end
