local khaoslib_item = require("__khaoslib__.prototypes.item")
local khaoslib_recipe = require("__khaoslib__.prototypes.recipe")

--- @class MoreAmmoRedux.lib
local lib = {}

--- @class MoreAmmoRedux.AmmoDef
--- @field public name string Ammo name
--- @field public order data.Order Order of the ammo
--- @field public setting_prefix string? Prefix for the settings, if not provided, will default to the ammo name
--- @field public icons data.IconData[] Icons for the magazine
--- @field public target_effects (data.TriggerEffect|data.TriggerEffect[])? Target effects of the ammo, if not provided, will default to a physical damage effect with the amount set in the settings
--- @field public categories string[] Categories of the recipe
--- @field public energy_required integer Energy required to craft the ammo
--- @field public ingredients data.IngredientPrototype[] Ingredients of the recipe

--- @param ammo data.AmmoItemPrototype
--- @param damage integer Damage amount to set for the ammo
--- @return data.AmmoItemPrototype ammo
local function set_damage(ammo, damage)
  if damage then
    if ammo.ammo_type ~= nil then
      if ammo.ammo_type.action ~= nil then
        ammo.ammo_type = {ammo.ammo_type}
      end

      for _, ammo_type in pairs(ammo.ammo_type) do
        if ammo_type.action.type ~= nil then
          ammo_type.action = {ammo_type.action}
        end

        for _, action in pairs(ammo_type.action) do
          if action.action_delivery.type ~= nil then
            action.action_delivery = {action.action_delivery}
          end

          for _, action_delivery in pairs(action.action_delivery) do
            if action_delivery.target_effects ~= nil then
              if action_delivery.target_effects.type ~= nil then
                action_delivery.target_effects = {action_delivery.target_effects}
              end

              for _, target_effect in pairs(action_delivery.target_effects) do
                if target_effect.type == "damage" then
                  target_effect.damage.amount = damage
                end
              end

              if #action_delivery.target_effects == 1 then
                action_delivery.target_effects = action_delivery.target_effects[1]
              end
            end
          end

          if #action.action_delivery == 1 then
            action.action_delivery = action.action_delivery[1]
          end
        end

        if #ammo_type.action == 1 then
          ammo_type.action = ammo_type.action[1]
        end
      end

      if #ammo.ammo_type == 1 then
        ammo.ammo_type = ammo.ammo_type[1]
      end
    end
  end

  return ammo
end

--- @param name string Magazine name
function lib.edit_existing_magazine(name)
  khaoslib_item:load("ammo", name)
    :set {magazine_size = settings.startup[name .. "-bullets-per-mag"].value}
    :set {ammo_type = set_damage(khaoslib_item.get("ammo", name), settings.startup[name .. "-damage"].value --[[@as integer]]).ammo_type}
    :commit()

  khaoslib_recipe:load(name)
    :add_ingredient {type = "item", name = "empty-magazine", amount = 1}
    :commit()
end

local function build_bullet_ammo_type(def)
  local ammo_type = {
    category = "bullet",
    action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        source_effects = {
          type = "create-explosion",
          entity_name = "explosion-gunshot",
          only_when_visible = true,
        },
        target_effects = def.target_effects or {
          type = "damage",
          damage = {amount = settings.startup[(def.setting_prefix or def.name) .. "-damage"].value, type = "physical"},
        },
      }
    }
  }

  if khaoslib_item.exists("ammo", def.name) then
    local existing_ammo = khaoslib_item.get("ammo", def.name)
    --- @cast existing_ammo data.AmmoItemPrototype
    if existing_ammo.ammo_type ~= nil then
      ammo_type = set_damage(existing_ammo, settings.startup[(def.setting_prefix or def.name) .. "-damage"].value --[[@as integer]]).ammo_type
    end
  end

  return ammo_type
end

--- @param def MoreAmmoRedux.AmmoDef
function lib.create_magazine(def)
  khaoslib_item:load {
    type = "ammo",
    name = def.name,
    subgroup = "ammo",
    order = "a[basic-clips]-" .. def.order .. "a[" .. def.name .. "]",
    ammo_category = "bullet",
    magazine_size = settings.startup[(def.setting_prefix or def.name) .. "-bullets-per-mag"].value,
    stack_size = 200,
    ammo_type = build_bullet_ammo_type(def),
  } :set_icons(def.icons)
    :commit()

  khaoslib_recipe:load {
    type = "recipe",
    name = def.name,
    subgroup = "ammo",
    order = "a[basic-clips]-" .. def.order .. "a[" .. def.name .. "]",
    enabled = false,
    energy_required = def.energy_required,
  } :set_results {
    {type = "item", name = def.name, amount = 1}
  } :set_ingredients(def.ingredients)
    :add_ingredient {type = "item", name = "empty-magazine", amount = 1}
    :set_categories(def.categories)
    :set_icons(def.icons)
    :commit()
