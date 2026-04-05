local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
---@diagnostic disable-next-line: undefined-field
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("config")
require("keymaps")

require("lazy").setup({
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.config").setup({
        auto_install = true,
        ensure_installed = { "c", "cpp", "lua", "glsl", "cmake", "java", "go", "javascript", "typescript" },
        highlight = { enable = true },
      })
    end,
  },
  { "numToStr/Comment.nvim", event = "VeryLazy" },
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
  { "sphamba/smear-cursor.nvim", event = "VeryLazy", opts = {} },
})

require("commands")

-- Colorscheme
vim.cmd.colorscheme("habamax")
vim.api.nvim_set_hl(0, "Normal",     { bg = "#1c1c1c" })
vim.api.nvim_set_hl(0, "NormalNC",   { bg = "#1c1c1c" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "#1c1c1c" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2a2a2a" })
vim.api.nvim_set_hl(0, "LineNr",     { fg = "#555555", bg = "#1c1c1c" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#aaaaaa", bg = "#1c1c1c" })
