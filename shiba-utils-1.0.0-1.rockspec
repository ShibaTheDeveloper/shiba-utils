package = "shiba-utils"
version = "1.0.0-1"

source = {
    url = "https://github.com/ShibaTheDeveloper/shiba-utils/archive/refs/tags/v1.0.0.zip",
    tag = "v1.0.0"
}

description = {
    summary = "Utility library for lua.",
    detailed = "A lua library which contains tons of useful functions that base lua should have had.",
    homepage = "https://github.com/ShibaTheDeveloper/shiba-utils",
    license = "MIT"
}

dependencies = {
    "lua >= 5.4"
}

build = {
    type = "builtin",
    modules = {
        ["shiba-utils.color"] = "modules/color.lua",
        ["shiba-utils.id-manager"] = "modules/id-manager.lua",
        ["shiba-utils.math"] = "modules/math.lua",
        ["shiba-utils.quadtrees"] = "modules/quadtrees.lua",
        ["shiba-utils.string"] = "modules/string.lua",
        ["shiba-utils.table"] = "modules/table.lua"
    }
}