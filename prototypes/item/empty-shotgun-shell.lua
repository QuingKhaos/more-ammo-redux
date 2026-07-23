local khaosbash = require("__khaosbash__.prototypes.lib")
local khaoslib_item = require("__khaoslib__.prototypes.item")

khaoslib_item:load {
  type = "item",
  name = "empty-shotgun-shell",
  subgroup = "intermediate-product",
  order = "a[basic-clips]-c[empty-shotgun-shell]",
  stack_size = 200,
} :set_icons(khaosbash.load_icons("__khaosbash__/graphics/base/icons/empty-shotgun-shell", util.color("e5dc49")))
  :commit()
