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
local function save_and_compile()
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
	vim.fn.system('zathura ' .. string.gsub(filename, '%.tex$', '.pdf'))
  else
    print('Not a .tex file')
  end
end

-- Create the custom command :Wc
vim.api.nvim_create_user_command('Wc', save_and_compile, {})
