local khaoslib_item = require("__khaoslib__.prototypes.item")
local lib = require("__more-ammo-redux__.prototypes.lib")

lib.edit_existing_shotgun_shell("shotgun-shell")

lib.create_high_capacity_shotgun_shell {
  name = "shotgun-shell",
  order = "a",
  icons = khaoslib_item.get_icons("ammo", "shotgun-shell"),
  categories = {"crafting"},
  energy_required = 1,
  ingredients = {
    {type = "item", name = "iron-plate", amount = 2},
    {type = "item", name = "copper-plate", amount = 2},
  },
}
