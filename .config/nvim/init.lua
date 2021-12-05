


------------------------------------------------------------
-- Basics
vim.g.bulitin_lsp       = true
--vim.g.python3_host_prog = vim.fn.exepath('python3')


------------------------------------------------------------
-- Behaviors
vim.opt.belloff     = 'all'                                     -- NO BELLS!
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}           -- ins-completion how vsnip likes it
vim.opt.swapfile    = false                                     -- no swap files

vim.opt.inccommand  = 'split'                                   -- preview %s commands in split window as I type
--vim.opt.inccommand  = 'nosplit' 					--Incremental live completion

vim.opt.hidden      = true                                      -- move away from unsaved buffers
-- vim.o.hidden = true --Do not save when switching buffers

vim.opt.updatetime  = 100                                       -- stop typing quickly
--vim.o.updatetime = 250 --Decrease update time

vim.opt.undofile    = true                                      -- keep track of my 'undo's between sessions
-- vim.cmd [[set undofile]] --Save undo history

vim.opt.grepprg     = 'rg --vimgrep --smart-case --no-heading'  -- search with rg
vim.opt.grepformat  = '%f:%l:%c:%m'                             -- filename:line number:column number:error message
vim.o.breakindent = true --Enable break indent

-- vim.opt.mouse       = 'n'                                       -- use mouse to scroll around in normal mode (hold shift to disable)
--vim.o.mouse = 'a' Enable mouse mode


-- Look and feel
------------------------------------------------------------

-- buffer-local options
vim.bo.expandtab = false


-- window-local options
vim.wo.wrap = false
vim.wo.signcolumn = 'yes'
vim.wo.number = true --Make line numbers default
--vim.wo.number = false



-- options
vim.opt.pumheight      = 12       -- completion menu height
vim.opt.virtualedit    = 'all'    -- cursor can be positioned anywhere
vim.opt.cursorline     = true     -- highlight current line
vim.opt.list           = true     -- show list chars
vim.opt.listchars      = { tab = '· ', eol = '¬', nbsp = '␣', extends = '…', precedes = '…', trail = '·', }
vim.opt.scrolloff      = 10       -- padding between cursor and top/bottom of window
vim.opt.foldmethod     = 'marker' -- fold on {{{...}}} by default
vim.opt.foldlevel      = 99       -- default to all folds open
vim.opt.foldlevelstart = 99       -- open files with all folds open
vim.opt.splitright     = true     -- prefer vsplitting to the right
vim.opt.splitbelow     = true     -- prefer splitting below
vim.opt.wrap           = true     -- don't wrap my text
--vim.g.python_recommended_style   = 0        -- I know how I like my python
--vim.opt.number         = true     -- absolute numbers...
--vim.opt.relativenumber = true     -- but only on the current line

vim.opt.textwidth = 100
vim.opt.colorcolumn = {-2,-1}
vim.opt.wildmode = {'longest', 'list', 'full'}
--vim.cmd [[set fillchars+=vert:\█]]
--
--remember cursor position
vim.cmd [[autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]]



-- Searching
------------------------------------------------------------
vim.opt.path:append('.,**')  -- search from project root
vim.opt.wildmenu      = true -- tab complete on command line
vim.opt.ignorecase    = true -- case insensitive search...
vim.opt.smartcase     = true -- unless I use caps
vim.opt.hlsearch      = true -- highlight matching text
vim.opt.incsearch     = true -- search while I type