end

--- @param def MoreAmmoRedux.AmmoDef
function lib.create_high_capacity_magazine(def)
  if settings.startup["high-capacity-magazines"].value then
    local hc_icons = util.combine_icons(def.icons, {
      {icon = "__more-ammo-redux__/graphics/icons/chevrons.png", icon_size = 64, scale = 0.25, shift = {-8, -8}},
    }, {}, 64)

    khaoslib_item:load {
      type = "ammo",
      name = "high-capacity-" .. def.name,
      subgroup = "ammo",
      order = "a[basic-clips]-" .. def.order .. "b[high-capacity-" .. def.name .. "]",
      ammo_category = "bullet",
      magazine_size = settings.startup[(def.setting_prefix or def.name) .. "-bullets-per-mag"].value * settings.startup[(def.setting_prefix or def.name) .. "-high-capacity"].value,
      stack_size = 200,
      ammo_type = build_bullet_ammo_type(def),
    } :set_icons(hc_icons)
      :commit()

    khaoslib_recipe:load {
      type = "recipe",
      name = "high-capacity-" .. def.name,
      subgroup = "ammo",
      order = "a[basic-clips]-" .. def.order .. "b[-high-capacity-" .. def.name .. "]",
      enabled = false,
      energy_required = def.energy_required,
    } :set_results {
      {type = "item", name = "high-capacity-" .. def.name, amount = 1}
    } :set_ingredients(def.ingredients)
      :replace_ingredient(function(ingredient) return true end, function(ingredient)
        ingredient.amount = math.ceil(ingredient.amount * settings.startup[(def.setting_prefix or def.name) .. "-high-capacity"].value / 4 * 3)
        return ingredient
      end, {all = true})
      :add_ingredient {type = "item", name = "high-capacity-empty-magazine", amount = 1}
      :set_categories(def.categories)
      :set_icons(hc_icons)
      :commit()
  end
end

--- @param name string Shotgun shell name
--- @param projectile data.ProjectilePrototype
--- @param damage integer Damage amount to set for the projectile
local function set_projectile_damage(name, projectile, damage)
  local damage = settings.startup[name .. "-damage"].value

  if damage then
    if projectile.action ~= nil then
      if projectile.action.type ~= nil then
        --- @diagnostic disable-next-line: assign-type-mismatch
        projectile.action = {projectile.action}
      end

      for _, action in pairs(projectile.action) do
        if action.action_delivery.type ~= nil then
          action.action_delivery = {action.action_delivery}
        end

        for _, action_delivery in pairs(action.action_delivery) do
          if action_delivery.target_effects ~= nil then
            if action_delivery.target_effects.type ~= nil then
              action_delivery.target_effects = {action_delivery.target_effects}
            end

            for _, target_effect in pairs(action_delivery.target_effects) do
              if target_effect.type == "damage" then
                target_effect.damage.amount = damage
              end
            end

            if #action_delivery.target_effects == 1 then
              action_delivery.target_effects = action_delivery.target_effects[1]
            end
          end
        end

        if #action.action_delivery == 1 then
          action.action_delivery = action.action_delivery[1]
        end
      end

      if #projectile.action == 1 then
        projectile.action = projectile.action[1]
      end
    end
  end
end

--- @param name string Shotgun shell name
function lib.edit_existing_shotgun_shell(name)
  khaoslib_item:load("ammo", name)
    :set {magazine_size = settings.startup[name .. "-bullets-per-mag"].value}
    :commit()

  set_projectile_damage(name, data.raw["projectile"][name:gsub("shell", "pellet")], settings.startup[name .. "-damage"].value --[[@as integer]])

  khaoslib_recipe:load(name)
    :add_ingredient {type = "item", name = "empty-shotgun-shell", amount = 1}
    :commit()
end

