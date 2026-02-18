# Notice
Library is incomplete, working on making it a package and finishing functionality.

# How do I use it?
Using the library is very straightforward:

1. Add it to your project.
2. `require` one of its modules where needed. Don't worry about shadowing the original library, its functions will stay.
3. Start using it.

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
