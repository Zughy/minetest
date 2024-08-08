--Minetest
--Copyright (C) 2024 Zughy
--
--This program is free software; you can redistribute it and/or modify
--it under the terms of the GNU Lesser General Public License as published by
--the Free Software Foundation; either version 2.1 of the License, or
--(at your option) any later version.
--
--This program is distributed in the hope that it will be useful,
--but WITHOUT ANY WARRANTY; without even the implied warranty of
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--GNU Lesser General Public License for more details.
--
--You should have received a copy of the GNU Lesser General Public License along
--with this program; if not, write to the Free Software Foundation, Inc.,
--51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

local menupath = core.get_mainmenu_path()
local basepath = core.get_builtin_path()

local basetxtrdir = core.get_texturepath_share() .. DIR_DELIM .. "base" ..
					DIR_DELIM
defaulttexturedir = basetxtrdir .. "pack" .. DIR_DELIM
local menutxtrdir = basetxtrdir .. DIR_DELIM .. "menu" .. DIR_DELIM

dofile(menupath .. DIR_DELIM .. "settings/init.lua")



--------------------------------------------------------------------------------

--------------------------------------------------------------------------------

local function get_random_name()
    return RANDOM_NAME1[math.random(#RANDOM_NAME1)] .. RANDOM_NAME2[math.random(#RANDOM_NAME2)]
end

core.set_clouds(false)
core.set_background("background", menutxtrdir .. "mt_bg.png")

local fs = {
    "formspec_version[6]",
    "size[5,11,true]",
    "no_prepend[]",
    "style_type[image_button;border=false;font=bold;font_size=22]",
    "style_type[image_button:hovered;fgimg=" .. menutxtrdir .. "mt_menu_button_hov.png]",
    "bgcolor[;neither]",
    "image[1.25,1;2.5,2.5;" .. menutxtrdir .. "minetesticon.png]",
    "container[0.5,7.2]",
    "image_button[0,0;4,1;" .. menutxtrdir .. "mt_menu_button.png;play;Gioca!]",
    "image_button[0,1.2;4,1;" .. menutxtrdir .. "mt_menu_button.png;settings;Impostazioni]",
    "image_button[0,2.4;4,1;" .. menutxtrdir .. "mt_menu_button.png;quit;Esci]",
    "container_end[]"
}

core.update_formspec(table.concat(fs,""))

core.button_handler = function(fields)
    if fields.play then
        gamedata.playername = get_random_name()

        -- TODO: controlla se quel nome già esiste e in caso, generane un altro

        core.start()

    elseif fields.settings then
        core.update_formspec(settings_get_formspec({}))

    elseif fields.quit then
        core.close()
    end
end


