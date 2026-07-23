local khaosbash = require("__khaosbash__.prototypes.lib")
local lib = require("__more-ammo-redux__.prototypes.lib")

if settings.startup["advanced-magazines"].value then
  lib.create_ammo_bullet {
    name = "fmj-rounds-magazine",
    order = "e",
    icons = khaosbash.load_icons("__khaosbash__/graphics/base/icons/magazine", util.color("00c23a")),
    categories = {"crafting"},
    energy_required = 8,
    ingredients = {
      {type = "item", name = "iron-plate", amount = 3},
      {type = "item", name = "steel-plate", amount = 3},
      {type = "item", name = "copper-plate", amount = 2},
    },
  }
end
