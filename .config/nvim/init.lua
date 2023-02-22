


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
vim.opt.laststatus     = 3        -- global statusline
vim.opt.pumheight      = 12       -- completion menu height
vim.opt.virtualedit    = 'all'    -- cursor can be positioned anywhere
vim.opt.cursorline     = true     -- highlight current line
vim.opt.list           = true     -- show list chars
vim.opt.listchars      = { tab = '├ ', eol = '¬', nbsp = '␣', extends = '…', precedes = '…', trail = '·', }
vim.opt.scrolloff      = 10       -- padding between cursor and top/bottom of window
vim.opt.foldmethod     = 'marker' -- fold on {{{...}}} by default
vim.opt.foldlevel      = 99       -- default to all folds open
vim.opt.foldlevelstart = 99       -- open files with all folds open
vim.opt.splitright     = true     -- prefer vsplitting to the right
vim.opt.splitbelow     = true     -- prefer splitting below
vim.opt.wrap           = false    -- don't wrap my text
--vim.g.python_recommended_style   = 0        -- I know how I like my python
--vim.opt.number         = true     -- absolute numbers...
--vim.opt.relativenumber = true     -- but only on the current line

vim.opt.textwidth = 100
vim.opt.colorcolumn = {-2,-1}
vim.opt.wildmode = {'longest', 'list', 'full'}
--vim.cmd [[set fillchars+=vert:\█]]
--vim.cmd("highlight MyTab ctermfg=grey") --listchars color for tab, space
--vim.cmd('match MyTab /\t\\| /')
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
-- clipboard <C-S-v> 
noremap('v', '<leader>y', '"+y')       -- copy to clipboard in normal, visual, select and operator modes
noremap('n', '<leader>p', '"+p')       -- paste from clipboard in normal, visual, select and operator modes
noremap('v', '<S-Delete>', '"*y')       -- Copy to primary  in normal, visual, select and operator modes
noremap('n', '<S-Insert>', '"*p')       -- paste from primary  in normal, visual, select and operator modes

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
  use 'tpope/vim-surround' -- ys{motion}{char}, ds{char}, and cs{target}{replacement}
  use 'godlygeek/tabular' -- :Tabularize /{pattern}
  --use 'ludovicchabant/vim-gutentags' -- Automatic tags management
  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

  -- UI to select things (files, grep results, open buffers...)
  use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } } }

  -- fzf sorting for telescope
  --use { "nvim-telescope/telescope-fzf-native.nvim", run = "make", }
  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 } --dnf install fzf

  -- lint
  --use 'mfussenegger/nvim-lint'

  -- trouble diagnostic
  --use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" }

  -- Themes
  use 'joshdick/onedark.vim' -- Theme inspired by Atom
  use 'rakr/vim-one'
  use 'NLKNguyen/papercolor-theme'
  use 'EdenEast/nightfox.nvim'
  use { 'AlphaTechnolog/pywal.nvim', as = 'pywal' }


  use {'sl424/nvim-hardline', branch='theme_extended'}
  --use 'itchyny/lightline.vim' -- Fancier statusline
  --use 'vim-airline/vim-airline'
  --use 'vim-airline/vim-airline-themes'
  --use { 'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true} }

  -- Add indentation guides even on blank lines
  use 'lukas-reineke/indent-blankline.nvim'

  -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  --use 'nvim-treesitter/nvim-treesitter'
  -- Additional textobjects for treesitter
  --[[
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  ]]
  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }
  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  --lsp
  --[[
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'williamboman/nvim-lsp-installer'
  ]]

  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',
    },
  }
  --use 'nvim-lua/lsp-status.nvim'
  use 'jose-elias-alvarez/null-ls.nvim' -- linters + formatters
  use 'joechrisellis/lsp-format-modifications.nvim'
  --use 'mhartington/formatter.nvim'


  --use { "hrsh7th/nvim-cmp", requires = { "hrsh7th/cmp-buffer", } }
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'quangnguyen30192/cmp-nvim-ultisnips' --pip install neovim
  --use 'saadparwaiz1/cmp_luasnip'

  --use 'L3MON4D3/LuaSnip' -- Snippets plugin
  --use 'hrsh7th/vim-vsnip'
  --use 'hrsh7th/vim-vsnip-integ'
  --use "rafamadriz/friendly-snippets"
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'
  use 'airblade/vim-gitgutter'

  --lspfuzzy
  -- require 'bat' to display syntax color
  use { 'ojroques/nvim-lspfuzzy', requires = { {'junegunn/fzf'}, {'junegunn/fzf.vim'} } }

  -- debugger
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

