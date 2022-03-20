local ls = require "luasnip"
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep


ls.snippets = {
  -- TODO Implement
  -- Random number snippit
  -- -- node 1(min value, default = 0)
  -- -- node 2(max value, default = 10)
  -- -- node 3(number of random numbers)
  -- -- node 4(separator, default = ", ")


  all = {
    -- Snippets for all filetypes
    ls.parser.parse_snippet("expand", "-- this is what was expanded!"),

    ls.s("rand", fmt(
      [[
        min: {}, max: {}, amount: {}, separator: {}, out: {}
      ]],
      {
        ls.insert_node(1, "0"),
        ls.insert_node(2, "10"),
        ls.insert_node(3, "10"),
        ls.insert_node(4, ", "),

        ls.function_node(function(arg)
          if (tonumber(arg[1][1]) == nil) then
            return "min is NAN"
          end

          if (tonumber(arg[2][1]) == nil) then
            return "max is NAN"
          end

          if (tonumber(arg[3][1]) == nil) then
            return "amount is NAN"
          end


          local return_value = ""
          if (tonumber( arg[3][1]) >= 1) then
            return_value = return_value .. tostring(math.random(tonumber(arg[1][1]), tonumber(arg[2][1])))
          end

          for i = 1, tonumber(arg[3][1]) - 1, 1 do
            return_value = return_value .. arg[4][1] .. tostring(math.random(tonumber(arg[1][1]), tonumber(arg[2][1])))
          end


          return return_value or "Fail end"
        end, { 1, 2, 3, 4 }),
      }
      )
    ),
    -- rand snippet
    ls.s(
      "rand",
      fmt(
        [[
          Min: {}, Max: {}, Amount: {}, Seperator: {}
        ]],
        {
          ls.insert_node(1, "0"),
          rep(1),
          ls.insert_node(2, "10"),
          ls.insert_node(3, ", "),
        }
      )
    ),

    ls.s(
      -- YYYY-MM-DD
      "curdate",
      ls.function_node(function()
        return os.date("%Y-%m-%d")
      end)
    ),
    ls.s(
      -- hh:mm
      "curtime",
      ls.function_node(function()
        return os.date("%H:%M")
      end)
    ),

  },

  lua = {
    ls.s(
      "bac",
      fmt(
        [[
          Benita Anotnia Clausen er {}
        ]],
        { ls.choice_node(1, {ls.text_node("kul"), ls.text_node("ikke kul"), ls.text_node("veldig kul") }) }
      )
    ),
    -- Snippets for all lua
  },

  c = {
    ls.s(
      -- C Starting template
      "st",
      fmt(
        [[
          #include <stdio.h>
          #include <stdlib.h>


          int main(int argc, char *argv[]) {{
              {}
              return 0;
          }}
        ]],
        { ls.insert_node(1) }
      )
    ),

    ls.s(
    "hello",
    fmt(
      [[
        #include <stdio.h>


        int main() {{
            printf("Hello world!\n");
            {}
            return 0;
        }}
      ]],
      { ls.insert_node(1) }
      )
    ),

    -- C if snippet
    ls.s(
      "if",
      fmt(
        [[
          if ({}) {{
              {}
          }}
        ]],
        { ls.insert_node(1), ls.insert_node(2) }
      )
    ),

    -- C else if snippet
    ls.s(
      "elif",
      fmt(
        [[
          else if ({}) {{
              {}
          }}
        ]],
        { ls.insert_node(1), ls.insert_node(2) }
      )
    ),

    -- C else snippet
    ls.s(
      "else",
      fmt(
        [[
          else {{
              {}
          }}
        ]],
        { ls.insert_node(1) }
      )
    ),

    -- C for snippet
    ls.s(
      "for",
      fmt(
        [[
          for (i = 0; i < {}; ++i) {{
              {}
          }}
        ]],
        { ls.insert_node(1), ls.insert_node(2) }
      )
    ),

    -- C while snippet
    ls.s(
      "while",
      fmt(
        [[
          while ({}) {{
              {}
          }}
        ]],
        { ls.insert_node(1), ls.insert_node(2) }
      )
    ),

    -- C do while snippet
    ls.s(
      "dowhile",
      fmt(
        [[
          do {{
              {}
          }} while ({})
        ]],
        { ls.insert_node(2), ls.insert_node(1) }
      )
    ),

    -- C function snippet
    ls.s(
      "func",
      fmt(
        [[
          {} {}({}) {{
              {}
              return {};
          }}
        ]],
        { ls.insert_node(1, "int"), ls.insert_node(2), ls.insert_node(3), ls.insert_node(5), ls.insert_node(4) }
        -- TODO
        -- Have type pick + default return value associated with function type
        -- int -> return 0;
        -- void -> return;
        -- char * -> return NULL;
      )
    ),

    -- C printf snippet
    ls.s(
      "print",
      fmt(
        [[
          printf("{}\n");
        ]],
        { ls.insert_node(1) }
      )
    ),

    -- C printf snippet
    ls.s(
      "fprint",
      fmt(
        [[
          fprintf({}, "{}\n");
        ]],
        { ls.insert_node(1), ls.insert_node(2) }
      )
    ),

    -- TODO malloc, calloc, realloc, free
  },

  sh = {
    ls.parser.parse_snippet("sst", "#!/usr/bin/env sh"),
    ls.parser.parse_snippet("shebang", "#!/usr/bin/env sh"),
    ls.parser.parse_snippet("hello", "printf \"Hello world!\\n\""),
    -- getopts, for, while, dowhile, if, else, elif, func
  },

  markdown = {
    ls.parser.parse_snippet("curreading", "To Paradise by Hanya Yanagihara"),
    -- ls.s("curreading", fmt([[To Paradise by Hanya Yanagihara]])),
    -- Table, link, image
  },
}

