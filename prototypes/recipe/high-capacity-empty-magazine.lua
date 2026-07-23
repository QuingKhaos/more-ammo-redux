local khaosbash = require("__khaosbash__.prototypes.lib")
local khaoslib_recipe = require("__khaoslib__.prototypes.recipe")

if settings.startup["high-capacity-magazines"].value then
  khaoslib_recipe:load {
    type = "recipe",
    name = "high-capacity-empty-magazine",
    subgroup = "intermediate-product",
    order = "a[basic-clips]-b[empty-magazine-high-capacity]",
    enabled = false,
    energy_required = 0.5,
  } :set_ingredients {
    {type = "item", name = "iron-plate", amount = math.ceil(settings.startup["empty-magazine-high-capacity"].value / 2 * 3 + 2)},
  } :set_results {
    {type = "item", name = "high-capacity-empty-magazine", amount = 1}
  } :set_icons(util.combine_icons(khaosbash.load_icons("__khaosbash__/graphics/base/icons/magazine", util.color("808080")), {
      {icon = "__more-ammo-redux__/graphics/icons/chevrons.png", icon_size = 64, scale = 0.25, shift = {-8, -8}},
    }, {}, 64))
    :set_categories({"crafting"})
    :commit()
end