end)


--**************************************************--
  -- debugger config
local dap, dapui = require('dap'), require('dapui')

dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode', -- adjust as needed
  name = "lldb"
}

local lldb = {
    --name = "Launch",
    name = "lldb",
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
    runInTerminal = false,
}

dap.configurations.c = { lldb }
dap.configurations.cpp = { lldb }
dap.configurations.rust = { lldb }
--dap.configurations.python= { lldb }

vim.keymap.set('n', '<leader>dk', function() dap.continue() end)
vim.keymap.set('n', '<leader>dq', function() dap.terminate() end)
vim.keymap.set('n', '<leader>dn', function() dap.step_over() end)
-- vim.keymap.set('n', '<leader>dp', function() dap.step_back() end) --adapter may not support
vim.keymap.set('n', '<leader>dd', function() dap.step_into() end)
vim.keymap.set('n', '<leader>du', function() dap.step_out() end)
vim.keymap.set('n', '<leader>db', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<leader>dB', function() dap.toggle_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
vim.keymap.set('n', '<leader>lp', function() dap.toggle_breakpoint(nil,nil,vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<leader>dr', function() dap.repl.open() end)
vim.keymap.set('n', '<leader>dl', function() dap.run_last() end)


--------------------------------------------------------------------------------
--dapui config 
--font codicon needed: 'npm i @vscode/codicons', cd 'npm root', ttf in 'dist' folder
require("dapui").setup({
  icons = { expanded = "", collapsed = "", current_frame = "" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Use this to override mappings for specific elements
  element_mappings = {
    -- Example:
    -- stacks = {
    --   open = "<CR>",
    --   expand = "o",
    -- }
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7") == 1,
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  -- The size specifies the height/width depending on position. It can be an Int
  -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
  -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  -- Elements are the elements shown in the layout (in order).
  -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  layouts = {
    {
      elements = {
      -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
  controls = {
    -- Requires Neovim nightly (or 0.8 when released)
    enabled = true,
    -- Display controls in this element
    element = "repl",
    icons = {
      pause = "",
      play = "",
      step_into = "dd",
      step_out = "du",
      step_over = "dn",
      step_back = "dp",
      run_last = "dl",
      terminate = "dq",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
    max_value_lines = 100, -- Can be integer or nil.
  }
})


dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open( {} ) end
dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close( {} ) end
dap.listeners.before.event_exited['dapui_config'] = function() dapui.close( {} ) end


--------------------------------------------------------------------------------
-- hardline statusbar
--
local nls_registered = function(filetype)
  local s = require "null-ls.sources"
  local available_sources = s.get_available(filetype)
  local registered = {}
  for _, source in ipairs(available_sources) do
    for method in pairs(source.methods) do
      registered[method] = registered[method] or {}
      table.insert(registered[method], source.name)
    end
  end
  return registered
end

local icon = { passed=" ", failed=" ", }

local getlsp = function()
  local lsp = require('hardline.parts.lsp').get_lsp_clients()
  if lsp ~= 'none' then return icon.passed .. lsp end
  return icon.failed .. 'lsp'
end

local getdap = function()
  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
  local adapter = dap.configurations[buf_ft]
  --if adapter ~= nil then return icon.pass .. adapter[1].name end
  if adapter ~= nil then return icon.passed .. 'dap' end
  return icon.failed .. 'dap'
end

--[[
local getformatter = function()
  local config =  require "formatter.config"
  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
  local formatter = config.values.filetype[buf_ft]
  if formatter ~= nil then return icon.pass .. formatter[1].name end
  return icon.fail .. 'formatter'
end
]]

local getnls = function() --status line for null-ls linter + formatter
  local status = {}
  local filetype = vim.api.nvim_buf_get_option(0, 'filetype')
  local reg = nls_registered(filetype)
  local f = require("null-ls").methods.FORMATTING
  --if reg[f] ~= nil then vim.list_extend(status, {icon.pass, table.unpack(reg[f]) })
  if reg[f] ~= nil then vim.list_extend(status, {icon.passed .. 'fmt'})
  else vim.list_extend(status, {icon.failed .. 'fmt'})
  end
  local l = require("null-ls").methods.DIAGNOSTICS -- linter
  --if reg[l] ~= nil then vim.list_extend(status, {icon.pass, table.unpack(reg[l]) })
  if reg[l] ~= nil then vim.list_extend(status, {icon.passed .. 'lnt'})
  else vim.list_extend(status, {icon.failed .. 'lnt'})
  end
  return table.concat(status, " ")
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
    --{class = 'med', item = lspname},
    --{class = 'med', item = require('hardline.parts.lsp').get_item},
    --{class = 'med', item = require('lsp-status').status},
    --{class = 'med', item = require('hardline.parts.lsp').get_lsp_clients},
    {class = 'med', item = getlsp, hide = 160},
    {class = 'med', item = getdap, hide = 160},
    {class = 'med', item = getnls, hide = 160},
    {class = 'error', item = require('hardline.parts.lsp').get_error},
    {class = 'warning', item = require('hardline.parts.lsp').get_warning},

    {class = 'warning', item = require('hardline.parts.whitespace').get_item, hide=160},
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
--vim.cmd[[ let g:fzf_colors = { 'border':  ['fg', 'Normal'] } ]]

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
vim.cmd('colorscheme nightfox')

--pywal
--vim.cmd('colorscheme pywal')

--[[
vim.cmd('hi Normal ctermbg=none guibg=none') --transparent background
vim.cmd('hi Whitespace ctermbg=none guifg=grey') --listchars tab, trail
vim.cmd('hi NonText ctermfg=yellow guifg=grey') --listchars eol
vim.cmd('highlight ColorColumn guibg=#29394f') --textwidth vertical bar, match cursorline
--]]

-- check group :so $VIMRUNTIME/syntax/hitest.vim
--vim.cmd('highlight CursorLine guibg=LightBlue') --cursorline
-- get group color, :echo synIDattr(synIDtrans(hlID('CursorLine')), 'bg') > #29394f

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
vim.api.nvim_set_keymap('n', '<leader>bn', ':bn<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>bp', ':bp<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F6>', '<C-W>w', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-F6>', '<C-W>W', {noremap = true, silent = true})


-- Y yank until the end of line
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })


-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
--vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
vim.keymap.set('n', '<leader>q', function()
    local win = vim.api.nvim_get_current_win()
    local qf_winid = vim.fn.getloclist(win, { winid = 0 }).winid
    if qf_winid > 0 then vim.cmd('lclose') else vim.diagnostic.setloclist() end
end, { noremap = true, silent = true } )


--------------------------------------------------------------------------------
require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}

--------------------------------------------------------------------------------
--Map blankline
--[[
vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_char_highlight = 'LineNr'
vim.g.indent_blankline_show_trailing_blankline_indent = false
--]]

--------------------------------------------------------------------------------
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


-- See `:help vim.highlight.on_yank()`
--[[
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
--]]



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
    mappings = {
        i = {
          --['<C-u>'] = false, ['<C-d>'] = false,
          ['<C-j>'] = require("telescope.actions").move_selection_next,
          ['<C-k>'] = require("telescope.actions").move_selection_previous,
        },
    },
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
    --set_env = { ['COLORTERM'] = 'truecolor' }, -- default { }, currently unsupported for shells like cmd.exe / powershell.exe
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
        i = { ["<c-d>"] = require("telescope.actions").delete_buffer, },
        n = { ["<c-d>"] = require("telescope.actions").delete_buffer, },
      },
    },
  },


}
--telescope.load_extension('fzf')
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })

--vim.keymap.set('n', '<leader>/', require('telescope.builtin').current_buffer_fuzzy_find, { desc = '[/] Fuzzily search in current buffer]' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

--------------------------------------------------
--[[
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
--]]

--local kmap = vim.api.nvim_set_keymap
--local sopt = {noremap = true, silent=true}
--kmap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], sopt)
--kmap('n', '<leader>sf', [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]], sopt)
--kmap('n', '<leader>sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], sopt)
--kmap('n', '<leader>sh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], sopt)
--kmap('n', '<leader>st', [[<cmd>lua require('telescope.builtin').tags()<CR>]], sopt)
--kmap('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], sopt)
--imap('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], sopt)
--kmap('n', '<leader>so', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], sopt)
--kmap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], sopt)

 --Add leader shortcuts
--vim.api.nvim_set_keymap('n', '<leader>f', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], { noremap = true, silent = true})
--vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], { noremap = true, silent = true})
--vim.api.nvim_set_keymap('n', '<leader>l', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>]], { noremap = true, silent = true})
--vim.api.nvim_set_keymap('n', '<leader>t', [[<cmd>lua require('telescope.builtin').tags()<cr>]], { noremap = true, silent = true})
--vim.api.nvim_set_keymap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<cr>]], { noremap = true, silent = true})
--vim.api.nvim_set_keymap('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], { noremap = true, silent = true})
--vim.api.nvim_set_keymap('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], { noremap = true, silent = true})
--vim.api.nvim_set_keymap('n', '<leader>o', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<cr>]], { noremap = true, silent = true})
--vim.api.nvim_set_keymap('n', '<leader>gc', [[<cmd>lua require('telescope.builtin').git_commits()<cr>]], { noremap = true, silent = true})
--vim.api.nvim_set_keymap('n', '<leader>gb', [[<cmd>lua require('telescope.builtin').git_blame()<cr>]], { noremap = true, silent = true})
--vim.api.nvim_set_keymap('n', '<leader>gs', [[<cmd>lua require('telescope.builtin').git_status()<cr>]], { noremap = true, silent = true})
--vim.api.nvim_set_keymap('n', '<leader>gp', [[<cmd>lua require('telescope.builtin').git_bcommits()<cr>]], { noremap = true, silent = true})







