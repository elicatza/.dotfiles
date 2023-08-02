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


ls.add_snippets("org", {
      -- TODO: Table in X by X

      -- link
      ls.s(
        "link",
        fmt("[[{}][{}]]{}",
          {
            ls.insert_node(1, "URI"),
            ls.insert_node(2, "name"),
            ls.insert_node(0),
          }
        )
      ),

      -- image
      ls.s(
        "img",
        fmt(
          [[
            ![{}]({}){}
          ]],
          {
            ls.insert_node(1, "alt"),
            ls.insert_node(2, "img"),
            ls.insert_node(0),
          }
        )
      ),

      -- Anki cloze
      ls.s("new_card", fmt(
        [[
        #+begin_src toml
        [{}.{}]
        front = '{}'
        back = '{}'
        tags = ['{}']
        #+end_src{}
        ]], {
          ls.choice_node(1, {ls.text_node("basic"), ls.text_node("cloze"), ls.text_node("type"), ls.text_node("reversed"), ls.text_node("reversed_optional")}),
          ls.function_node(function() return uid(8) end),
          ls.insert_node(2), ls.insert_node(3), ls.insert_node(4, "Deutsch"), ls.insert_node(0),
          }
        )
      ),
    }
  )
