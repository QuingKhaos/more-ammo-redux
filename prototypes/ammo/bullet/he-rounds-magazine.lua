local khaosbash = require("__khaosbash__.prototypes.lib")
local lib = require("__more-ammo-redux__.prototypes.lib")

if settings.startup["chemical-magazines"].value then
  lib.create_ammo_bullet {
    name = "he-rounds-magazine",
    order = "i",
    icons = khaosbash.load_icons("__khaosbash__/graphics/base/icons/magazine", util.color("ff0086")),
    target_effects = {
      {
        type = "create-entity",
        entity_name = "explosion",
      },
      {
        type = "damage",
        damage = {amount = settings.startup["he-rounds-magazine-damage"].value, type = "explosion"},
      },
    },
    categories = {"advanced-crafting"},
    energy_required = 6,
    ingredients = {
      {type = "item", name = "iron-plate", amount = 5},
      {type = "item", name = "steel-plate", amount = 4},
      {type = "item", name = "explosives", amount = 1},
    },
  }
end
