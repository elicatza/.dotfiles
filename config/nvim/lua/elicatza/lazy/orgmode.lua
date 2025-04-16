return {
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  dependencies = {
    "nvim-orgmode/telescope-orgmode.nvim",
    "nvim-telescope/telescope.nvim",
  },
  ft = { 'org' },
  config = function()
    require('orgmode').setup({
      org_agenda_files = { '~/doc/org/agenda/**/*' },
      org_default_notes_file = '~/doc/org/todo.org',
      org_archive_location = '~/doc/org/archive/agenda/calendar.org',
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

    require("telescope").load_extension("orgmode")
    vim.keymap.set("n", "<leader>tr", require("telescope").extensions.orgmode.refile_heading)
  end,
}

