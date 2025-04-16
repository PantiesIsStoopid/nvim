local M = {}

function M.AutoUpdate()
  local Git = require("plenary.job")

  local RepoUrl = "https://github.com/pantiesisstoopid/nvim"
  local ConfigPath = vim.fn.stdpath("config")

  Git:new({
    command = "git",
    args = { "-C", ConfigPath, "remote", "get-url", "origin" },
    on_exit = function(j)
      if j:result()[1] == RepoUrl then
        Git:new({
          command = "git",
          args = { "-C", ConfigPath, "fetch" },
          on_exit = function()
            Git:new({
              command = "git",
              args = { "-C", ConfigPath, "rev-list", "HEAD...origin/master", "--count" },
              on_exit = function(diff)
                if tonumber(diff:result()[1]) > 0 then
                  vim.schedule(function()
                    vim.notify("Updating Neovim config...", vim.log.levels.INFO)
                  end)
                  Git:new({
                    command = "git",
                    args = { "-C", ConfigPath, "pull" },
                    on_exit = function()
                      vim.schedule(function()
                        vim.notify("Neovim config updated. Please restart Neovim.", vim.log.levels.WARN)
                      end)
                    end,
                  }):start()
                end
              end,
            }):start()
          end,
        }):start()
      end
    end,
  }):start()
end

return M

