local ls = require('luasnip')
local fmt = require('luasnip.extras.fmt').fmt

-- Generate a unique string
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

-- Snippet
ls.add_snippets("org", {
  ls.s("new_card", fmt(
    [[
  #+begin_src toml
  [{}.{}]
  front = "{}"
  back = "{}"
  tags = ["{}"]
  #+end_src{}
  ]], {
      ls.choice_node(1, {ls.text_node("basic"), ls.text_node("cloze"), ls.text_node("type"), ls.text_node("reversed"), ls.text_node("reversed_optional")}),
      ls.function_node(function() return uid(8) end),
      ls.insert_node(2), ls.insert_node(3), ls.insert_node(4), ls.insert_node(0),
    })),

  ls.s("list_html", fmt(
    [[
    <ul>
    <li>{}</li>
    </ul>
    ]], {
      ls.insert_node(0),
    })),
})
