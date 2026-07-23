local khaoslib_item = require("__khaoslib__.prototypes.item")
local lib = require("__more-ammo-redux__.prototypes.lib")

lib.edit_existing_magazine("firearm-magazine")

lib.create_high_capacity_magazine {
  name = "firearm-magazine",
  order = "a",
  icons = khaoslib_item.get_icons("ammo", "firearm-magazine"),
  categories = {"crafting"},
  energy_required = 1,
  ingredients = {
    {type = "item", name = "iron-plate", amount = 4},
  },
}
