local khaoslib_item = require("__khaoslib__.prototypes.item")
local khaoslib_recipe = require("__khaoslib__.prototypes.recipe")
local lib = require("__more-ammo-redux__.prototypes.lib")

lib.edit_existing_magazine("piercing-rounds-magazine")

khaoslib_recipe:load("piercing-rounds-magazine")
  :remove_ingredient("firearm-magazine")
  :commit()

lib.create_high_capacity_magazine {
  name = "piercing-rounds-magazine",
  order = "b",
  icons = khaoslib_item.get_icons("ammo", "piercing-rounds-magazine"),
  categories = {"crafting"},
  energy_required = 6,
  ingredients = {
    {type = "item", name = "copper-plate", amount = 2},
    {type = "item", name = "steel-plate", amount = 1},
  },
}
