>   Author: Darren Schnare

>   Keywords: lua,module,context

>   License: MIT ( http://www.opensource.org/licenses/mit-license.php )

>   Repo: https://github.com/dschnare/Context-Lua


Context Lua
====================

Context Lua is an opt-in contextual Lua module loader. That is instead
of overriding the global 'require' function, contextually requiring modules
is an opt-in endeavour.

This means that 'legacy' code can be used alongside contextually aware code.

The real-world use cases for this module may be limited due to the nature of
module loading in Lua, but when a module exports are mutable, Context Lua offers
a clean mechanism for loading fresh versions of any module into a context.


Installation
--------------------

The `src/context.lua` file is the source file with inline commenting explaining its usage.

The `src/example.lua` file is the entry point for a simple test demonstrating `context.lua`.


Running the example
--------------------

To run the example change to the `src/` directory and run Lua with `example.lua`.

    pushd src
    lua5.1 example.lua
    popd