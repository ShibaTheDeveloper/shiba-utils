# Notice
Library is incomplete, working on making it a package and finishing functionality.

## Install Guide

`luarocks install shiba-utils`

- Works on Linux, Windows, macOS.
- Automatically installs all modules and manages updates.

# Additions
It is highly recommended to read the code and its comments to figure out how to use it.

- color.lua - Basic color utilities and conversions
- id-manager.lua - A simple ID manager that generates unique numeric IDs and reuses released IDs to avoid gaps.
- math.lua - Extended math functions like clamp
- quadtrees.lua - Spatial quadtree data structure
- string.lua - String formatting and manipulation
- table.lua - table utilities (eg.: shallowClone, merge, etc.)

# Usage example
```lua
local math = require("lua-utils.math") -- This will not shadow the original library's functions, as shown further in the example

-- Returns and prints 4
local clamped = math.clamp(5, 0, 4) -- x, min, max
print(clamped)

-- The original lua library's functions can still be used
-- Returns and prints 2
local sqrt = math.sqrt(clamped)
print(sqrt)
```
