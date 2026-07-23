local khaosbash = require("__khaosbash__.prototypes.lib")
local lib = require("__more-ammo-redux__.prototypes.lib")

if settings.startup["chemical-magazines"].value then
  lib.create_ammo_bullet {
    name = "fire-rounds-magazine",
    order = "h",
    icons = khaosbash.load_icons("__khaosbash__/graphics/base/icons/magazine", util.color("e04800")),
    target_effects = {
      {
        type = "create-entity",
        entity_name = "fire-flame",
      },
      {
        type = "damage",
        damage = {amount = settings.startup["fire-rounds-magazine-damage"].value, type = "fire"},
      },
      {
        type = "create-sticker",
        sticker = "fire-ammo-sticker",
        show_in_tooltip = true,
      },
    },
    categories = {"advanced-crafting"},
    energy_required = 4,
    ingredients = {
      {type = "item", name = "iron-plate", amount = 5},
      {type = "item", name = "steel-plate", amount = 4},
      {type = "item", name = "sulfur", amount = 2},
    },
  }
end