-- mapping part 1
------------------------------------------------------------
local function noremap(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local map = vim.api.nvim_set_keymap

vim.g.mapleader = ' '
-- clipboard
noremap('', '<C-S-c>', '"+y')       -- Copy to clipboard in normal, visual, select and operator modes
noremap('', '<C-S-v>', '"+p')       -- paste from clipboard in normal, visual, select and operator modes
noremap('', '<leader>p', '"*y')       -- Copy to primary  in normal, visual, select and operator modes
noremap('', '<S-Insert>', '"*p')       -- paste from primary  in normal, visual, select and operator modes

-- misc
map('i', '<C-u>', '<C-g>u<C-u>', {noremap = true})  -- Make <C-u> undo-friendly
map('i', '<C-w>', '<C-g>u<C-w>', {noremap = true})  -- Make <C-w> undo-friendly
map('n', '<leader>h', '<cmd>noh<CR>', {noremap=true})    -- Clear highlights
map('n', '<leader>o', 'm`o<Esc>``', {noremap = true})  -- Insert a newline in normal mode

--[[
-- <Tab> to navigate the completion menu
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true, noremap=true})
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true, noremap=true})

-- vsnip
map('i', '<C-j>', 'vsnip#expandable()  ? "\\<Plug>(vsnip-expand)" : "\\<C-h>" ', {expr = true})
map('s', '<C-j>', 'vsnip#expandable()  ? "\\<Plug>(vsnip-expand)" : "\\<C-h>" ', {expr = true})
map('i', '<C-j>', 'vsnip#jumpable(1)   ? "\\<Plug>(vsnip-jump-next)" : "\\<C-j>" ', {expr = true})
map('s', '<C-j>', 'vsnip#jumpable(1)   ? "\\<Plug>(vsnip-jump-next)" : "\\<C-j>" ', {expr = true})
map('i', '<C-k>', 'vsnip#jumpable(-1)  ? "\\<Plug>(vsnip-jump-prev)" : "\\<C-k>" ', {expr = true})
map('s', '<C-k>', 'vsnip#jumpable(-1)  ? "\\<Plug>(vsnip-jump-prev)" : "\\<C-k>" ', {expr = true})
--]]
--

-- write to ----READONLY---- files
--utils.cnoremap("w!!",  "execute 'silent! write !sudo tee % >/dev/null' <bar> edit!")

--------------------------------------------------------------------------------
-- terminal mappings
--utils.tnoremap("<Esc>", "<C-\\><C-n>")
--utils.nnoremap("<leader>t", "<cmd>sp | term<cr>")

-- termdebugger
--utils.nnoremap("<leader>dd", ":TermdebugCommand")


--Remap escape to leave terminal mode
vim.api.nvim_exec([[
  augroup Terminal
    autocmd!
    au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
    au TermOpen * set nonu
  augroup end
]], false)


--------------------------------------------------------------------------------
-- ===== statusline =====
-- local fugitiveStatus = function()
--   local stl = {' %M', ' %y', ' %r', ' %{pathshorten(expand("%:p"))}', ' %{FugitiveStatusline()}', ' %c:%l/%L' }
--   return table.concat(stl)
-- end

--vim.o.statusline = table.concat(stl)



--------------------------------------------------------------------------------
-- Install packer

local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end


vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)




local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
  use 'tpope/vim-surround' -- "gc" to comment visual regions/lines
  use 'godlygeek/tabular' -- "gc" to comment visual regions/lines
  use 'ludovicchabant/vim-gutentags' -- Automatic tags management

  -- UI to select things (files, grep results, open buffers...)
  use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } } }
  -- fzf sorting for telescope
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make", }

  -- lint
  --use 'mfussenegger/nvim-lint'

  -- trouble diagnostic
  --use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" }

  -- Themes
  use 'joshdick/onedark.vim' -- Theme inspired by Atom
  use 'rakr/vim-one'
  use 'NLKNguyen/papercolor-theme'
  use 'EdenEast/nightfox.nvim'


  use {'ojroques/nvim-hardline'}
  --use 'itchyny/lightline.vim' -- Fancier statusline
  --use 'vim-airline/vim-airline'
  --use 'vim-airline/vim-airline-themes'
  --use { 'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true} }

  -- Add indentation guides even on blank lines
  --use 'lukas-reineke/indent-blankline.nvim'

  -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use 'nvim-treesitter/nvim-treesitter'
  -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  --lsp
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'nvim-lua/lsp-status.nvim'
  use 'kabouzeid/nvim-lspinstall'

  --use { "hrsh7th/nvim-cmp", requires = { "hrsh7th/cmp-buffer", } }
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'quangnguyen30192/cmp-nvim-ultisnips'
  --use 'saadparwaiz1/cmp_luasnip'

  --use 'L3MON4D3/LuaSnip' -- Snippets plugin
  --use 'hrsh7th/vim-vsnip'
  --use 'hrsh7th/vim-vsnip-integ'
  --use "rafamadriz/friendly-snippets"
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'

  --lspfuzzy
  -- require 'bat' to display syntax color
  use { 'ojroques/nvim-lspfuzzy', requires = { {'junegunn/fzf'}, {'junegunn/fzf.vim'} } }

  -- debugger
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

end)

