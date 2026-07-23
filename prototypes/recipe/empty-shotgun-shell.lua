local khaosbash = require("__khaosbash__.prototypes.lib")
local khaoslib_recipe = require("__khaoslib__.prototypes.recipe")

khaoslib_recipe:load {
  type = "recipe",
  name = "empty-shotgun-shell",
  subgroup = "intermediate-product",
  order = "a[basic-clips]-c[empty-shotgun-shell]",
  enabled = true,
  energy_required = 0.5,
} :set_ingredients {
  {type = "item", name = "copper-plate", amount = 2},
} :set_results {
  {type = "item", name = "empty-shotgun-shell", amount = 1}
} :set_icons(khaosbash.load_icons("__khaosbash__/graphics/base/icons/empty-shotgun-shell", util.color("e5dc49")))
  :set_categories({"crafting"})
  :commit()
