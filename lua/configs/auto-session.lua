local auto_session = require "auto-session"
auto_session.setup {
  auto_restore_enabled = false,
  auto_save = true,
  auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
  use_git_branch = true, -- Include git branch name in session name
}
