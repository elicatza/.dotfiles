local ls = require('luasnip')
local fmt = require('luasnip.extras.fmt').fmt


-- Snippets for all filetypes
ls.add_snippets("all", {

    ls.parser.parse_snippet("expand", "-- this is what was expanded!"),

    -- Current date
    ls.s(
      -- YYYY-MM-DD
      "curdate",
      ls.function_node(function()
        return os.date("%Y-%m-%d")
      end)
    ),

    -- Current time
    ls.s(
      -- hh:mm
      "curtime",
      ls.function_node(function()
        return os.date("%H:%M")
      end)
    ),

    -- URI
    ls.s(
      "https",
      fmt(
        [[
          https://{}
        ]],
        {
          ls.insert_node(0, "example.com"),
        }
      )
    )
  },
  {
    key = "all"
  }
)

