local ls = require('luasnip')
local fmt = require('luasnip.extras.fmt').fmt

local function uid(len)
  local uid_chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ01234567890"
  local rt = ""
  for _ = 1, len do
    local rand_int = math.random(1, #uid_chars)
    local rand_char = uid_chars:sub(rand_int, rand_int)
    rt = rt .. rand_char
  end
  return rt
end


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
    ),

    ls.s("uid", fmt(
      [[
      {}
      ]], {
          ls.function_node(function() return uid(8) end),
        }
      )
    )

  },
  {
    key = "all"
  }
)

