local ls = require('luasnip')
local fmt = require('luasnip.extras.fmt').fmt
ls.add_snippets("python", {

    -- New project template
    ls.s(
    "template",
      fmt(
        [[
          #!/usr/bin/env python


          def main():
              {}


          if __name__ == "__main__":
              main()
        ]],
        { ls.insert_node(0) }
      )
    ),

    -- python shebang
    ls.s(
      "shebang",
      fmt(
        [[
          #!/usr/bin/env python{}
        ]],
        {
          ls.insert_node(0);
        }
      )
    ),

    -- function
    ls.s(
      "def",
      fmt(
        [[
          def {}({}) -> {}:
              {}
        ]],
        { ls.insert_node(1), ls.insert_node(2), ls.insert_node(3, "None"), ls.insert_node(0, "pass") }
      )
    ),

    -- python printf snippet
    ls.s(
      "print",
      fmt(
        [[
          print("{}");
        ]],
        { ls.insert_node(1) }
      )
    ),

    -- Function docstring
    ls.s("docstring", fmt(
      [[
      """
      {}
      """
      ]], { ls.insert_node(0) }
      )
    ),

    -- Function docstring parameters
    ls.s("docparam", fmt(
      [[
      Parameters
      ----------
      {}
      ]], {ls.insert_node(0, {"arg : int", "\tDescription of `arg`."})})
    ),

    -- Function docstring returns
    ls.s("docreturn", fmt(
      [[
      Returns
      -------
      {}
      ]], {ls.insert_node(0, {"int", "\tDescription integer."})})
    ),




  }, {
    key = "python",
  }
)
