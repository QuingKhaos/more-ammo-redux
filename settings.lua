local khaoslib_setting = require("__khaoslib__.settings.setting")

khaoslib_setting:load {
  type = "bool-setting",
  name = "high-capacity-magazines",
  setting_type = "startup",
  default_value = true,
  order = "aa[high-capacity-magazines]",
} :commit()

khaoslib_setting:load {
  type = "bool-setting",
  name = "advanced-magazines",
  setting_type = "startup",
  default_value = true,
  order = "ab[advanced-magazines]",
} :commit()

khaoslib_setting:load {
  type = "bool-setting",
  name = "chemical-magazines",
  setting_type = "startup",
  default_value = true,
  order = "ac[chemical-magazines]",
} :commit()

khaoslib_setting:load {
  type = "bool-setting",
  name = "u238-slug-shell",
  setting_type = "startup",
  default_value = true,
  order = "ad[u238-slug-shell]",
} :commit()

--- @class MoreAmmoRedux.SettingsDef
--- @field public name string Ammo name
--- @field public item_name string? Item name, if different from ammo name
--- @field public order data.Order Order of the ammo in the settings menu
--- @field public mul integer High capacity ammo size multiplier
--- @field public size integer Ammo magazine size
--- @field public dps integer Bullet damage per shot

--- @type MoreAmmoRedux.SettingsDef[]
local defs = {
  {name = "firearm-magazine", order = "a", mul = 2, size = 10, dps = 5},
  {name = "piercing-rounds-magazine", order = "b", mul = 2, size = 10, dps = 8},
  {name = "uranium-rounds-magazine", order = "c", mul = 2, size = 10, dps = 24},
  {name = "tungsten-rounds-magazine", item_name = "hp-rounds-magazine", order = "d", mul = 2, size = 10, dps = 11},
  {name = "fmj-rounds-magazine", order = "e", mul = 2, size = 5, dps = 15},
  {name = "sp-rounds-magazine", order = "f", mul = 2, size = 30, dps = 10},
  {name = "acid-rounds-magazine", order = "g", mul = 2, size = 10, dps = 6},
  {name = "fire-rounds-magazine", order = "h", mul = 2, size = 10, dps = 6},
  {name = "he-rounds-magazine", order = "i", mul = 2, size = 5, dps = 10},
  {name = "shotgun-shell", order = "k", mul = 2, size = 10, dps = 4},
  {name = "piercing-shotgun-shell", order = "l", mul = 2, size = 10, dps = 6},
  {name = "uranium-shotgun-shell", order = "m", mul = 2, size = 10, dps = 24},
}

khaoslib_setting:load {
  type = "int-setting",
  name = "empty-magazine-high-capacity",
  localised_name = {"", {"mod-setting-name.high-capacity-multiplier"}, ": [item=high-capacity-empty-magazine] ", {"item-name.high-capacity-empty-magazine"}},
  setting_type = "startup",
  default_value = 2,
  minimum_value = 1,
  maximum_value = 100,
  order = "b" .. "0" .. "[empty-magazine-high-capacity]",
} :commit()

khaoslib_setting:load {
  type = "int-setting",
  name = "empty-shotgun-shell-high-capacity",
  localised_name = {"", {"mod-setting-name.high-capacity-multiplier"}, ": [item=high-capacity-empty-shotgun-shell] ", {"item-name.high-capacity-empty-shotgun-shell"}},
  setting_type = "startup",
  default_value = 2,
  minimum_value = 1,
  maximum_value = 100,
  order = "b" .. "j" .. "[empty-shotgun-shell-high-capacity]",
} :commit()

for _, def in pairs(defs) do
  khaoslib_setting:load {
    type = "int-setting",
    name = def.name .. "-high-capacity",
    localised_name = {"", {"mod-setting-name.high-capacity-multiplier"}, ": [item=high-capacity-" .. (def.item_name or def.name) .. "] ", {"item-name.high-capacity-" .. (def.item_name or def.name)}},
    setting_type = "startup",
    default_value = def.mul,
    minimum_value = 1,
    maximum_value = 100,
    order = "b" .. def.order .. "[" .. def.name .. "]",
  } :commit()

  khaoslib_setting:load {
    type = "int-setting",
    name = def.name .. "-bullets-per-mag",
    localised_name = {"", {"mod-setting-name.bullets-per-magazine"}, ": [item=" .. (def.item_name or def.name) .. "] ", {"item-name." .. (def.item_name or def.name)}},
    setting_type = "startup",
    default_value = def.size,
    minimum_value = 1,
    maximum_value = 100,
    order = "c" .. def.order .. "[" .. def.name .. "]",
  } :commit()

  khaoslib_setting:load {
    type = "int-setting",
    name = def.name .. "-damage",
    localised_name = {"", {"mod-setting-name.damage-per-bullet"}, ": [item=" .. (def.item_name or def.name) .. "] ", {"item-name." .. (def.item_name or def.name)}},
    setting_type = "startup",
    default_value = def.dps,
    minimum_value = 1,
    maximum_value = 100,
    order = "d" .. def.order .. "[" .. def.name .. "]",
  } :commit()
end