--------------------------------------------------------------------------------
-- LSP settings
-- lspconfig, lsp-status,
-- symbols = {error = ' ', warn = ' ', info = ' '},

--[[
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
--]]
--
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

------------------------------------------------------------
-- null-ls configuration

local null_clangformat = function()
  local h = require("null-ls.helpers")
  local methods = require("null-ls.methods")
  local FORMATTING = methods.internal.FORMATTING
  local RANGE_FORMATTING = methods.internal.RANGE_FORMATTING
  return h.make_builtin({
    name = "clang_format",
    meta = {
      url = "https://www.kernel.org/doc/html/latest/process/clang-format.html",
      description = "Tool to format C/C++/… code according to a set of rules and heuristics.",
    },
    method = { FORMATTING, RANGE_FORMATTING },
    filetypes = { "c", "cpp", "cs", "java", "cuda" },
    generator_opts = {
      command = "clang-format",
      args = h.range_formatting_args_factory(
      { "-assume-filename", "$FILENAME", "-style", "{BasedOnStyle: LLVM, BreakBeforeBraces: Linux, IndentWidth: 8, UseTab: Always, AllowShortIfStatementsOnASingleLine: false, IndentCaseLabels: false}", },
      "--offset",
      "--length",
      { use_length = true, row_offset = -1, col_offset = -1 }
      ),
      to_stdin = true,
    },
    factory = h.formatter_factory,
  })
