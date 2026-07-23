local khaosbash = require("__khaosbash__.prototypes.lib")
local lib = require("__more-ammo-redux__.prototypes.lib")

if settings.startup["advanced-magazines"].value then
  lib.create_ammo_bullet {
    name = "sp-rounds-magazine",
    order = "f",
    icons =  khaosbash.load_icons("__khaosbash__/graphics/base/icons/magazine", util.color("a800ff")),
    categories = {"crafting"},
    energy_required = 8,
    ingredients = {
      {type = "item", name = "iron-plate", amount = 7},
      {type = "item", name = "steel-plate", amount = 5},
    },
  }
end
