require("nvim-tree").setup({
  sort_by = "case_sensitive",
  open_on_tab = true,
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "-", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
    custom = {"^.git$", "__pycache__"}
  },
  git = {
      ignore = false,
  },
  actions = {
      change_dir = {
          restrict_above_cwd = true,
      }
  }
})