local dap = require('dap')

dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode', -- adjust as needed
  name = "lldb"
}
dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    env = function()
      local variables = {}
      for k, v in pairs(vim.fn.environ()) do
        table.insert(variables, string.format("%s=%s", k, v))
      end
      return variables
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},

    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    runInTerminal = false,
  },
}

 require("dapui").setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
  },
  sidebar = {
    open_on_start = true,
    -- You can change the order of elements in the sidebar
    elements = {
      -- Provide as ID strings or tables with "id" and "size" keys
      {
        id = "scopes",
        size = 0.25, -- Can be float or integer > 1
      },
      { id = "breakpoints", size = 0.25 },
      { id = "stacks", size = 0.25 },
      { id = "watches", size = 00.25 },
    },
    width = 40,
    position = "left", -- Can be "left" or "right"
  },
  tray = {
    open_on_start = true,
    elements = { "repl" },
    height = 10,
    position = "bottom", -- Can be "bottom" or "top"
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
  },
  windows = { indent = 1 },
})


--------------------------------------------------------------------------------
-- hardline statusbar

local lspname = function()
  -- Lsp server name .
    --icon = ' LSP:',
    local msg = ': No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then return msg end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
end

require('hardline').setup {
  bufferline = true,  -- enable bufferline
  theme = 'light',   -- change theme
  theme_extended = true,
  sections = {         -- define sections
    {class = 'mode', item = require('hardline.parts.mode').get_item},
    {class = 'high', item = require('hardline.parts.git').get_item, hide = 80},
    --{class = 'low', item = fugitiveStatus},
    '%<',
    {class = 'med', item = require('hardline.parts.filename').get_item},

    {class = 'med', item ='%='}, -- flexible space

    {class = 'low', item = require('hardline.parts.wordcount').get_item, hide = 80},
    {class = 'med', item = lspname},
    {class = 'med', item = require('lsp-status').status},
    {class = 'error', item = require('hardline.parts.lsp').get_error},
    {class = 'warning', item = require('hardline.parts.lsp').get_warning},

    {class = 'warning', item = require('hardline.parts.whitespace').get_item},
    {class = 'high', item = require('hardline.parts.filetype').get_item, hide = 80},
    {class = 'mode', item = require('hardline.parts.line').get_item},
  },
  bufferline_settings = {
    exclude_terminal = false,  -- don't show terminal buffers in bufferline
    show_index = false,        -- show buffer indexes (not the actual buffer numbers) in bufferline
  },
}



