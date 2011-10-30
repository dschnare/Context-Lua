local context = require('context').create()

local imports = {
    -- A will be loaded/executed.
    a = context.require('a'),
    -- B will be loaded/executed.
    b = context.require('b'),
    -- C will also be loaded/executed because module
    -- 'a' loaded module 'c' into a custom context, so
    -- this is our very own version of 'c'.
    c = context.require('c'),
    -- D will not be loaded/executed because module 'b'
    -- already loaded it into this context.
    d = context.require('d')
}

--[[
Output
-- From loading module 'a' in 'example.lua'
a.lua executed
-- From loading module 'c' in 'a.lua'
c.lua executed
-- From loading module 'b' in 'example.lua'
b.lua executed
-- From loading module 'd' in 'b.lua'
d.lua executed
-- From loading module 'c' in 'example.lua'
c.lua executed
--]]