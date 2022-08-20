local ls = require "luasnip"
local fmt = require("luasnip.extras.fmt").fmt


ls.snippets = {


  sh = {
    ls.parser.parse_snippet("sst", "#!/usr/bin/env sh"),
    ls.parser.parse_snippet("shebang", "#!/usr/bin/env sh"),
    ls.parser.parse_snippet("hello", "printf \"Hello world!\\n\""),
    -- getopts, for, while, dowhile, if, else, elif, func
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
}

