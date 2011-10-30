--[[
Author: Darren Schnare
Keywords: lua,module,context
License: MIT ( http://www.opensource.org/licenses/mit-license.php )
Repo: https://github.com/dschnare/Context-Lua

This module exports an opt-in contextual Lua module loader. That is instead
of overriding the global 'require' function, contextually requiring modules
is an opt-in endeavour.

This means that 'legacy' code can be used alongside contextually aware code.
--]]

local stack = {}

function createContext()
  local loaded = {}

  local context = {
    -- A convenience function to create a new context.
    create = createContext,
    -- Reserve space for our contextual 'require'.
    require = ''
  }

  context.require = function(modname)
    -- If a module has already been loaded with the specified name
    -- in this context then we just return that value immediately.
    if (loaded[modname]) then return loaded[modname] end

    -- Temporarily clear any module with the same name in the global context.
    local globalModule = package.loaded[modname]
    package.loaded[modname] = nil

    table.insert(stack, context)

    -- Attempt to load the module.
    loaded[modname] = require(modname)

    table.remove(stack)

    -- Restore the module with the same name in the global context.
    package.loaded[modname] = globalModule

    return loaded[modname]
  end

  return context
end

-- Set the current context to the global context.
table.insert(stack, {
  create = createContext,
  require = require
})


return {
  --[[
    Returns the context that loaded the current module or the global context.
    Contexts are tables with the following properties:
      function require(modname) - Requires the specified module by loading it into the context and returning the result.
      function create() - Creates a new context.
  --]]
  current = function()
    return stack[#stack]
  end,
  --[[
    Creates a new context. Returns a table with the following properties:
      function require(modname) - Requires the specified module by loading it into the context and returning the result.
      function create() - Creates a new context.
  --]]
  create = function()
      return createContext()
  end
}