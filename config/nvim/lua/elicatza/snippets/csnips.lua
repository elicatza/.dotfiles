local ls = require('luasnip')
local fmt = require('luasnip.extras.fmt').fmt
ls.add_snippets("c", {

    -- New project template
    ls.s(
    "template",
      fmt(
        [[
          #include <stdio.h>


          int main(int argc, char *argv[]) {{
            {}

            return EXIT_SUCCESS;
          }}
        ]],
        { ls.insert_node(0) }
      )
    ),

    -- main function
    ls.s(
      "main",
      fmt(
        [[
          int main(int argc, char *argv[]) {{
              {}
              return 0;
          }}
        ]],
        {
          ls.insert_node(0);
        }
      )
    ),

    -- if statement
    ls.s(
      "if",
      fmt(
        [[
          if ({}) {{
            {}
          }}
        ]],
        { ls.insert_node(1), ls.insert_node(0) }
      )
    ),

    -- else if statement
    ls.s(
      "else if",
      fmt(
        [[
          else if ({}) {{
            {}
          }}
        ]],
        { ls.insert_node(1), ls.insert_node(0) }
      )
    ),

    -- else statement
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

    -- for loop
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

    -- while loop
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

    -- do while loop
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

    -- enum
    ls.s(
      "enum",
      fmt(
        [[
          enum {} {{
              {};
          }}
        ]],
        {
          ls.insert_node(1),
          ls.insert_node(0),
        }
      )
    ),

    -- struct
    ls.s(
      "struct",
      fmt(
        [[
          struct {} {{
              {};
          }}
        ]],
        {
          ls.insert_node(1),
          ls.insert_node(0),
        }
      )
    ),

    -- switch
    ls.s(
      "switch",
      fmt(
        [[
          switch ({}) {{
              default:
              {}
              break;
          }}
        ]],
        {
          ls.insert_node(1),
          ls.insert_node(0),
        }
      )
    ),

    -- case
    ls.s(
      "case",
      fmt(
        [[
          case {}:
              {}
              break;
        ]],
        {
          ls.insert_node(1),
          ls.insert_node(0),
        }
      )
    ),

    -- function
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

    -- C read from Stdin snippet
    ls.s(
      "read_stdin",
      fmt(
        [[
          {{
            char input_buffer[{}];
            while (fgets(input_buffer, sizeof input_buffer, stdin) != NULL) {{
              if (input_buffer[strlen(input_buffer) - 1] == '\n') {{
                /* read full line */
                {}

              }} else {{
                /* line was truncated */
                fprintf(stderr, "Line too long. Could not read input.\n");
                exit(EXIT_FAILURE);
              }}
            }}
          }}
        ]],
        {
          ls.insert_node(1, "BUFSIZ"),
          ls.insert_node(0),
        }
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
        { ls.insert_node(1, "stderr"), ls.insert_node(0) }
      )
    ),

    -- TODO malloc, calloc, realloc, free, flags
  }, {
    key = "c",
  }
)
