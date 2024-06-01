-- Lazy.nvim config
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")

-- Function to save the file and run latexmk
local function save_and_compile_bad()
  -- Save the current file
  vim.cmd('write')
  
  -- Get the current file name
  local filename = vim.fn.expand('%:p')
  
  -- Check if the file is a .tex file
  if string.match(filename, '%.tex$') then
    -- Construct the command
    local command = 'latexmk -pdf ' .. filename
    
    -- Run the command
    vim.fn.system(command)
    
    -- Notify the user
    print('Ran: ' .. command)
	vim.fn.system('zathura ' .. string.gsub(filename, '%.tex$', '.pdf') .. ' &')
  else
    print('Not a .tex file')
  end
end

local function save_and_compile()
  -- Save the current file
  vim.cmd('write')

  -- Get the current file name
  local filename = vim.fn.expand('%:p')
  local pdf_filename = string.gsub(filename, '%.tex$', '.pdf')

  -- Check if the file is a .tex file
  if string.match(filename, '%.tex$') then
    -- Construct the command
    local command = 'latexmk -pdf ' .. filename

    -- Run the command
    vim.fn.jobstart(command, {
      on_stdout = function(_, data)
        if data then
          for _, line in ipairs(data) do
            print(line)
          end
        end
      end,
      on_stderr = function(_, data)
        if data then
          for _, line in ipairs(data) do
            print('Error: ' .. line)
          end
        end
      end,
      on_exit = function(_, exit_code)
        if exit_code == 0 then
          -- Check if the PDF is already open in Zathura
          local check_command = 'xdotool search --name "' .. pdf_filename .. '"'
          local result = vim.fn.systemlist(check_command)

          if #result == 0 then
            -- Run Zathura in the background if it's not already open
            local zathura_command = 'zathura ' .. pdf_filename
            vim.fn.jobstart(zathura_command, {detach = true})
            print('Opened Zathura with ' .. pdf_filename)
          else
            print(pdf_filename .. ' is already open in Zathura.')
          end
        else
          print('latexmk command failed with exit code: ' .. exit_code)
        end
      end,
    })
  else
    print('Not a .tex file')
  end
end

-- Create the custom command :Wc
--vim.api.nvim_create_user_command('Wc', save_and_compile, {})


-- Create the custom command :Wc
vim.api.nvim_create_user_command('Wc', save_and_compile, {})
