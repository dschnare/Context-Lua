print('a.lua executed')

local context = require('context').create()

local imports = {
    -- C will be loaded/executed into our custom context.
    c = context.require('c')
}