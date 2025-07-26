local M = {}

M.open_terminal_in_file_dir = function()
  local file_dir = vim.fn.expand("%:p:h")

  if file_dir == "" then
    vim.notify("No file directory found", vim.log.levels.WARN)
    return
  end

  -- Open a horizontal split terminal, with cwd set to file_dir
  vim.cmd("belowright split")
  vim.cmd("term")
  vim.b.terminal_cwd = file_dir
  vim.fn.chansend(vim.b.terminal_job_id, "cd " .. file_dir .. "\n")
end

return M
