local ls = require('luasnip')
local fmt = require('luasnip.extras.fmt').fmt

local function norsk_date()
  return os.date("%d.%m.%Y")
end

ls.add_snippets("tex", {

    ls.s(
    "template",
      fmt(
        [[
\documentclass[12pt, letterpaper]{article}

\title{\textbf{<>}}
\author{<>}
\date{<>}

\begin{document}
\maketitle
\tableofcontents
\section{Introduction}
<>
\end{document}
        ]],
      {
        ls.insert_node(1, "title"),
        ls.insert_node(2, "Eliza Clausen"),
        ls.insert_node(3, norsk_date()),
        ls.insert_node(4),
      }, {
        delimiters = "<>",
      })
    ),

})
