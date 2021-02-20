--[[
    FiveM Scripts
    Copyright C 2018  Sighmir

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    at your option any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
]]


local cfg = {}

cfg.lang = "ro"
-- define customization parts
local parts = {
  ["Face"] = -1,
  ["Blemishes"] = 0,
  ["Beard"] = 1,
  ["Eyebrows"] = 2,
  ["Ageing"] = 3,
  ["Makeup"] = 4,
  ["Blush"] = 5,
  ["Complexion"] = 6,
  ["Skin"] = 7,
  ["Lipstick"] = 8,
  ["Moles/Freckles"] = 9,
  ["Chest Hair"] = 10,
  ["Body Blemishes"] = 11,
  ["Hair"] = 12
}

-- changes prices (any change to the character parts add amount to the total price)
cfg.drawable_change_price = 10
cfg.texture_change_price = 5
cfg.barbershops_title = "Barbershop"

-- skinshops list {parts,x,y,z}
cfg.barbershops = {
{parts,-280.05862426758,6227.40234375,31.70552444458}
}

return cfg
