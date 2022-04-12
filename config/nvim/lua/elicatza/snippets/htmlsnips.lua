local ls = require('luasnip')
local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets("html", {
    -- HTML doctype
    ls.s(
      "doctype",
      fmt(
        [[
          <!DOCTYPE html>{}
        ]],
        { ls.insert_node(0) }
      )
    ),

    -- starting template
    ls.s(
      "template",
      fmt(
        [[
          <!DOCTYPE html>
          <html lang="en">
            <head>
              <meta charset="utf-8">
              <title>{}</title>
              <link rel="stylesheet" href="./style.css">
            </head>

            <body>
              {}
              <script src="./index.js"></script>
            </body>
          </html>
        ]],
        {
          ls.insert_node(1),
          ls.insert_node(0),
        }
      )
    ),

  },
  {
    key = "html",
  }
)
