require('config.lazy')

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.hlsearch = false
vim.opt.wrap = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.modeline = false
vim.opt.incsearch = true


vim.g.user = {
  leaderkey = ' ',
  transparent = false,
  event = 'UserGroup',
}

vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>')
vim.keymap.set({'n', 'x'}, 'x', '"_x')
vim.keymap.set({'n', 'x'}, 'X', 'x')
vim.keymap.set({'n', 'x'}, 'd', '"_d')
vim.keymap.set({'n', 'x'}, 'D', 'd')
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y')
vim.keymap.set({'n', 'v'}, '<leader>p', '"+p')
vim.keymap.set({'n', 'v'}, '<leader>P', '"+P')

vim.api.nvim_create_augroup(vim.g.user.event, {})
vim.api.nvim_create_autocmd('BufReadPost', {
  group = vim.g.user.event,
  callback = function(args)
    local valid_line = vim.fn.line([['"]]) >= 1 and vim.fn.line([['"]]) < vim.fn.line('$')
    local not_commit = vim.b[args.buf].filetype ~= 'commit'

    if valid_line and not_commit then
      vim.cmd([[normal! g`"]])
    end
  end,
  desc = "Continue cursor where last left off at file close"
})

