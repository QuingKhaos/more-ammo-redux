local khaosbash = require("__khaosbash__.prototypes.lib")
local lib = require("__more-ammo-redux__.prototypes.lib")

if settings.startup["advanced-magazines"].value then
  lib.create_ammo_bullet {
    name = "hp-rounds-magazine",
    order = "d",
    setting_prefix = "tungsten-rounds-magazine",
    icons = khaosbash.load_icons("__khaosbash__/graphics/base/icons/magazine", util.color("d8d8d8")),
    categories = {"crafting"},
    energy_required = 4,
    ingredients = {
      {type = "item", name = "iron-plate", amount = 3},
      {type = "item", name = "steel-plate", amount = 7},
      {type = "item", name = "copper-plate", amount = 3},
    },
  }
end
