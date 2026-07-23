local khaosbash = require("__khaosbash__.prototypes.lib")
local khaoslib_technology = require("__khaoslib__.prototypes.technology")

if settings.startup["chemical-magazines"].value then
  local tech = khaoslib_technology:load {
    type = "technology",
    name = "chemical-ammo",
  } :set_prerequisites {"rocketry", "military-4"}
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
    :set_icons(khaosbash.load_icons("__khaosbash__/graphics/base/technology/ammo", util.color("00f4fc7f"), util.color("e04800c8"), util.color("ff0086c8")))
    :add_unlock_recipe("acid-rounds-magazine")
    :add_unlock_recipe("fire-rounds-magazine")
    :add_unlock_recipe("he-rounds-magazine")

  if settings.startup["advanced-magazines"].value then
    tech:add_prerequisite("advanced-ammo")
  end

  tech:commit()
end
