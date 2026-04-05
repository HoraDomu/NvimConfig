-- Remove comment continuation on new lines
vim.api.nvim_create_autocmd('BufWinEnter', {
  callback = function()
    vim.opt.formatoptions:remove({ 'c', 'o' })
  end
})

-- Flash highlight on yank
vim.api.nvim_set_hl(0, "HighlightedYankRegion", { bg = "#335533", fg = "NONE" })
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = "HighlightedYankRegion", timeout = 300 })
  end,
})

-- Screenshot mode — hides all UI chrome
local screenshot_mode = false
vim.api.nvim_create_user_command('ScreenshotMode', function()
  screenshot_mode = not screenshot_mode
  if screenshot_mode then
    vim.opt.number         = false
    vim.opt.relativenumber = false
    vim.opt.signcolumn     = "no"
    vim.opt.laststatus     = 0
    vim.opt.showmode       = false
    vim.opt.cmdheight      = 0
    vim.opt.colorcolumn    = ""
    if vim.g.neovide_scale_factor then vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.4 end
  else
    vim.opt.number         = true
    vim.opt.relativenumber = true
    vim.opt.signcolumn     = "yes"
    vim.opt.laststatus     = 2
    vim.opt.cmdheight      = 1
    if vim.g.neovide_scale_factor then vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.4 end
  end
end, {})

vim.api.nvim_create_user_command('MatchClear', function()
  vim.fn.clearmatches()
end, {})
