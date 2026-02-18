local table = require("table")

local Quadtree = {
    width = 100,
    height = 100,

    x = 0,
    y = 0,

    capacity = 4,
    parent = nil,

    divided = false,

    children = {},
    points = {}
}
Quadtree.__index = Quadtree

local Module = {}

--[[
Example of a "point"

local point = {
    x = 50,
    y = 25
}
]]

--[[
Checks for all points inside a rectangle

range = {
    height = num,
    width = num,

    x = num,
    y = num,
}
]]

-- Check if a range has a point inside
local function contains(range, point)
    return point.x >= range.x
        and point.x < range.x + range.width
        and point.y >= range.y
        and point.y < range.y + range.height
end

function Quadtree:rectangularQuery(range)
    local found = {}

    if not self:intersectsRange(range) then return found end

    for _, point in ipairs(self.points) do
        if not contains(range, point) then goto continue end
        table.insert(found, point)

        :: continue ::
    end

    if self.divided then

        for _, child in ipairs(self.children) do

            local results = child:rectangularQuery(range)
            for _, point in ipairs(results) do
                table.insert(found, point)
            end

        end

    end

    return found
end

--[[
Checks for all points inside a radius

center = {x, y}
radius = num
]]

function Quadtree:circularQuery(center, radius)
    local found = {}

    return found
end

-- Basically just a wrapper for contains(quadtree, point)
function Quadtree:contains(point)
    return contains(self, point)
end

-- Check if the quadtree intersects a range
function Quadtree:intersectsRange(range)
    return not (self.x + self.width < range.x or self.x > range.x + range.width
           or self.y + self.height < range.y or self.y > range.y + range.height)
end

-- Inserts new point into the quadtree
function Quadtree:insert(point)
    local contains = self:contains(point)
    if not contains then return false end

    if not self.divided and #self.points < self.capacity then
        table.insert(self.points, point)
        return true
    end

    if not self.divided then
        self:subdivide()
    end

    for _, child in ipairs(self.children) do
        if child:insert(point) then
            return true
        end
    end

    return false
end

-- Subdivide the quadtree
function Quadtree:subdivide()
    local halfX = self.width / 2
    local halfY = self.height / 2

    local offsets = {
        {0, 0},
        {halfX, 0},
        {0, halfY},
        {halfX, halfY}
    }

    for _, offset in ipairs(offsets) do
        local child = Module:createQuadtree({
            width = halfX,
            height = halfY,

            x = self.x + offset[1],
            y = self.y + offset[2],

            capacity = self.capacity,
            parent = self
        })

        table.insert(self.children, child)
    end

    -- Redistribute points between new children
    for _, point in ipairs(self.points) do

        for _, child in ipairs(self.children) do

            if child:insert(point) then
                break
            end

        end

    end

    self.divided = true
    self.points = {}
end

-- Create a quadtree
function Module:createQuadtree(data)
    local quadtree = setmetatable({
        width = data.width or 100,
        height = data.height or 100,

        x = data.x or 0,
        y =  data.y or 0,

        capacity = data.capacity or 4,
        parent = data.parent or nil,

        divided = false,

        children = {},
        points = {}
    }, Quadtree)

    for _, point in ipairs(data.points or {}) do
        quadtree:insert(point)
    end

    return quadtree
end

return Module