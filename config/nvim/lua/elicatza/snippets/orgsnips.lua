local ls = require('luasnip')
local fmt = require('luasnip.extras.fmt').fmt

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

      -- code block
      ls.s(
        "codeblock",
        fmt(
          [[
            ```{}
            {}
            ```
          ]],
          {
            ls.insert_node(1),
            ls.insert_node(0),
          }
        )
      ),

    }, {
      key = "org",
  }
)
