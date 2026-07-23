local khaosbash = require("__khaosbash__.prototypes.lib")
local khaoslib_recipe = require("__khaoslib__.prototypes.recipe")

khaoslib_recipe:load {
  type = "recipe",
  name = "empty-magazine",
  subgroup = "intermediate-product",
  order = "a[basic-clips]-a[empty-magazine]",
  enabled = true,
  energy_required = 0.5,
} :set_ingredients {
  {type = "item", name = "iron-plate", amount = 2},
} :set_results {
  {type = "item", name = "empty-magazine", amount = 1}
} :set_icons(khaosbash.load_icons("__khaosbash__/graphics/base/icons/magazine", util.color("808080")))
  :set_categories({"crafting"})
  :commit()
