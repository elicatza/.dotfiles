local ls = require('luasnip')
local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets("sh", {
    -- shebang
    ls.s(
      "shebang",
      fmt(
        [[
          #!/usr/bin/env sh{}
        ]],
        {
          ls.insert_node(0),
        }
      )
    ),

    ls.s(
      "dependencies",
      fmt(
        [[
          dependencies=( "{}" )
          for i in "${{dependencies[@]}}"
          do
              command -v $i > /dev/null 2>&1 || {{
                  printf "${{i}} is required!\n";
                  exit 1;
              }}
          done{}
        ]],
        {
          ls.insert_node(1, "dependency"),
          ls.insert_node(0),
        }
      )
    ),

  },
  {
    key = "sh",
  }
)
