package = "lua-utils"
version = "1.0.0-1"

source = {
    url = "https://github.com/ShibaTheDeveloper/lua-utils/archive/refs/tags/v1.0.0.zip",
    tag = "v1.0.0"
}

description = {
    summary = "Utility library for lua.",
    detailed = "A lua library which contains tons of useful functions that base lua should have had.",
    homepage = "https://github.com/ShibaTheDeveloper/lua-utils",
    license = "MIT"
}

dependencies = {
    "lua >= 5.4"
}

build = {
    type = "builtin",
    modules = {
        ["lua-utils.color"] = "modules/color.lua",
        ["lua-utils.id-manager"] = "modules/id-manager.lua",
        ["lua-utils.math"] = "modules/math.lua",
        ["lua-utils.quadtrees"] = "modules/quadtrees.lua",
        ["lua-utils.string"] = "modules/string.lua",
        ["lua-utils.table"] = "modules/table.lua"
    }
}