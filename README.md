# Notice
Library is incomplete, working on making it a package and finishing functionality.

## Install Guide

### 1. Using LuaRocks (Recommended, cross-platform)

luarocks install lua-utils

- Works on Linux, Windows, macOS.
- Automatically installs all modules and manages updates.

### 2. Manual Installation

#### Linux / macOS

`git clone https://github.com/ShibaTheDeveloper/lua-utils.git
cd lua-utils`

- Place the `modules/` folder somewhere in your Lua path, e.g.:

export LUA_PATH="$PWD/modules/?.lua;;"

#### Windows (PowerShell)

git clone https://github.com/ShibaTheDeveloper/lua-utils.git
cd lua-utils

- Add the `modules/` folder to your Lua path in PowerShell:

$env:LUA_PATH = "$PWD\modules\?.lua;$env:LUA_PATH"

- This allows Lua to `require` your modules from the cloned folder.

# What does this add?
Check out the code. It's commented enough to help you understand what's happening without you getting absorbed into comment hell (for the most part).

# Example
```lua
local math = require("lua-utils.math")

-- Returns and prints 4
local clamped = math.clamp(5, 0, 4) -- x, min, max
print(clamped)

-- The original lua library's functions can still be used
-- Returns and prints 2
local sqrt = math.sqrt(clamped)
print(sqrt)
```
