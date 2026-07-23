local khaosbash = require("__khaosbash__.prototypes.lib")
local lib = require("__more-ammo-redux__.prototypes.lib")

if settings.startup["chemical-magazines"].value then
  lib.create_ammo_bullet {
    name = "acid-rounds-magazine",
    order = "g",
    icons = khaosbash.load_icons("__khaosbash__/graphics/base/icons/magazine", util.color("00f4fc")),
    target_effects = {
      {
        type = "damage",
        damage = {amount = settings.startup["acid-rounds-magazine-damage"].value, type = "acid"},
      },
      {
        type = "create-fire",
        entity_name = "acid-splash-fire-spitter-medium",
        show_in_tooltip = true,
      },
    },
    categories = {"crafting-with-fluid"},
    energy_required = 4,
    ingredients = {
      {type = "item", name = "iron-plate", amount = 5},
      {type = "item", name = "steel-plate", amount = 4},
      {type = "fluid", name = "sulfuric-acid", amount = 10},
    },
  }
end
