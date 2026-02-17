package = "lua-utils"
version = "1.0.0-1"
source = {
    url = "https://github.com/ShibaTheDeveloper/lua-utils/archive/refs/tags/v1.0.0.tar.gz",
}
description = {
    summary = "Utility modules for Lua.",
    detailed = [[
        A lua library which contains tons of useful functions that base lua should have had.
    ]],
    homepage = "https://github.com/ShibaTheDeveloper/lua-utils",
    license = "MIT"
}
dependencies = {}
build = {
    type = "builtin",
    modules = {
        ["lua-utils.math"] = "math.lua",
        ["lua-utils.misc"] = "misc.lua",
        ["lua-utils.quadtrees"] = "quadtrees.lua",
        ["lua-utils.string"] = "string.lua",
        ["lua-utils.table"] = "table.lua"
    }
}