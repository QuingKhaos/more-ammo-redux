local khaoslib_item = require("__khaoslib__.prototypes.item")
local khaoslib_recipe = require("__khaoslib__.prototypes.recipe")
local lib = require("__more-ammo-redux__.prototypes.lib")

lib.edit_existing_shotgun_shell("piercing-shotgun-shell")

khaoslib_recipe:load("piercing-shotgun-shell")
  :remove_ingredient("shotgun-shell")
  :commit()

lib.create_high_capacity_shotgun_shell {
  name = "piercing-shotgun-shell",
  order = "b",
  icons = khaoslib_item.get_icons("ammo", "piercing-shotgun-shell"),
  categories = {"crafting"},
  energy_required = 6,
  ingredients = {
    {type = "item", name = "copper-plate", amount = 2},
    {type = "item", name = "steel-plate", amount = 1},
  },
}