--------------------------------------------------------------------------------
-- lualine statusbar
--[[
local colors = { bg = '#202328', fg = '#bbc2cf', yellow = '#ECBE7B', cyan = '#008080',
  darkblue = '#081633', green = '#98be65', orange = '#FF8800', violet = '#a9a1e1',
  magenta = '#c678dd', blue = '#51afef', red = '#ec5f67'
}

local lspname = {
  -- Lsp server name .
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then return msg end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = ' LSP:',
  color = {fg = '#ffffff', gui = 'bold'}
}

local lspstatus = function()
	if #vim.lsp.buf_get_clients() > 0 then
		return require'lsp-status'.status()
	end
	return ''
end


local sconfig = {
  options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename', lspname, lspstatus},
    lualine_x = {'encoding', {'fileformat', icons_enabled=false}, 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

require('lualine').setup(sconfig)
--]]








--------------------------------------------------------------------------------
-- fzf config

require('lspfuzzy').setup {} -- allow builtin lsp to use fzf
vim.cmd[[ let g:fzf_colors = { 'border':  ['fg', 'Normal'] } ]]

--[[
 let g:fzf_colors = {
\ 'fg':      ['fg', 'Normal'],
\ 'bg':      ['bg', 'Normal'],
\ 'hl':      ['fg', 'Comment'],
\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
\ 'hl+':     ['fg', 'Statement'],
\ 'info':    ['fg', 'PreProc'],
\ 'border':  ['fg', 'Ignore'],
\ 'prompt':  ['fg', 'Conditional'],
\ 'pointer': ['fg', 'Exception'],
\ 'marker':  ['fg', 'Keyword'],
\ 'spinner': ['fg', 'Label'],
\ 'header':  ['fg', 'Comment'] }
--]]


vim.cmd([[
let g:multiline=<< EOF
hello
world
EOF
]])



--------------------------------------------------------------------------------
--Set colorscheme (order is important here)
vim.o.termguicolors = true
--vim.cmd [[set t_Co=256]]
--vim.g.onedark_terminal_italics = 2
--vim.cmd [[colorscheme onedark]]

--vim.cmd [[colorscheme PaperColor]]
--vim.cmd [[set background=dark]]

--vim.g.one_allow_italics = 1
--vim.cmd [[colorscheme one]]
--vim.cmd [[set background=dark]]

-- nightfox
vim.g.nightfox_style = "nightfox"
vim.g.nightfox_color_delimiter = "red"
vim.g.nightfox_italic_comments = 1
require('nightfox').set()


--------------------------------------------------------------------------------
--lightline (airline alternative)
--Set statusbar
--[[
vim.g.lightline = {
  colorscheme = 'light',
  active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } },
  component_function = { gitbranch = 'fugitive#head' },
}
--]]

--[[
-- airline config
vim.g[ 'airline_theme' ] = 'light'
vim.g[ 'airline_powerline_fonts' ] = 1
vim.g[ 'airline#extensions#tabline#enabled' ] = 1
vim.g[ 'airline#extensions#tabline#fnamemod' ] = ':t:.'
vim.g[ 'airline#extensions#tabline#fnamecollapse' ] = 0
vim.g[ 'airline_detect_modified' ] = 0
vim.g[ 'airline_section_c' ] = "%t"
vim.g[ 'airline#extensions#hunks#hunk_symbols' ] = "['+', '~', '-']"
--]]






--------------------------------------------------------------------------------
--mapping part 2
--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- remove trailing spaces
vim.api.nvim_set_keymap('n', '<leader>d', [[:%s#\s\+$##<CR>]], {noremap = true, silent = true})

--Remap for dealing with word wrap j=gj k=gk
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- edit mode
vim.api.nvim_set_keymap('i', '<C-h>', '<left>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-l>', '<right>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-o>', '<C-o>O', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-p>', '<C-o>k', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-n>', '<C-o>j', {noremap = true, silent = true})


--Add move line shortcuts
vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', { noremap = true})
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', { noremap = true})
vim.api.nvim_set_keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { noremap = true})
vim.api.nvim_set_keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { noremap = true})
vim.api.nvim_set_keymap('v', '<A-j>', ':m \'>+1<CR>gv=gv', { noremap = true})
vim.api.nvim_set_keymap('v', '<A-k>', ':m \'<-2<CR>gv=gv', { noremap = true})


-- scrolling buffer/window
vim.api.nvim_set_keymap('n', '<F5>', ':bn<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-F5>', ':bp<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F6>', '<C-W>w', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-F6>', '<C-W>W', {noremap = true, silent = true})


-- Y yank until the end of line
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })





