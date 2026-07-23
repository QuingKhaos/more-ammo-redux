local khaosbash = require("__khaosbash__.prototypes.lib")
local khaoslib_item = require("__khaoslib__.prototypes.item")

if settings.startup["high-capacity-magazines"].value then
  khaoslib_item:load {
    type = "item",
    name = "high-capacity-empty-shotgun-shell",
    subgroup = "intermediate-product",
    order = "a[basic-clips]-d[empty-shotgun-shell-high-capacity]",
    stack_size = 200,
  } :set_icons(util.combine_icons(khaosbash.load_icons("__khaosbash__/graphics/base/icons/empty-shotgun-shell", util.color("e5dc49")), {
        {icon = "__more-ammo-redux__/graphics/icons/chevrons.png", icon_size = 64, scale = 0.25, shift = {-8, -8}},
      }, {}, 64))
    :commit()
end
