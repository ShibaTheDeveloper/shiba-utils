# shiba-utils
A Lua library which contains tons of useful functions that base Lua should have had.
The library currently lacks in some areas, which will be further completed in future updates

# Install Guide
## LuaRocks (Recommended)

### 1. Install LuaRocks
https://github.com/luarocks/luarocks/blob/main/docs/download.md

### 2. Install shiba-utils

#### Terminal Command
Run in the terminal: <br>
`luarocks install shiba-utils`

#### Rockspec File
Download the rockspec here: <br>
https://luarocks.org/modules/shibathedeveloper/shiba-utils <br>

Navigate to it in the terminal: <br>
`cd ~/Downloads/` <br>

Then install it using LuaRocks: <br>
`luarocks install REPLACE-WITH-FILE-NAME.rockspec`

### Installation Notes
- Works on **Linux**, **Windows** and **macOS**.
- Automatically manages updates.

## Manual
If you prefer **not to use LuaRocks**, you can install `shiba-utils` manually:

### 1. Clone the repository
`git clone https://github.com/ShibaTheDeveloper/lua-utils.git` <br>
`cd lua-utils`

### 2. Add `modules/` to your Lua path
#### Linux / macOS (bash/zsh)
`export LUA_PATH="$PWD/modules/?.lua;;"`

#### Windows (PowerShell)
`$env:LUA_PATH = "$PWD\modules\?.lua;$env:LUA_PATH"`

### Installation Notes
- Works on **Linux**, **Windows** and **macOS**.
- Does **NOT** automatically manage updates.

# Additions
It is **highly recommended** to read the code and its comments to figure out how to use it.

- **color.lua** - Basic color utilities and conversions
- **id-manager.lua** - A simple ID manager that generates unique numeric IDs and reuses released IDs to avoid gaps.
- **math.lua** - Extended math functions like clamp
- **quadtrees.lua** - Spatial quadtree data structure
- **string.lua** - String formatting and manipulation
- **table.lua** - table utilities (eg. shallowClone, merge, etc.)

# Usage example
```lua
local math = require("shiba-utils.math") -- This will not shadow the original library's functions, as shown further in the example

-- Returns and prints 4
local clamped = math.clamp(5, 0, 4) -- x, min, max
print(clamped)

-- The original lua library's functions can still be used
-- Returns and prints 2
local sqrt = math.sqrt(clamped)
print(sqrt)
```