--------------------------------------------------------------------------------
--Map blankline
--[[
vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_char_highlight = 'LineNr'
vim.g.indent_blankline_show_trailing_blankline_indent = false
--]]

-- Highlight on yank (blink)
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false -- no return value
)





--------------------------------------------------------------------------------
-- Gitsigns
require('gitsigns').setup {
  signs = {
    add = { hl = 'GitGutterAdd', text = '+' },
    change = { hl = 'GitGutterChange', text = '~' },
    delete = { hl = 'GitGutterDelete', text = '_' },
    topdelete = { hl = 'GitGutterDelete', text = '‾' },
    changedelete = { hl = 'GitGutterChange', text = '~' },
  },
}







--------------------------------------------------------------------------------

local telescope = require('telescope')

telescope.setup{
  -- defaults
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    layout_config = {
      width           = 0.75,
      prompt_position = "top",
      preview_cutoff  = 120,
    },
    prompt_prefix      = "» ",
    selection_strategy = "reset",
    sorting_strategy   = "ascending",
    layout_strategy    = "horizontal",
    path_display       = {"shorten"},
    winblend           = 0, -- transparency
    border             = {},
    borderchars        = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    color_devicons     = true,
    use_less           = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default { }, currently unsupported for shells like cmd.exe / powershell.exe
  },

  --extension
  extensions = {
    fzf = {
      fuzzy                   = true,
      override_file_sorter    = true,
      override_generic_sorter = true,
      case_mode               = "smart_case",
    },
  },

  --picker
  pickers = {
    buffers = {
      sort_lastused = true,
      mappings = {
        i = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
        },
        n = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
        },
      },
    },
  },

}
telescope.load_extension('fzf')


local mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(mode, key, result, {noremap = true, silent = true})
end
-- Telescope integration
mapper("n", "<Leader>ff", "<cmd>lua require'telescope.builtin'.find_files{}<CR>")                -- search all files, respecting .gitignore if one exists
mapper("n", "<Leader>fb", "<cmd>lua require'telescope.builtin'.buffers{}<CR>")                   -- search open buffers
mapper("n", "<Leader>fs", "<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>") -- search lines in current buffer
mapper("n", "<Leader>gg", "<cmd>lua require'telescope.builtin'.live_grep{}<CR>")                 -- search all lines in project
mapper("n", "<Leader>fr", "<cmd>lua require'telescope.builtin'.lsp_references{}<CR>")            -- search references to symbol under cursor
mapper("n", "<Leader>cl", "<cmd>lua require'telescope.builtin'.colorscheme{}<CR>")               -- colorschemes
mapper("n", "<Leader>cm", "<cmd>lua require'telescope.builtin'.commands{}<CR>")                  -- command history
mapper("n", "<Leader>gb", "<cmd>lua require'telescope.builtin'.git_branches{}<CR>")              -- checkout different branches