end

local null_ls = require"null-ls"
null_ls.setup({
  sources = {
    -- NOTE: sources must support range formatting!
    null_ls.builtins.diagnostics.pylint, --python lint
    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.autopep8, --python formatter
    null_clangformat,
  },
  on_attach = function(client, bufnr)
    -- your usual configuration — options, keymaps, etc
    -- ...
    local lsp_format_modifications = require"lsp-format-modifications"
    lsp_format_modifications.attach(client, bufnr, { format_on_save = false })
  end
})


------------------------------------------------------------
-- LSP configuration
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })

    --local lsp_format_modifications = require"lsp-format-modifications"
    --lsp_format_modifications.attach(_, bufnr, { format_on_save = false })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

   -- Create a command `:Format` local to the LSP buffer
   --[[
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    --vim.lsp.buf.format({BreakBeforeBraces='Linux',})
    vim.lsp.buf.format { filter = function(client) return client.name ~= "clangd" end }
  end, { desc = 'Format current buffer with LSP' })
  --]]
end

--------------------------------------------------
-- formatter utilities for creating configurations
--[[
local util = require "formatter.util"

local m_clangformat = function()
  return {
    name = "clang_format",
    exe = "clang-format",
    args = {
      "-assume-filename", util.escape_path(util.get_current_buffer_file_name()),
      "--style='{BasedOnStyle: LLVM, BreakBeforeBraces: Linux, IndentWidth: 8, UseTab: Always, AllowShortIfStatementsOnASingleLine: false, IndentCaseLabels: false}' ",
    },
    stdin = true, try_node_modules = true,
  }
end

local m_autopep8 = function()
  return {
    name = "autopep",
    exe = "autopep8", args = { "-" }, stdin = 1,
  }
end

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  logging = true, -- Enable or disable logging
  log_level = vim.log.levels.WARN, -- Set the log level
  filetype = { -- All formatter configurations are opt-in
    --lua = { require("formatter.filetypes.lua").stylua, },
    --c = { require("formatter.filetypes.cpp").clangformat }, --default config

    c = { m_clangformat() },
    cpp = { m_clangformat() },
    python = { m_autopep8() },

    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace
    },
  },
}
--]]

