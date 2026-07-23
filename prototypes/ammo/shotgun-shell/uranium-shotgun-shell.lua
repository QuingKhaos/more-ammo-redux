local khaosbash = require("__khaosbash__.prototypes.lib")
local khaoslib_recipe = require("__khaoslib__.prototypes.recipe")
local lib = require("__more-ammo-redux__.prototypes.lib")

if settings.startup["u238-slug-shell"].value then
  lib.create_ammo_shotgun_shell {
    name = "uranium-shotgun-shell",
    order = "c",
    icons = khaosbash.load_icons("__khaosbash__/graphics/base/icons/filled-shotgun-shell", util.color("60df65")),
    categories = {"advanced-crafting"},
    energy_required = 10,
    ingredients = {
      {type = "item", name = "uranium-238", amount = 1},
      {type = "item", name = "iron-plate", amount = 2},
      {type = "item", name = "copper-plate", amount = 7},
      {type = "item", name = "steel-plate", amount = 2},
    },
  }

  khaoslib_recipe:load("uranium-shotgun-shell")
    :add_unlock("uranium-ammo")
    :commit()
end