--- @param def MoreAmmoRedux.AmmoDef
local function build_shotgun_shell_ammo_type(def)
  local ammo_type = {
    target_type = "direction",
    clamp_position = true,
    action = {
      {
        type = "direct",
        action_delivery = {
          type = "instant",
          source_effects = {
            {
              type = "create-explosion",
              entity_name = "explosion-gunshot",
            }
          },
        },
      },
      {
        type = "direct",
        repeat_count = 24,
        action_delivery = {
          type = "projectile",
          projectile = def.name:gsub("shell", "pellet"),
          max_range = 15,
          range_deviation = 0.3,
          direction_deviation = 0.3,
          starting_speed = 1,
          starting_speed_deviation = 0.1,
        },
      }
    },
  }

  if khaoslib_item.exists("ammo", def.name) then
    local existing_ammo = khaoslib_item.get("ammo", def.name)
    --- @cast existing_ammo data.AmmoItemPrototype
    if existing_ammo.ammo_type ~= nil then
      ammo_type = existing_ammo.ammo_type
    end
  end

  return ammo_type
end

--- @param def MoreAmmoRedux.AmmoDef
function lib.create_shotgun_shell(def)
  khaoslib_item:load {
    type = "ammo",
    name = def.name,
    subgroup = "ammo",
    order = "b[shotgun]-" .. def.order .. "a[" .. def.name .. "]",
    ammo_category = "shotgun-shell",
    magazine_size = settings.startup[(def.setting_prefix or def.name) .. "-bullets-per-mag"].value,
    stack_size = 200,
    ammo_type = build_shotgun_shell_ammo_type(def),
  } :set_icons(def.icons)
    :commit()

  khaoslib_recipe:load {
    type = "recipe",
    name = def.name,
    subgroup = "ammo",
    order = "b[shotgun]-" .. def.order .. "a[" .. def.name .. "]",
    enabled = false,
    energy_required = def.energy_required,
  } :set_results {
    {type = "item", name = def.name, amount = 1}
  } :set_ingredients(def.ingredients)
    :add_ingredient {type = "item", name = "empty-shotgun-shell", amount = 1}
    :set_categories(def.categories)
    :set_icons(def.icons)
    :commit()
end

--- @param def MoreAmmoRedux.AmmoDef
function lib.create_high_capacity_shotgun_shell(def)
  if settings.startup["high-capacity-magazines"].value then
    local hc_icons = util.combine_icons(def.icons, {
      {icon = "__more-ammo-redux__/graphics/icons/chevrons.png", icon_size = 64, scale = 0.25, shift = {-8, -8}},
    }, {}, 64)

    khaoslib_item:load {
      type = "ammo",
      name = "high-capacity-" .. def.name,
      subgroup = "ammo",
      order = "b[shotgun]-" .. def.order .. "b[high-capacity-" .. def.name .. "]",
      ammo_category = "shotgun-shell",
      magazine_size = settings.startup[(def.setting_prefix or def.name) .. "-bullets-per-mag"].value * settings.startup[(def.setting_prefix or def.name) .. "-high-capacity"].value,
      stack_size = 200,
      ammo_type = build_shotgun_shell_ammo_type(def),
    } :set_icons(hc_icons)
      :commit()

    khaoslib_recipe:load {
      type = "recipe",
      name = "high-capacity-" .. def.name,
      subgroup = "ammo",
      order = "b[shotgun]-" .. def.order .. "b[-high-capacity-" .. def.name .. "]",
      enabled = false,
      energy_required = def.energy_required,
    } :set_results {
      {type = "item", name = "high-capacity-" .. def.name, amount = 1}
    } :set_ingredients(def.ingredients)
      :replace_ingredient(function(ingredient) return true end, function(ingredient)
        ingredient.amount = math.ceil(ingredient.amount * settings.startup[(def.setting_prefix or def.name) .. "-high-capacity"].value / 4 * 3)
        return ingredient
      end, {all = true})
      :add_ingredient {type = "item", name = "high-capacity-empty-shotgun-shell", amount = 1}
      :set_categories(def.categories)
      :set_icons(hc_icons)
      :commit()
  end
end

--- @param def MoreAmmoRedux.AmmoDef
function lib.create_ammo_bullet(def)
  lib.create_magazine(def)
  lib.create_high_capacity_magazine(def)
end

--- @param def MoreAmmoRedux.AmmoDef
function lib.create_ammo_shotgun_shell(def)
  lib.create_shotgun_shell(def)
  lib.create_high_capacity_shotgun_shell(def)
end

return lib
