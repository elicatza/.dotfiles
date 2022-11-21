
-- Load custom tree-sitter grammar for org filetype
-- require('orgmode').setup_ts_grammar()

-- Tree-sitter configuration
require('nvim-treesitter.configs').setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {'org'}, -- Required for spellcheck, some LaTex highlights and code block highlights that do not have ts grammar
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup_ts_grammar()
require('orgmode').setup({
  org_agenda_files = { '~/doc/org/**/*' },
  org_default_notes_file = '~/doc/org/todo.org',
  org_archive_location = '~/doc/org/archive',
  org_hide_leading_stars = true,
  org_hide_emphasis_markers = true,
  org_capture_templates = {
    d = {
      description = 'Diary',
      template = '\n** %<%Y-%m-%d> %<%A>\n*** %U\n    %?',
      target = '~/doc/org/diary.org'
    },
    t = {
      description = 'TODO',
      template = '** %?\n',
    },
    e = 'Event',
    er = {
      description = 'recurring',
      template = '** %?\n   SCHEDULED: <%<%Y-%m-%d %H:%M +7d>>\n   %u\n',
      target = '~/doc/org/agenda/calendar.org',
      headline = 'Tasks'
    },
    eo = {
      description = 'once',
      template = '** %?\n   SCHEDULED: %T\n   %u\n',
      target = '~/doc/org/agenda/calendar.org',
      headline = 'Tasks'
    }
  }
})

-- require('cmp').setup({
  -- sources = {
    -- { name = 'orgmode' }
  -- }
-- })
-- Set configuration for specific filetype.

-- init.lua

-- require('orgmode').setup({
--  org_agenda_files = {'~/Dropbox/org/*', '~/my-orgs/**/*'},
--  org_default_notes_file = '~/Dropbox/org/refile.org',
-- })