-- Setup mason so it can manage external tooling
require('mason').setup()
--local daps = { 'lldb-vscode', 'debugpy', }
--local formatters = { 'clang-format', 'autopep8', }

-- Enable the following language servers
-- Feel free to add/remove any LSPs that you want here. They will automatically be installed
local servers = { 'clangd', 'sumneko_lua', 'pyright', }

-- Ensure the servers above are installed
require('mason-lspconfig').setup {
  ensure_installed = servers,
}

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    --root_dir = function() return vim.fn.getcwd() end,
    settings = {
      Lua = {
        diagnostics = { globals = { 'vim' }, },
        telemetry = { enable = false },
      },
    },
  }
end

-- Turn on status information
require('fidget').setup()



------------------------------------------------------------
-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  --ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'typescript' },
  ensure_installed = { 'c', 'cpp', },

  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
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
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
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
--[[
vim.g.UltiSnipsExpandTrigger='<c-j>'
vim.g.UltiSnipsListSnippets='<c-tab>'
vim.g.UltiSnipsJumpForwardTrigger='<c-j>'
vim.g.UltiSnipsJumpBackwardTrigger='<c-k>'
vim.g.UltiSnipsEditSplit='vertical'
--]]

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
-- Utility functions for compe and vsnip


 -- Set completeopt to have a better completion experience
--vim.o.completeopt = 'menuone,noselect'

-- luasnip setup
--local luasnip = require 'luasnip'


------------------------------------------------------------
-- nvim-cmp setup
local cmp = require 'cmp'

--[[
local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end
--]]

local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
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

    ["<Tab>"] = cmp.mapping(
          function(fallback)
            --cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
			cmp_ultisnips_mappings.compose { "jump_forwards", "select_next_item", }(fallback)
          end,
          { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
    ),

    ["<S-Tab>"] = cmp.mapping(
          function(fallback)
            --cmp_ultisnips_mappings.jump_backwards(fallback)
			cmp_ultisnips_mappings.compose { "jump_backwards", "select_prev_item", }(fallback)
          end,
          { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
    ),

  }, --end of mapping


  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'ultisnips' },
    { name = 'path' },
  },

} --end of cmp setup


vim.cmd('hi Normal ctermbg=none guibg=none') --transparent background
--vim.cmd('hi NonText ctermfg=yellow guifg=white') --eol(listchars)
--[[
vim.cmd('hi SignColumn ctermbg=none guibg=none')
vim.cmd('hi LineNr ctermbg=none guibg=none')
vim.cmd('highlight IndentBlanklineIndent1 guibg=none gui=nocombine')
--]]

