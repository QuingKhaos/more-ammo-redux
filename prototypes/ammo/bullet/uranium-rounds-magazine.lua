local khaoslib_item = require("__khaoslib__.prototypes.item")
local khaoslib_recipe = require("__khaoslib__.prototypes.recipe")
local lib = require("__more-ammo-redux__.prototypes.lib")

lib.edit_existing_magazine("uranium-rounds-magazine")

khaoslib_recipe:load("uranium-rounds-magazine")
  :set_ingredients({
    {type = "item", name = "uranium-238", amount = 1},
    {type = "item", name = "iron-plate", amount = 4},
    {type = "item", name = "copper-plate", amount = 2},
    {type = "item", name = "steel-plate", amount = 1},
    {type = "item", name = "empty-magazine", amount = 1},
  })
  :commit()

lib.create_high_capacity_magazine {
  name = "uranium-rounds-magazine",
  order = "c",
  icons = khaoslib_item.get_icons("ammo", "uranium-rounds-magazine"),
  categories = {"crafting"},
  energy_required = 10,
  ingredients = {
    {type = "item", name = "uranium-238", amount = 1},
    {type = "item", name = "iron-plate", amount = 4},
    {type = "item", name = "copper-plate", amount = 2},
    {type = "item", name = "steel-plate", amount = 1},
  },
}
