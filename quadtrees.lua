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

function Quadtree:rectangularQuery(range)
    --%note TBA
end

--[[
Checks for all points inside a radius

center = {x, y}
radius = num
]]

function Quadtree:circularQuery(center, radius)
    --%note TBA
end

-- Check if the quadtree has a point inside
function Quadtree:contains(point)
    return point.x >= self.x
        and point.x < self.x + self.width
        and point.y >= self.y
        and point.y < self.y + self.height
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

    local childA = Module:createQuadtree({
        width = halfX,
        height = halfY,

        x = self.x,
        y = self.y,

        capacity = self.capacity,
        parent = self
    })
    table.insert(self.children, childA)

    local childB = Module:createQuadtree({
        width = halfX,
        height = halfY,

        x = self.x + halfX,
        y = self.y,

        capacity = self.capacity,
        parent = self
    })
    table.insert(self.children, childB)

    local childC = Module:createQuadtree({
        width = halfX,
        height = halfY,

        x = self.x,
        y = self.y + halfY,

        capacity = self.capacity,
        parent = self
    })
    table.insert(self.children, childC)

    local childD = Module:createQuadtree({
        width = halfX,
        height = halfY,

        x = self.x + halfX,
        y = self.y + halfY,

        capacity = self.capacity,
        parent = self
    })
    table.insert(self.children, childD)

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