local kmap = vim.api.nvim_set_keymap
local sopt = {noremap = true, silent=true}
--kmap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], sopt)
--kmap('n', '<leader>sf', [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]], sopt)
--kmap('n', '<leader>sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], sopt)
kmap('n', '<leader>sh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], sopt)
kmap('n', '<leader>st', [[<cmd>lua require('telescope.builtin').tags()<CR>]], sopt)
--kmap('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], sopt)
--imap('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], sopt)
kmap('n', '<leader>so', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], sopt)
kmap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], sopt)

 --Add leader shortcuts
vim.api.nvim_set_keymap('n', '<leader>f', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>l', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>t', [[<cmd>lua require('telescope.builtin').tags()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>o', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gc', [[<cmd>lua require('telescope.builtin').git_commits()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gb', [[<cmd>lua require('telescope.builtin').git_blame()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gs', [[<cmd>lua require('telescope.builtin').git_status()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gp', [[<cmd>lua require('telescope.builtin').git_bcommits()<cr>]], { noremap = true, silent = true})







--------------------------------------------------------------------------------
-- LSP settings
-- lspconfig, lsp-status,
-- symbols = {error = ' ', warn = ' ', info = ' '},

local lsp_status = require('lsp-status')
lsp_status.register_progress()
lsp_status.config({
  status_symbol = 'LSP: ',
  indicator_errors = '🟥',
  indicator_warnings = '🟨',
  indicator_info = '🟩',
  indicator_hint = '🟦',
  indicator_ok = '✔️',
  spinner_frames = { '⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷' },
})
--[[
lsp_status.config({
  status_symbol = '',
  indicator_errors = 'e',
  indicator_warnings = 'w',
  indicator_info = 'i',
  indicator_hint = 'h',
  indicator_ok = '✔️',
  spinner_frames = { '⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷' },
})
--]]


local nvim_lsp = require 'lspconfig'

local on_attach = function(client, bufnr)

  lsp_status.on_attach(client, bufnr)

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
--  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true



require'lspinstall'.setup() -- important
-- Enable the following language servers
local servers = { 'ccls', 'gopls', 'rust_analyzer', 'pyright', 'tsserver', 'lua',}
--local servers = require'lspinstall'.installed_servers()
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = vim.tbl_extend("keep", capabilities, lsp_status.capabilities)
  }
end

require'lspconfig'.lua.setup {
  on_attach = on_attach,
  capabilities = vim.tbl_extend("keep", capabilities, lsp_status.capabilities),
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } },
      telemetry = { enable = false, },
    }
  }
}


--[[
-- Example custom server
local sumneko_root_path = vim.fn.getenv("HOME").."/.local/bin/sumneko_lua" -- Change to your sumneko root installation
local sumneko_binary = sumneko_root_path .. '/bin/linux/lua-language-server'

-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

require('lspconfig').sumneko_lua.setup {
  cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' },
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
--]]


------------------------------------------------------------
-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
  ensure_installed = 'maintained',
  highlight = {
    enable = false, -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
}



------------------------------------------------------------
-- Set completeopt to have a better completion experience
-- vim.o.completeopt = 'menuone,noinsert'

--  source = {
--    luasnip = false,
--    buffer = false,
--    calc = false,
--    nvim_lua = false,
--    vsnip = false,
--    ultisnips = true,
--    nvim_lsp = true,
--    treesitter = true,
--    path = true,
--    tags = false,
--    spell = false,
--  },

-- ultisnips config
vim.g.UltiSnipsExpandTrigger='<c-j>'
vim.g.UltiSnipsListSnippets='<c-tab>'
vim.g.UltiSnipsJumpForwardTrigger='<c-j>'
vim.g.UltiSnipsJumpBackwardTrigger='<c-k>'
vim.g.UltiSnipsEditSplit='vertical'

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
-- Utility functions for compe and vsnip


 -- Set completeopt to have a better completion experience
--vim.o.completeopt = 'menuone,noselect'

-- luasnip setup
--local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },

  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },

    ['<Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
      --elseif vim.fn["UltiSnips#CanExpandSnippet"]() == 1 or vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
          --vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>', true, true, true), '')
      --elseif luasnip.expand_or_jumpable() then
        --vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      elseif check_back_space() then
        vim.fn.feedkeys(t("<tab>"), "n")
      else
        fallback()
      end
    end,

    ['<S-Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
      --elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
          --vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-R>=UltiSnips#JumpBackwards()<CR>', true, true, true), '')
      --elseif luasnip.jumpable(-1) then
        --vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end,

  }, --end of mapping

  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'ultisnips' },
    { name = 'path' },
  },

} --end of cmp setup



