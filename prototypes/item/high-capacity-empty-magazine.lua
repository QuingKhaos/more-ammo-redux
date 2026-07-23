local khaosbash = require("__khaosbash__.prototypes.lib")
local khaoslib_item = require("__khaoslib__.prototypes.item")

if settings.startup["high-capacity-magazines"].value then
  khaoslib_item:load {
    type = "item",
    name = "high-capacity-empty-magazine",
    subgroup = "intermediate-product",
    order = "a[basic-clips]-b[empty-magazine-high-capacity]",
    stack_size = 200,
  } :set_icons(util.combine_icons(khaosbash.load_icons("__khaosbash__/graphics/base/icons/magazine", util.color("808080")), {
        {icon = "__more-ammo-redux__/graphics/icons/chevrons.png", icon_size = 64, scale = 0.25, shift = {-8, -8}},
      }, {}, 64))
    :commit()
end
