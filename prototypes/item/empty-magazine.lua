local khaosbash = require("__khaosbash__.prototypes.lib")
local khaoslib_item = require("__khaoslib__.prototypes.item")

khaoslib_item:load {
  type = "item",
  name = "empty-magazine",
  subgroup = "intermediate-product",
  order = "a[basic-clips]-a[empty-magazine]",
  stack_size = 200,
} :set_icons(khaosbash.load_icons("__khaosbash__/graphics/base/icons/magazine", util.color("808080")))
  :commit()
