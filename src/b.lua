print('b.lua executed')

local context = require('context').current()

local imports = {
    -- D will be loaded/executed into the current context.
    d = context.require('d')
}