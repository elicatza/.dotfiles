
-- Load custom tree-sitter grammar for org filetype
-- require('orgmode').setup_ts_grammar()
require('orgmode').setup_ts_grammar()

-- Treesitter configuration (I have it in `./treesitter.lua`

require('orgmode').setup({
  org_agenda_files = { '~/doc/org/agenda/**/*' },
  org_default_notes_file = '~/doc/org/todo.org',
  org_archive_location = '~/doc/org/archive',
  org_hide_leading_stars = true,
  org_hide_emphasis_markers = true,
  org_highlight_latex_and_related = 'entities',
  org_capture_templates = {
    d = {
      description = 'Diary',
      template = '\n** %<%Y-%m-%d> %<%A>\n*** %U\n    %?',
      target = '~/doc/org/diary.org'
    },

    t = 'Task',
    ts = {
      description = 'schedule',
      template = '** TODO %?\n   SCHEDULED: %t\n   %u',
      target = '~/doc/org/agenda/calendar.org',
      headline = 'Refile'
    },
    td = {
      description = 'deadline',
      template = '** TODO %?\n   DEADLINE: %t\n   %u',
      target = '~/doc/org/agenda/calendar.org',
      headline = 'Refile'
    },
    tt = {
      description = 'task',
      template = '** TODO %?\n   %t\n   %u',
      target = '~/doc/org/agenda/calendar.org',
      headline = 'Refile'
    },

    e = 'Event',
    er = {
      description = 'recurring',
      template = '** %?\n   SCHEDULED: %T\n   %u',
      target = '~/doc/org/agenda/calendar.org',
      headline = 'Refile'
    },
    eo = {
      description = 'once',
      template = '** %?\n   SCHEDULED: %T\n   %u',
      target = '~/doc/org/agenda/calendar.org',
      headline = 'Refile'
    }
  }
})

-- Completion configuration in `./nvim-cmp.lua`
