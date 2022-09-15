--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheReset` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {
  --     {"folke/tokyonight.nvim"},
  { 'bennypowers/nvim-regexplainer',
    config = function() require 'regexplainer'.setup() end,
    requires = {
      'nvim-treesitter/nvim-treesitter',
      'MunifTanjim/nui.nvim',
    },
    config = function()
      -- defaults
      require 'regexplainer'.setup {
        -- 'narrative'
        mode = 'narrative', -- TODO: 'ascii', 'graphical'

        -- automatically show the explainer when the cursor enters a regexp
        auto = false,

        -- filetypes (i.e. extensions) in which to run the autocommand
        filetypes = {
          'html',
          'js',
          'cjs',
          'mjs',
          'ts',
          'jsx',
          'tsx',
          'cjsx',
          'mjsx',
        },

        -- Whether to log debug messages
        debug = false,

        -- 'split', 'popup', 'pasteboard'
        display = 'popup',

        mappings = {
          toggle = 'gR',
          -- examples, not defaults:
          -- show = 'gS',
          -- hide = 'gH',
          -- show_split = 'gP',
          -- show_popup = 'gU',
        },

        narrative = {
          separator = '\n',
        },
      }
    end
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },

  --[[ {
    "kyazdani42/nvim-web-devicons",
    require 'nvim-web-devicons'.setup {
      -- your personnal icons can go here (to override)
      -- you can specify color or cterm_color instead of specifying both of them
      -- DevIcon will be appended to `name`
      override = {
        zsh = {
          icon = "",
          color = "#428850",
          cterm_color = "65",
          name = "Zsh"
        }
      };
      -- globally enable default icons (default to false)
      -- will get overriden by `get_icons` option
      default = true;
    },
    require("nvim-web-devicons").set_icon {
      zsh = {
        icon = "",
        color = "#428850",
        cterm_color = "65",
        name = "Zsh"
      }
    },
    require("nvim-web-devicons").set_default_icon('', '#6d8086'),
    require 'nvim-web-devicons'.get_icons(),
    require 'nvim-web-devicons'.has_loaded(),
    config = function()
      local icon, color = require 'nvim-web-devicons'.get_icon_color("init.lua", "lua")
      assert(icon == "")
      assert(color == "#51a0cf")
    end,
  },
  This plugin seems to be used by default, deactivated]]

  { "pwntester/octo.nvim",
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = function()
      require("octo").setup({
        default_remote = { "upstream", "origin" }; -- order to try remotes
        reaction_viewer_hint_icon = ""; -- marker for user reactions
        user_icon = " "; -- user icon
        timeline_marker = ""; -- timeline marker
        timeline_indent = "2"; -- timeline indentation
        right_bubble_delimiter = ""; -- Bubble delimiter
        left_bubble_delimiter = ""; -- Bubble delimiter
        github_hostname = ""; -- GitHub Enterprise host
        snippet_context_lines = 4; -- number or lines around commented lines
        file_panel = {
          size = 10, -- changed files panel rows
          use_icons = true -- use web-devicons in file panel
        },
        mappings = {
          issue = {
            close_issue = "<space>ic", -- close issue
            reopen_issue = "<space>io", -- reopen issue
            list_issues = "<space>il", -- list open issues on same repo
            reload = "<C-r>", -- reload issue
            open_in_browser = "<C-b>", -- open issue in browser
            copy_url = "<C-y>", -- copy url to system clipboard
            add_assignee = "<space>aa", -- add assignee
            remove_assignee = "<space>ad", -- remove assignee
            create_label = "<space>lc", -- create label
            add_label = "<space>la", -- add label
            remove_label = "<space>ld", -- remove label
            goto_issue = "<space>gi", -- navigate to a local repo issue
            add_comment = "<space>ca", -- add comment
            delete_comment = "<space>cd", -- delete comment
            next_comment = "]c", -- go to next comment
            prev_comment = "[c", -- go to previous comment
            react_hooray = "<space>rp", -- add/remove 🎉 reaction
            react_heart = "<space>rh", -- add/remove ❤️ reaction
            react_eyes = "<space>re", -- add/remove 👀 reaction
            react_thumbs_up = "<space>r+", -- add/remove 👍 reaction
            react_thumbs_down = "<space>r-", -- add/remove 👎 reaction
            react_rocket = "<space>rr", -- add/remove 🚀 reaction
            react_laugh = "<space>rl", -- add/remove 😄 reaction
            react_confused = "<space>rc", -- add/remove 😕 reaction
          },
          pull_request = {
            checkout_pr = "<space>po", -- checkout PR
            merge_pr = "<space>pm", -- merge commit PR
            squash_and_merge_pr = "<space>psm", -- squash and merge PR
            list_commits = "<space>pc", -- list PR commits
            list_changed_files = "<space>pf", -- list PR changed files
            show_pr_diff = "<space>pd", -- show PR diff
            add_reviewer = "<space>va", -- add reviewer
            remove_reviewer = "<space>vd", -- remove reviewer request
            close_issue = "<space>ic", -- close PR
            reopen_issue = "<space>io", -- reopen PR
            list_issues = "<space>il", -- list open issues on same repo
            reload = "<C-r>", -- reload PR
            open_in_browser = "<C-b>", -- open PR in browser
            copy_url = "<C-y>", -- copy url to system clipboard
            add_assignee = "<space>aa", -- add assignee
            remove_assignee = "<space>ad", -- remove assignee
            create_label = "<space>lc", -- create label
            add_label = "<space>la", -- add label
            remove_label = "<space>ld", -- remove label
            goto_issue = "<space>gi", -- navigate to a local repo issue
            add_comment = "<space>ca", -- add comment
            delete_comment = "<space>cd", -- delete comment
            next_comment = "]c", -- go to next comment
            prev_comment = "[c", -- go to previous comment
            react_hooray = "<space>rp", -- add/remove 🎉 reaction
            react_heart = "<space>rh", -- add/remove ❤️ reaction
            react_eyes = "<space>re", -- add/remove 👀 reaction
            react_thumbs_up = "<space>r+", -- add/remove 👍 reaction
            react_thumbs_down = "<space>r-", -- add/remove 👎 reaction
            react_rocket = "<space>rr", -- add/remove 🚀 reaction
            react_laugh = "<space>rl", -- add/remove 😄 reaction
            react_confused = "<space>rc", -- add/remove 😕 reaction
          },
          review_thread = {
            goto_issue = "<space>gi", -- navigate to a local repo issue
            add_comment = "<space>ca", -- add comment
            add_suggestion = "<space>sa", -- add suggestion
            delete_comment = "<space>cd", -- delete comment
            next_comment = "]c", -- go to next comment
            prev_comment = "[c", -- go to previous comment
            select_next_entry = "]q", -- move to previous changed file
            select_prev_entry = "[q", -- move to next changed file
            close_review_tab = "<C-c>", -- close review tab
            react_hooray = "<space>rp", -- add/remove 🎉 reaction
            react_heart = "<space>rh", -- add/remove ❤️ reaction
            react_eyes = "<space>re", -- add/remove 👀 reaction
            react_thumbs_up = "<space>r+", -- add/remove 👍 reaction
            react_thumbs_down = "<space>r-", -- add/remove 👎 reaction
            react_rocket = "<space>rr", -- add/remove 🚀 reaction
            react_laugh = "<space>rl", -- add/remove 😄 reaction
            react_confused = "<space>rc", -- add/remove 😕 reaction
          },
          submit_win = {
            approve_review = "<C-a>", -- approve review
            comment_review = "<C-m>", -- comment review
            request_changes = "<C-r>", -- request changes review
            close_review_tab = "<C-c>", -- close review tab
          },
          review_diff = {
            add_review_comment = "<space>ca", -- add a new review comment
            add_review_suggestion = "<space>sa", -- add a new review suggestion
            focus_files = "<leader>e", -- move focus to changed file panel
            toggle_files = "<leader>b", -- hide/show changed files panel
            next_thread = "]t", -- move to next thread
            prev_thread = "[t", -- move to previous thread
            select_next_entry = "]q", -- move to previous changed file
            select_prev_entry = "[q", -- move to next changed file
            close_review_tab = "<C-c>", -- close review tab
            toggle_viewed = "<leader><space>", -- toggle viewer viewed state
          },
          file_panel = {
            next_entry = "j", -- move to next changed file
            prev_entry = "k", -- move to previous changed file
            select_entry = "<cr>", -- show selected changed file diffs
            refresh_files = "R", -- refresh changed files panel
            focus_files = "<leader>e", -- move focus to changed file panel
            toggle_files = "<leader>b", -- hide/show changed files panel
            select_next_entry = "]q", -- move to previous changed file
            select_prev_entry = "[q", -- move to next changed file
            close_review_tab = "<C-c>", -- close review tab
            toggle_viewed = "<leader><space>", -- toggle viewer viewed state
          }
        }
      })
    end
  },
  { "sindrets/diffview.nvim",
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      local cb = require 'diffview.config'.diffview_callback

      require 'diffview'.setup {
        diff_binaries = false, -- Show diffs for binaries
        enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
        use_icons = true, -- Requires nvim-web-devicons
        icons = { -- Only applies when use_icons is true.
          folder_closed = "",
          folder_open = "",
        },
        signs = {
          fold_closed = "",
          fold_open = "",
        },
        file_panel = {
          position = "left", -- One of 'left', 'right', 'top', 'bottom'
          width = 35, -- Only applies when position is 'left' or 'right'
          height = 10, -- Only applies when position is 'top' or 'bottom'
          listing_style = "tree", -- One of 'list' or 'tree'
          tree_options = { -- Only applies when listing_style is 'tree'
            flatten_dirs = true, -- Flatten dirs that only contain one single dir
            folder_statuses = "only_folded", -- One of 'never', 'only_folded' or 'always'.
          },
        },
        file_history_panel = {
          position = "bottom",
          width = 35,
          height = 16,
          log_options = {
            max_count = 256, -- Limit the number of commits
            follow = false, -- Follow renames (only for single file)
            all = false, -- Include all refs under 'refs/' including HEAD
            merges = false, -- List only merge commits
            no_merges = false, -- List no merge commits
            reverse = false, -- List commits in reverse order
          },
        },
        default_args = { -- Default args prepended to the arg-list for the listed commands
          DiffviewOpen = {},
          DiffviewFileHistory = {},
        },
        hooks = {}, -- See ':h diffview-config-hooks'
        key_bindings = {
          disable_defaults = false, -- Disable the default key bindings
          -- The `view` bindings are active in the diff buffers, only when the current
          -- tabpage is a Diffview.
          view = {
            ["<tab>"]      = cb("select_next_entry"), -- Open the diff for the next file
            ["<s-tab>"]    = cb("select_prev_entry"), -- Open the diff for the previous file
            ["gf"]         = cb("goto_file"), -- Open the file in a new split in previous tabpage
            ["<C-w><C-f>"] = cb("goto_file_split"), -- Open the file in a new split
            ["<C-w>gf"]    = cb("goto_file_tab"), -- Open the file in a new tabpage
            ["<leader>e"]  = cb("focus_files"), -- Bring focus to the files panel
            ["<leader>b"]  = cb("toggle_files"), -- Toggle the files panel.
          },
          file_panel = {
            ["j"]             = cb("next_entry"), -- Bring the cursor to the next file entry
            ["<down>"]        = cb("next_entry"),
            ["k"]             = cb("prev_entry"), -- Bring the cursor to the previous file entry.
            ["<up>"]          = cb("prev_entry"),
            ["<cr>"]          = cb("select_entry"), -- Open the diff for the selected entry.
            ["o"]             = cb("select_entry"),
            ["<2-LeftMouse>"] = cb("select_entry"),
            ["-"]             = cb("toggle_stage_entry"), -- Stage / unstage the selected entry.
            ["S"]             = cb("stage_all"), -- Stage all entries.
            ["U"]             = cb("unstage_all"), -- Unstage all entries.
            ["X"]             = cb("restore_entry"), -- Restore entry to the state on the left side.
            ["R"]             = cb("refresh_files"), -- Update stats and entries in the file list.
            ["<tab>"]         = cb("select_next_entry"),
            ["<s-tab>"]       = cb("select_prev_entry"),
            ["gf"]            = cb("goto_file"),
            ["<C-w><C-f>"]    = cb("goto_file_split"),
            ["<C-w>gf"]       = cb("goto_file_tab"),
            ["i"]             = cb("listing_style"), -- Toggle between 'list' and 'tree' views
            ["f"]             = cb("toggle_flatten_dirs"), -- Flatten empty subdirectories in tree listing style.
            ["<leader>e"]     = cb("focus_files"),
            ["<leader>b"]     = cb("toggle_files"),
          },
          file_history_panel = {
            ["g!"]            = cb("options"), -- Open the option panel
            ["<C-A-d>"]       = cb("open_in_diffview"), -- Open the entry under the cursor in a diffview
            ["y"]             = cb("copy_hash"), -- Copy the commit hash of the entry under the cursor
            ["zR"]            = cb("open_all_folds"),
            ["zM"]            = cb("close_all_folds"),
            ["j"]             = cb("next_entry"),
            ["<down>"]        = cb("next_entry"),
            ["k"]             = cb("prev_entry"),
            ["<up>"]          = cb("prev_entry"),
            ["<cr>"]          = cb("select_entry"),
            ["o"]             = cb("select_entry"),
            ["<2-LeftMouse>"] = cb("select_entry"),
            ["<tab>"]         = cb("select_next_entry"),
            ["<s-tab>"]       = cb("select_prev_entry"),
            ["gf"]            = cb("goto_file"),
            ["<C-w><C-f>"]    = cb("goto_file_split"),
            ["<C-w>gf"]       = cb("goto_file_tab"),
            ["<leader>e"]     = cb("focus_files"),
            ["<leader>b"]     = cb("toggle_files"),
          },
          option_panel = {
            ["<tab>"] = cb("select"),
            ["q"]     = cb("close"),
          },
        },
      }
    end
  },
  {
    "luukvbaal/stabilize.nvim",
    config = function() require("stabilize").setup() end
  },

  {
    "jamestthompson3/nvim-remote-containers"
  },
  {
    "aserowy/tmux.nvim",
    config = function()
      require("tmux").setup({
        -- overwrite default configuration
        -- here, e.g. to enable default bindings
        copy_sync = {
          -- enables copy sync and overwrites all register actions to
          -- sync registers *, +, unnamed, and 0 till 9 from tmux in advance
          enable = true,

          -- ignore specific tmux buffers e.g. buffer0 = true to ignore the
          -- first buffer or named_buffer_name = true to ignore a named tmux
          -- buffer with name named_buffer_name :)
          ignore_buffers = { empty = false },

          -- TMUX >= 3.2: yanks (and deletes) will get redirected to system
          -- clipboard by tmux
          redirect_to_clipboard = false,

          -- offset controls where register sync starts
          -- e.g. offset 2 lets registers 0 and 1 untouched
          register_offset = 0,

          -- sync clipboard overwrites vim.g.clipboard to handle * and +
          -- registers. If you sync your system clipboard without tmux, disable
          -- this option!
          sync_clipboard = true,

          -- syncs deletes with tmux clipboard as well, it is adviced to
          -- do so. Nvim does not allow syncing registers 0 and 1 without
          -- overwriting the unnamed register. Thus, ddp would not be possible.
          sync_deletes = true,

          -- syncs the unnamed register with the first buffer entry from tmux.
          sync_unnamed = true,
        },
        navigation = {
          -- cycles to opposite pane while navigating into the border
          cycle_navigation = true,

          -- enables default keybindings (C-hjkl) for normal mode
          enable_default_keybindings = false,

          -- prevents unzoom tmux when navigating beyond vim border
          persist_zoom = false,
        },
        resize = {
          -- enables default keybindings (A-hjkl) for normal mode
          enable_default_keybindings = false,

          -- sets resize steps for x axis
          resize_step_x = 1,

          -- sets resize steps for y axis
          resize_step_y = 1,
        }
      })
    end
  },
  {
    "ray-x/lsp_signature.nvim",
    config = function()

      cfg = {
        debug = false, -- set to true to enable debug logging
        log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log", -- log dir when debug is on
        -- default is  ~/.cache/nvim/lsp_signature.log
        verbose = false, -- show debug line number

        bind = true, -- This is mandatory, otherwise border config won't get registered.
        -- If you want to hook lspsaga or other signature handler, pls set to false
        doc_lines = 10, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
        -- set to 0 if you DO NOT want any API comments be shown
        -- This setting only take effect in insert mode, it does not affect signature help in normal
        -- mode, 10 by default

        floating_window = true, -- show hint in a floating window, set to false for virtual text only mode

        floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
        -- will set to true when fully tested, set to false will use whichever side has more space
        -- this setting will be helpful if you do not want the PUM and floating win overlap

        floating_window_off_x = 1, -- adjust float windows x position.
        floating_window_off_y = 1, -- adjust float windows y position.


        fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters
        hint_enable = true, -- virtual hint enable
        hint_prefix = "🐼 ", -- Panda for parameter
        hint_scheme = "String",
        hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
        max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
        -- to view the hiding contents
        max_width = 80, -- max_width of signature floating_window, line will be wrapped if exceed max_width
        handler_opts = {
          border = "rounded" -- double, rounded, single, shadow, none
        },

        always_trigger = false, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58

        auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
        extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
        zindex = 200, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom

        padding = '', -- character to pad on left and right of signature can be ' ', or '|'  etc

        transparency = nil, -- disabled by default, allow floating win transparent value 1~100
        shadow_blend = 36, -- if you using shadow as border use this set the opacity
        shadow_guibg = 'Black', -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
        timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
        toggle_key = nil -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
      }

      -- recommended:
      require 'lsp_signature'.setup(cfg) -- no need to specify bufnr if you don't use toggle_key

      -- You can also do this inside lsp on_attach
      -- note: on_attach deprecated
      require 'lsp_signature'.on_attach(cfg, bufnr) -- no need to specify bufnr if you don't use toggle_key
    end
  },
  { "onsails/lspkind.nvim",
    config = function()
      require('lspkind').init({
        -- DEPRECATED (use mode instead): enables text annotations
        --
        -- default: true
        -- with_text = true,

        -- defines how annotations are shown
        -- default: symbol
        -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
        mode = 'symbol_text',

        -- default symbol map
        -- can be either 'default' (requires nerd-fonts font) or
        -- 'codicons' for codicon preset (requires vscode-codicons font)
        --
        -- default: 'default'
        preset = 'codicons',

        -- override preset symbols
        --
        -- default: {}
        symbol_map = {
          Text = "",
          Method = "",
          Function = "",
          Constructor = "",
          Field = "ﰠ",
          Variable = "",
          Class = "ﴯ",
          Interface = "",
          Module = "",
          Property = "ﰠ",
          Unit = "塞",
          Value = "",
          Enum = "",
          Keyword = "",
          Snippet = "",
          Color = "",
          File = "",
          Reference = "",
          Folder = "",
          EnumMember = "",
          Constant = "",
          Struct = "פּ",
          Event = "",
          Operator = "",
          TypeParameter = ""
        },
      })
    end
  },
  {
    'stevearc/aerial.nvim',
    config = function() require('aerial').setup() end
  },

  {
    "tversteeg/registers.nvim"
  },
  { "AckslD/nvim-neoclip.lua",
    config = function()
      requires = {
        { 'tami5/sqlite.lua', module = 'sqlite' },
        -- you'll need at least one of these
        -- {'nvim-telescope/telescope.nvim'},
        -- {'ibhagwan/fzf-lua'},
      }
      config = function()
        require('neoclip').setup({
          history = 1000,
          enable_persistent_history = false,
          length_limit = 1048576,
          continuous_sync = false,
          db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
          filter = nil,
          preview = true,
          default_register = '"',
          default_register_macros = 'q',
          enable_macro_history = true,
          content_spec_column = false,
          on_paste = {
            set_reg = false,
          },
          on_replay = {
            set_reg = false,
          },
          keys = {
            telescope = {
              i = {
                select = '<cr>',
                paste = '<c-p>',
                paste_behind = '<c-k>',
                replay = '<c-q>', -- replay a macro
                delete = '<c-d>', -- delete an entry
                custom = {},
              },
              n = {
                select = '<cr>',
                paste = 'p',
                paste_behind = 'P',
                replay = 'q',
                delete = 'd',
                custom = {},
              },
            },
            fzf = {
              select = 'default',
              paste = 'ctrl-p',
              paste_behind = 'ctrl-k',
              custom = {},
            },
          },
        })
      end
    end
  },
  { "tami5/sqlite.lua" },
  { "ThePrimeagen/harpoon",
    config = function()
      global_settings = {
        -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
        save_on_toggle = false,

        -- saves the harpoon file upon every change. disabling is unrecommended.
        save_on_change = true,

        -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
        enter_on_sendcmd = false,

        -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
        tmux_autoclose_windows = false,

        -- filetypes that you want to prevent from adding to the harpoon list menu.
        excluded_filetypes = { "harpoon" },

        -- set marks specific to each git branch inside git repository
        mark_branch = false,
      }
      require("telescope").load_extension('harpoon')
    end
  },
  {
    "nvim-neorg/neorg",
    config = function()
      require('neorg').setup {
        load = {
          ["core.defaults"] = {},
          ["core.defaults"] = {},
          ["core.norg.dirman"] = {
            config = {
              workspaces = {
                work = "~/notes/work",
                home = "~/notes/home",
              }
            }
          }
        } -- check out setup part...
      }
      require('nvim-treesitter.configs').setup {
        ensure_installed = { "norg", --[[ other parsers you would wish to have ]] },
        highlight = { -- Be sure to enable highlights if you haven't!
          enable = true,
        }
      }
    end,
    requires = "nvim-lua/plenary.nvim"
  },
  { 'nvim-orgmode/orgmode', config = function()
    require('orgmode').setup {}
    -- init.lua

    -- Load custom tree-sitter grammar for org filetype
    require('orgmode').setup_ts_grammar()

    -- Tree-sitter configuration
    require 'nvim-treesitter.configs'.setup {
      -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
      highlight = {
        enable = true,
        disable = { 'org' }, -- Remove this to use TS highlighter for some of the highlights (Experimental)
        additional_vim_regex_highlighting = { 'org' }, -- Required since TS highlighter doesn't support all syntax features (conceal)
      },
      ensure_installed = { 'org' }, -- Or run :TSUpdate org
    }

    require('orgmode').setup({
      org_agenda_files = { '~/Dropbox/org/*', '~/my-orgs/**/*' },
      org_default_notes_file = '~/Dropbox/org/refile.org',
    })
    require 'cmp'.setup({
      sources = {
        { name = 'orgmode' }
      }
    })

  end },

  {
    'jghauser/mkdir.nvim'
  },
  { 'matbme/JABS.nvim',
    config = function()
      -- (Optional) easy way to get Neovim current size.
      local ui = vim.api.nvim_list_uis()[1]

      require 'jabs'.setup {
        position = 'corner', -- center, corner
        width = 50,
        height = 10,
        border = 'shadow', -- none, single, double, rounded, solid, shadow, (or an array or chars)

        -- Options for preview window
        preview_position = 'left', -- top, bottom, left, right
        preview = {
          width = 40,
          height = 30,
          border = 'double', -- none, single, double, rounded, solid, shadow, (or an array or chars)
        },

        -- the options below are ignored when position = 'center'
        col = ui.width, -- Window appears on the right
        row = ui.height / 2, -- Window appears in the vertical middle
      }
    end
  },
  { 'famiu/bufdelete.nvim' },
  {
    'sudormrfbin/cheatsheet.nvim',

    requires = {
      { 'nvim-telescope/telescope.nvim' },
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
    }
  },
  {
    -- Optional but recommended
    -- 'nvim-treesitter/nvim-treesitter',
    'lewis6991/spellsitter.nvim',
  },
  { 'stevearc/dressing.nvim',
    config = function()
      require('dressing').setup({
        input = {
          -- Set to false to disable the vim.ui.input implementation
          enabled = true,

          -- Default prompt string
          default_prompt = "Input:",

          -- Can be 'left', 'right', or 'center'
          prompt_align = "left",

          -- When true, <Esc> will close the modal
          insert_only = true,

          -- These are passed to nvim_open_win
          anchor = "SW",
          border = "rounded",
          -- 'editor' and 'win' will default to being centered
          relative = "cursor",

          -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
          prefer_width = 40,
          width = nil,
          -- min_width and max_width can be a list of mixed types.
          -- min_width = {20, 0.2} means "the greater of 20 columns or 20% of total"
          max_width = { 140, 0.9 },
          min_width = { 20, 0.2 },

          -- Window transparency (0-100)
          winblend = 10,
          -- Change default highlight groups (see :help winhl)
          winhighlight = "",

          override = function(conf)
            -- This is the config that will be passed to nvim_open_win.
            -- Change values here to customize the layout
            return conf
          end,

          -- see :help dressing_get_config
          get_config = nil,
        },
        select = {
          -- Set to false to disable the vim.ui.select implementation
          enabled = true,

          -- Priority list of preferred vim.select implementations
          backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },

          -- Options for telescope selector
          -- These are passed into the telescope picker directly. Can be used like:
          -- telescope = require('telescope.themes').get_ivy({...})
          telescope = nil,

          -- Options for fzf selector
          fzf = {
            window = {
              width = 0.5,
              height = 0.4,
            },
          },

          -- Options for fzf_lua selector
          fzf_lua = {
            winopts = {
              width = 0.5,
              height = 0.4,
            },
          },

          -- Options for nui Menu
          nui = {
            position = "50%",
            size = nil,
            relative = "editor",
            border = {
              style = "rounded",
            },
            max_width = 80,
            max_height = 40,
          },

          -- Options for built-in selector
          builtin = {
            -- These are passed to nvim_open_win
            anchor = "NW",
            border = "rounded",
            -- 'editor' and 'win' will default to being centered
            relative = "editor",

            -- Window transparency (0-100)
            winblend = 10,
            -- Change default highlight groups (see :help winhl)
            winhighlight = "",

            -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
            -- the min_ and max_ options can be a list of mixed types.
            -- max_width = {140, 0.8} means "the lesser of 140 columns or 80% of total"
            width = nil,
            max_width = { 140, 0.8 },
            min_width = { 40, 0.2 },
            height = nil,
            max_height = 0.9,
            min_height = { 10, 0.2 },

            override = function(conf)
              -- This is the config that will be passed to nvim_open_win.
              -- Change values here to customize the layout
              return conf
            end,
          },

          -- Used to override format_item. See :help dressing-format
          format_item_override = {},

          -- see :help dressing_get_config
          get_config = function(opts)
            if opts.kind == 'codeaction' then
              return {
                backend = 'nui',
                nui = {
                  relative = 'cursor',
                  max_width = 40,
                }
              }
            end
          end
        },
      })
    end
  },
  {
    "rktjmp/hotpot.nvim"
  },
  {
    "SmiteshP/nvim-gps",
    requires = "nvim-treesitter/nvim-treesitter"
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup {
        -- for example, context is off by default, use this to turn it on
        show_current_context = true,
        show_current_context_start = true,
      }
    end
  },
  {
    "vuki656/package-info.nvim",
    requires = "MunifTanjim/nui.nvim",
  },
  { "kdheepak/lazygit.nvim" },
  {
    'tanvirtin/vgit.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  },
  { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim',
    config = function()
      local neogit = require("neogit")

      neogit.setup {
        disable_signs = false,
        disable_hint = false,
        disable_context_highlighting = false,
        disable_commit_confirmation = false,
        -- Neogit refreshes its internal state after specific events, which can be expensive depending on the repository size.
        -- Disabling `auto_refresh` will make it so you have to manually refresh the status after you open it.
        auto_refresh = true,
        disable_builtin_notifications = false,
        use_magit_keybindings = false,
        commit_popup = {
          kind = "split",
        },
        -- Change the default way of opening neogit
        kind = "tab",
        -- customize displayed signs
        signs = {
          -- { CLOSED, OPENED }
          section = { ">", "v" },
          item = { ">", "v" },
          hunk = { "", "" },
        },
        integrations = {
          -- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `sindrets/diffview.nvim`.
          -- The diffview integration enables the diff popup, which is a wrapper around `sindrets/diffview.nvim`.
          --
          -- Requires you to have `sindrets/diffview.nvim` installed.
          -- use {
          --   'TimUntersberger/neogit',
          --   requires = {
          --     'nvim-lua/plenary.nvim',
          --     'sindrets/diffview.nvim'
          --   }
          -- }
          --
          diffview = false
        },
        -- Setting any section to `false` will make the section not render at all
        sections = {
          untracked = {
            folded = false
          },
          unstaged = {
            folded = false
          },
          staged = {
            folded = false
          },
          stashes = {
            folded = true
          },
          unpulled = {
            folded = true
          },
          unmerged = {
            folded = false
          },
          recent = {
            folded = true
          },
        },
        -- override/add mappings
        mappings = {
          -- modify status buffer mappings
          status = {
            -- Adds a mapping with "B" as key that does the "BranchPopup" command
            ["B"] = "BranchPopup",
            -- Removes the default mapping of "s"
            ["s"] = "",
          }
        }
      }
    end
  },
  { 'ray-x/go.nvim',
    config = function()
      require('go').setup({
        go = 'go', -- go command, can be go[default] or go1.18beta1
        goimport = 'gopls', -- goimport command, can be gopls[default] or goimport
        fillstruct = 'gopls', -- can be nil (use fillstruct, slower) and gopls
        gofmt = 'gofumpt', --gofmt cmd,
        max_line_len = 120, -- max line length in goline format
        tag_transform = false, -- tag_transfer  check gomodifytags for details
        test_template = '', -- g:go_nvim_tests_template  check gotests for details
        test_template_dir = '', -- default to nil if not set; g:go_nvim_tests_template_dir  check gotests for details
        comment_placeholder = '', -- comment_placeholder your cool placeholder e.g. ﳑ       
        icons = { breakpoint = '🧘', currentpos = '🏃' }, -- setup to `false` to disable icons setup
        verbose = false, -- output loginf in messages
        lsp_cfg = false, -- true: use non-default gopls setup specified in go/lsp.lua
        -- false: do nothing
        -- if lsp_cfg is a table, merge table with with non-default gopls setup in go/lsp.lua, e.g.
        --   lsp_cfg = {settings={gopls={matcher='CaseInsensitive', ['local'] = 'your_local_module_path', gofumpt = true }}}
        lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
        lsp_on_attach = nil, -- nil: use on_attach function defined in go/lsp.lua,
        --      when lsp_cfg is true
        -- if lsp_on_attach is a function: use this function as on_attach function for gopls
        lsp_keymaps = true, -- set to false to disable gopls/lsp keymap
        lsp_codelens = true, -- set to false to disable codelens, true by default, you can use a function
        -- function(bufnr)
        --    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>F", "<cmd>lua vim.lsp.buf.formatting()<CR>", {noremap=true, silent=true})
        -- end
        -- to setup a table of codelens
        lsp_diag_hdlr = true, -- hook lsp diag handler
        -- virtual text setup
        lsp_diag_virtual_text = { space = 0, prefix = "" },
        lsp_diag_signs = true,
        lsp_diag_update_in_insert = false,
        lsp_document_formatting = true,
        -- set to true: use gopls to format
        -- false if you want to use other formatter tool(e.g. efm, nulls)
        gopls_cmd = nil, -- if you need to specify gopls path and cmd, e.g {"/home/user/lsp/gopls", "-logfile","/var/log/gopls.log" }
        gopls_remote_auto = true, -- add -remote=auto to gopls
        dap_debug = true, -- set to false to disable dap
        dap_debug_keymap = true, -- true: use keymap for debugger defined in go/dap.lua
        -- false: do not use keymap in go/dap.lua.  you must define your own.
        dap_debug_gui = true, -- set to true to enable dap gui, highly recommand
        dap_debug_vt = true, -- set to true to enable dap virtual text
        build_tags = "tag1,tag2", -- set default build tags
        textobjects = true, -- enable default text jobects through treesittter-text-objects
        test_runner = 'go', -- richgo, go test, richgo, dlv, ginkgo
        run_in_floaterm = false, -- set to true to run in float window. :GoTermClose closes the floatterm
        -- float term recommand if you use richgo/ginkgo with terminal color
      })


      local lsp_installer_servers = require 'nvim-lsp-installer.servers'

      local server_available, requested_server = lsp_installer_servers.get_server("gopls")
      if server_available then
        requested_server:on_ready(function()
          local opts = require 'go.lsp'.config() -- config() return the go.nvim gopls setup
          requested_server:setup(opts)
        end)
        if not requested_server:is_installed() then
          -- Queue the server to be installed
          requested_server:install()
        end
      end

      local path = require 'nvim-lsp-installer.path'
      local install_root_dir = path.concat { vim.fn.stdpath 'data', 'lsp_servers' }

      require('go').setup({
        gopls_cmd = { install_root_dir .. '/media/evity/软件/GoSrc' },
        filstruct = 'gopls',
        dap_debug = true,
        dap_debug_gui = true
      })

    end
  },
  { 'gennaro-tedesco/nvim-jqx' },
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        {
          signs = true, -- show icons in the signs column
          sign_priority = 8, -- sign priority
          -- keywords recognized as todo comments
          keywords = {
            FIX = {
              icon = " ", -- icon used for the sign, and in search results
              color = "error", -- can be a hex color, or a named color (see below)
              alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
              -- signs = false, -- configure signs for some keywords individually
            },
            TODO = { icon = " ", color = "info" },
            HACK = { icon = " ", color = "warning" },
            WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
            PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
            NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
          },
          merge_keywords = true, -- when true, custom keywords will be merged with the defaults
          -- highlighting of the line containing the todo comment
          -- * before: highlights before the keyword (typically comment characters)
          -- * keyword: highlights of the keyword
          -- * after: highlights after the keyword (todo text)
          highlight = {
            before = "", -- "fg" or "bg" or empty
            keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
            after = "fg", -- "fg" or "bg" or empty
            pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
            comments_only = true, -- uses treesitter to match keywords in comments only
            max_line_len = 400, -- ignore lines longer than this
            exclude = {}, -- list of file types to exclude highlighting
          },
          -- list of named colors where we try to extract the guifg from the
          -- list of hilight groups or use the hex color if hl not found as a fallback
          colors = {
            error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
            warning = { "DiagnosticWarning", "WarningMsg", "#FBBF24" },
            info = { "DiagnosticInfo", "#2563EB" },
            hint = { "DiagnosticHint", "#10B981" },
            default = { "Identifier", "#7C3AED" },
          },
          search = {
            command = "rg",
            args = {
              "--color=never",
              "--no-heading",
              "--with-filename",
              "--line-number",
              "--column",
            },
            -- regex that will be used to match keywords.
            -- don't replace the (KEYWORDS) placeholder
            pattern = [[\b(KEYWORDS):]], -- ripgrep regex
            -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
          },
        }
      }
    end
  },
  { 'kevinhwang91/nvim-bqf',
    config = function()
      vim.cmd([[
    hi BqfPreviewBorder guifg=#50a14f ctermfg=71
    hi link BqfPreviewRange Search
]]     )

      require('bqf').setup({
        auto_enable = true,
        auto_resize_height = true, -- highly recommended enable
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border_chars = { '┃', '┃', '━', '━', '┏', '┓', '┗', '┛', '█' },
          should_preview_cb = function(bufnr, qwinid)
            local ret = true
            local bufname = vim.api.nvim_buf_get_name(bufnr)
            local fsize = vim.fn.getfsize(bufname)
            if fsize > 100 * 1024 then
              -- skip file size greater than 100k
              ret = false
            elseif bufname:match('^fugitive://') then
              -- skip fugitive buffer
              ret = false
            end
            return ret
          end
        },
        -- make `drop` and `tab drop` to become preferred
        func_map = {
          drop = 'o',
          openc = 'O',
          split = '<C-s>',
          tabdrop = '<C-t>',
          tabc = '',
          ptogglemode = 'z,',
        },
        filter = {
          fzf = {
            action_for = { ['ctrl-s'] = 'split', ['ctrl-t'] = 'tab drop' },
            extra_opts = { '--bind', 'ctrl-o:toggle-all', '--prompt', '> ' }
          }
        }
      })
    end
  },
  {
    'phaazon/hop.nvim',
    branch = 'v1', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },
  { 'michaelb/sniprun', run = 'bash ./install.sh' },
  { 'kevinhwang91/nvim-hlslens' },
  { "petertriho/nvim-scrollbar" },
  { 'karb94/neoscroll.nvim' },
  {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end
  },
  {
    'filipdutescu/renamer.nvim',
    branch = 'master',
    requires = { { 'nvim-lua/plenary.nvim' } }
  },
  { 'nacro90/numb.nvim',
    config = function()
      require('numb').setup {
        show_numbers = true, -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
        number_only = false, -- Peek only when the command is only a number instead of when it starts with a number
        centered_peeking = true, -- Peeked line will be centered relative to window
      }
    end
  },
  { 'romgrk/nvim-treesitter-context' },
  { 'anuvyklack/pretty-fold.nvim',
    requires = 'anuvyklack/nvim-keymap-amend', -- only for preview
    config = function()
      require('pretty-fold').setup()
      require('pretty-fold.preview').setup()
    end
  },
  { 'edluffy/specs.nvim' },
  { 'sbdchd/neoformat' },
  {
    "NTBBloodbath/rest.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("rest-nvim").setup({
        -- Open request results in a horizontal split
        result_split_horizontal = false,
        -- Keep the http file buffer above|left when split horizontal|vertical
        result_split_in_place = false,
        -- Skip SSL verification, useful for unknown certificates
        skip_ssl_verification = false,
        -- Highlight request on run
        highlight = {
          enabled = true,
          timeout = 150,
        },
        result = {
          -- toggle showing URL, HTTP info, headers at top the of result window
          show_url = true,
          show_http_info = true,
          show_headers = true,
        },
        -- Jump to request line on run
        jump_to_request = false,
        env_file = '.env',
        custom_dynamic_variables = {},
        yank_dry_run = true,
      })
    end
  },
  { 'andweeb/presence.nvim',
    config = function()
      -- The setup config table shows all available config options with their default values:
      require("presence"):setup({
        -- General options
        auto_update        = true, -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
        neovim_image_text  = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
        main_image         = "neovim", -- Main image display (either "neovim" or "file")
        client_id          = "793271441293967371", -- Use your own Discord application client id (not recommended)
        log_level          = nil, -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
        debounce_timeout   = 10, -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
        enable_line_number = false, -- Displays the current line number instead of the current project
        blacklist          = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
        buttons            = true, -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
        file_assets        = {}, -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)

        -- Rich Presence text options
        editing_text        = "Editing %s", -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
        file_explorer_text  = "Browsing %s", -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
        git_commit_text     = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
        plugin_manager_text = "Managing plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
        reading_text        = "Reading %s", -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
        workspace_text      = "Working on %s", -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
        line_number_text    = "Line %s out of %s", -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
      })
    end
  },
  { "ekickx/clipboard-image.nvim",
    config = function()
      require 'clipboard-image'.setup {
        -- Default configuration for all filetype
        default = {
          img_dir = "images",
          img_name = function() return os.date('%Y-%m-%d-%H-%M-%S') end, -- Example result: "2021-04-13-10-04-18"
          affix = "<\n  %s\n>" -- Multi lines affix
        },
        -- You can create configuration for ceartain filetype by creating another field (markdown, in this case)
        -- If you're uncertain what to name your field to, you can run `lua print(vim.bo.filetype)`
        -- Missing options from `markdown` field will be replaced by options from `default` field
        markdown = {
          img_dir = { "src", "assets", "img" }, -- Use table for nested dir (New feature form PR #20)
          img_dir_txt = "/assets/img",
          img_handler = function(img) -- New feature from PR #22
            local script = string.format('./image_compressor.sh "%s"', img.path)
            os.execute(script)
          end,
        }
      }
    end
  },
  { 'gelguy/wilder.nvim',
    config = function()
      -- config goes here
    end,
  },
  { 'rmagatti/auto-session',
    config = function()
      require('auto-session').setup {
        log_level = 'info',
        auto_session_suppress_dirs = { '~/', '~/Projects' }
      }
    end
  },
  {"Shatur/neovim-session-manager",
config = function ()
  local Path = require('plenary.path')
  require('session_manager').setup({
    sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), -- The directory where the session files will be saved.
    path_replacer = '__', -- The character to which the path separator will be replaced for session files.
    colon_replacer = '++', -- The character to which the colon symbol will be replaced for session files.
    autoload_mode = require('session_manager.config').AutoloadMode.LastSession, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
    autosave_last_session = true, -- Automatically save last session on exit and on session switch.
    autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
    autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
      'gitcommit',
    }, 
    autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
    max_path_length = 80,  -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
  })
end
},
  { "rcarriga/vim-ultest", requires = { "vim-test/vim-test" }, run = ":UpdateRemotePlugins" },
  { "vim-test/vim-test" },
  { 'chipsenkbeil/distant.nvim',
    config = function()
      require('distant').setup {
        -- Applies Chip's personal settings to every machine you connect to
        --
        -- 1. Ensures that distant servers terminate with no connections
        -- 2. Provides navigation bindings for remote directories
        -- 3. Provides keybinding to jump into a remote file's parent directory
        ['*'] = require('distant.settings').chip_default()
      }
    end },
  { "beauwilliams/focus.nvim", config = function() require("focus").setup() end },
  { 'sindrets/winshift.nvim' },
  { "hkupty/nvimux" },
  { "LinArcX/telescope-command-palette.nvim",
    config = function()
      require('telescope').setup({
        extensions = {
          command_palette = {
            { "File",
              { "entire selection (C-a)", ':call feedkeys("GVgg")' },
              { "save current file (C-s)", ':w' },
              { "save all files (C-A-s)", ':wa' },
              { "quit (C-q)", ':qa' },
              { "file browser (C-i)", ":lua require'telescope'.extensions.file_browser.file_browser()", 1 },
              { "search word (A-w)", ":lua require('telescope.builtin').live_grep()", 1 },
              { "git files (A-f)", ":lua require('telescope.builtin').git_files()", 1 },
              { "files (C-f)", ":lua require('telescope.builtin').find_files()", 1 },
            },
            { "Help",
              { "tips", ":help tips" },
              { "cheatsheet", ":help index" },
              { "tutorial", ":help tutor" },
              { "summary", ":help summary" },
              { "quick reference", ":help quickref" },
              { "search help(F1)", ":lua require('telescope.builtin').help_tags()", 1 },
            },
            { "Vim",
              { "reload vimrc", ":source $MYVIMRC" },
              { 'check health', ":checkhealth" },
              { "jumps (Alt-j)", ":lua require('telescope.builtin').jumplist()" },
              { "commands", ":lua require('telescope.builtin').commands()" },
              { "command history", ":lua require('telescope.builtin').command_history()" },
              { "registers (A-e)", ":lua require('telescope.builtin').registers()" },
              { "colorshceme", ":lua require('telescope.builtin').colorscheme()", 1 },
              { "vim options", ":lua require('telescope.builtin').vim_options()" },
              { "keymaps", ":lua require('telescope.builtin').keymaps()" },
              { "buffers", ":Telescope buffers" },
              { "search history (C-h)", ":lua require('telescope.builtin').search_history()" },
              { "paste mode", ':set paste!' },
              { 'cursor line', ':set cursorline!' },
              { 'cursor column', ':set cursorcolumn!' },
              { "spell checker", ':set spell!' },
              { "relative number", ':set relativenumber!' },
              { "search highlighting (F12)", ':set hlsearch!' },
            }
          }
        }
      })
      require('telescope').setup({
        extensions = {
          command_palette = {
            { "File",
              { "entire selection (C-a)", ':call feedkeys("GVgg")' },
              { "save current file (C-s)", ':w' },
              { "save all files (C-A-s)", ':wa' },
              { "quit (C-q)", ':qa' },
              { "file browser (C-i)", ":lua require'telescope'.extensions.file_browser.file_browser()", 1 },
              { "search word (A-w)", ":lua require('telescope.builtin').live_grep()", 1 },
              { "git files (A-f)", ":lua require('telescope.builtin').git_files()", 1 },
              { "files (C-f)", ":lua require('telescope.builtin').find_files()", 1 },
            },
            { "Help",
              { "tips", ":help tips" },
              { "cheatsheet", ":help index" },
              { "tutorial", ":help tutor" },
              { "summary", ":help summary" },
              { "quick reference", ":help quickref" },
              { "search help(F1)", ":lua require('telescope.builtin').help_tags()", 1 },
            },
            { "Vim",
              { "reload vimrc", ":source $MYVIMRC" },
              { 'check health', ":checkhealth" },
              { "jumps (Alt-j)", ":lua require('telescope.builtin').jumplist()" },
              { "commands", ":lua require('telescope.builtin').commands()" },
              { "command history", ":lua require('telescope.builtin').command_history()" },
              { "registers (A-e)", ":lua require('telescope.builtin').registers()" },
              { "colorshceme", ":lua require('telescope.builtin').colorscheme()", 1 },
              { "vim options", ":lua require('telescope.builtin').vim_options()" },
              { "keymaps", ":lua require('telescope.builtin').keymaps()" },
              { "buffers", ":Telescope buffers" },
              { "search history (C-h)", ":lua require('telescope.builtin').search_history()" },
              { "paste mode", ':set paste!' },
              { 'cursor line', ':set cursorline!' },
              { 'cursor column', ':set cursorcolumn!' },
              { "spell checker", ':set spell!' },
              { "relative number", ':set relativenumber!' },
              { "search highlighting (F12)", ':set hlsearch!' },
            }
          }
        }
      })
      require('telescope').load_extension('command_palette')

      table.insert(require('command_palette').CpMenu,
        { "Dap",
        { "pause", ":lua require'dap'.pause()" },
        { "step into", ":lua require'dap'.step_into()" },
        { "step back", ":lua require'dap'.step_back()" },
        { "step over", ":lua require'dap'.step_over()" },
        { "step out", ":lua require'dap'.step_out()" },
        { "frames", ":lua require'telescope'.extensions.dap.frames{}" },
        { "current scopes", ":lua ViewCurrentScopes(); vim.cmd(\"wincmd w|vertical resize 40\")" },
        { "current scopes floating window", ":lua ViewCurrentScopesFloatingWindow()" },
        { "current value floating window", ":lua ViewCurrentValueFloatingWindow()" },
        { "commands", ":lua require'telescope'.extensions.dap.commands{}" },
        { "configurations", ":lua require'telescope'.extensions.dap.configurations{}" },
        { "repl", ":lua require'dap'.repl.open(); vim.cmd(\"wincmd w|resize 12\")" },
        { "close", ":lua require'dap'.close(); require'dap'.repl.close()" },
        { "run to cursor", ":lua require'dap'.run_to_cursor()" },
        { "continue", ":lua require'dap'.continue()" },
        { "clear breakpoints", ":lua require('dap.breakpoints').clear()" },
        { "brakpoints", ":lua require'telescope'.extensions.dap.list_breakpoints{}" },
        { "toggle breakpoint", ":lua require'dap'.toggle_breakpoint()" },
      })

    end
  },

  { 'RRethy/nvim-treesitter-textsubjects',
    config = function()
      require('nvim-treesitter.configs').setup {
        textsubjects = {
          enable = true,
          prev_selection = ',', -- (Optional) keymap to select the previous selection
          keymaps = {
            ['.'] = 'textsubjects-smart',
            [';'] = 'textsubjects-container-outer',
            ['i;'] = 'textsubjects-container-inner',
          },
        },
      }
    end
  },
  { "RRethy/nvim-treesitter-endwise",
    config = function()
      require('nvim-treesitter.configs').setup {
        endwise = {
          enable = true,
        },
      }
    end
  },

  { 'nvim-treesitter/nvim-treesitter-textobjects',
    config = function()
      require 'nvim-treesitter.configs'.setup {
        textobjects = {
          select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
        },
      }
    end
  },
  { "mfussenegger/nvim-ts-hint-textobject",
    config = function()
      require("tsht").config.hint_keys = { "h", "j", "f", "d", "n", "v", "s", "l", "a" }
    end
  },
  -- Lua
  { "nvim-telescope/telescope-file-browser.nvim",
    config = function()
      -- You don't need to set any of these options.
      -- IMPORTANT!: this is only a showcase of how you can set default options!
      require("telescope").setup {
        extensions = {
          file_browser = {
            theme = "ivy",
            mappings = {
              ["i"] = {
                -- your custom insert mode mappings
              },
              ["n"] = {
                -- your custom normal mode mappings
              },
            },
          },
        },
      }
      -- To get telescope-file-browser loaded and working with telescope,
      -- you need to call load_extension, somewhere after setup function:
      require("telescope").load_extension "file_browser"
    end
  },
  { "nvim-telescope/telescope-github.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      require('telescope').load_extension('gh')
    end
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require "telescope".load_extension("frecency")
      require('telescope').setup {
        extensions = {
          frecency = {
            db_root = "home/my_username/path/to/db_root",
            show_scores = false,
            show_unindexed = true,
            ignore_patterns = { "*.git/*", "*/tmp/*" },
            disable_devicons = false,
            workspaces = {
              ["conf"]    = "/home/my_username/.config",
              ["data"]    = "/home/my_username/.local/share",
              ["project"] = "/home/my_username/projects",
              ["wiki"]    = "/home/my_username/wiki"
            }
          }
        },
      }
    end,
    requires = { "tami5/sqlite.lua" }
  },
  { 'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      -- This is your opts table
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
              -- even more opts
            }

            -- pseudo code / specification for writing custom displays, like the one
            -- for "codeactions"
            -- specific_opts = {
            --   [kind] = {
            --     make_indexed = function(items) -> indexed_items, width,
            --     make_displayer = function(widths) -> displayer
            --     make_display = function(displayer) -> function(e)
            --     make_ordinal = function(e) -> string
            --   },
            --   -- for example to disable the custom builtin "codeactions" display
            --      do the following
            --   codeactions = false,
            -- }
          }
        }
      }
      -- To get ui-select loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require("telescope").load_extension("ui-select")
    end
  },
  {'gaborvecsei/memento.nvim',

},
  {'dinhhuy258/vim-local-history'},
  {'Pocco81/AutoSave.nvim',
config = function()
  local autosave = require("autosave")

autosave.setup(
    {
        enabled = true,
        execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
        events = {"InsertLeave", "TextChanged"},
        conditions = {
            exists = true,
            filename_is_not = {},
            filetype_is_not = {},
            modifiable = true
        },
        write_all_buffers = false,
        on_off_commands = true,
        clean_command_line_interval = 0,
        debounce_delay = 135
    }
)
end
},
{'mrjones2014/legendary.nvim',
config = function()
  require('legendary').setup({
    -- Include builtins by default, set to false to disable
    include_builtin = true,
    -- Include the commands that legendary.nvim creates itself
    -- in the legend by default, set to false to disable
    include_legendary_cmds = true,
    -- Customize the prompt that appears on your vim.ui.select() handler
    -- Can be a string or a function that takes the `kind` and returns
    -- a string. See "Item Kinds" below for details. By default,
    -- prompt is 'Legendary' when searching all items,
    -- 'Legendary Keymaps' when searching keymaps,
    -- 'Legendary Commands' when searching commands,
    -- and 'Legendary Autocmds' when searching autocmds.
    select_prompt = nil,
    -- Optionally pass a custom formatter function. This function
    -- receives the item as a parameter and must return a table of
    -- non-nil string values for display. It must return the same
    -- number of values for each item to work correctly.
    -- The values will be used as column values when formatted.
    -- See function `get_default_format_values(item)` in
    -- `lua/legendary/formatter.lua` to see default implementation.
    formatter = nil,
    -- When you trigger an item via legendary.nvim,
    -- show it at the top next time you use legendary.nvim
    most_recent_item_at_top = true,
    -- Initial keymaps to bind
    keymaps = {
      -- your keymap tables here
    },
    -- Initial commands to bind
    commands = {
      -- your command tables here
    },
    -- Initial augroups and autocmds to bind
    autocmds = {
      -- your autocmd tables here
    },
    which_key = {
      -- you can put which-key.nvim tables here,
      -- or alternatively have them auto-register,
      -- see section on which-key integration
      mappings = {},
      opts = {},
      -- controls whether legendary.nvim actually binds they keymaps,
      -- or if you want to let which-key.nvim handle the bindings.
      -- if not passed, true by default
      do_binding = {},
    },
    -- Automatically add which-key tables to legendary
    -- see "which-key.nvim Integration" below for more details
    auto_register_which_key = true,
    -- settings for the :LegendaryScratch command
    scratchpad = {
      -- configure how to show results of evaluated Lua code,
      -- either 'print' or 'float'
      -- Pressing q or <ESC> will close the float
      display_results = 'float',
    },
  })
  -- automatically register which-key.nvim tables with legendary.nvim
-- when you register them with which-key.nvim.
-- `setup()` must be called before `require('which-key).register()`
require('legendary').setup()
-- now this will register them with both which-key.nvim and legendary.nvim
require('which-key').register(your_which_key_tables, your_which_key_opts)

-- or, pass them through setup() directly
require('legendary').setup({
  which_key = {
    mappings = your_which_key_tables,
    opts = your_which_key_opts,
    -- false if which-key.nvim handles binding them,
    -- set to true if you want legendary.nvim to handle binding
    -- the mappings; if not passed, true by default
    do_binding = false,
  },
})

-- or, if you'd prefer to manually register with legendary.nvim
require('legendary').setup({ auto_register_which_key = false })
require('which-key').register(your_which_key_tables, your_which_key_opts)
require('legendary').bind_whichkey({
  your_which_key_tables,
  your_which_key_opts,
  -- false if which-key.nvim handles binding them,
  -- set to true if you want legendary.nvim to handle binding
  -- the mappings; if not passed, true by default
  false,
})
end
},
{"embear/vim-localvimrc"},
{"theHamsta/nvim-dap-virtual-text",
config = function()

  require("nvim-dap-virtual-text").setup {
    enabled = true,                        -- enable this plugin (the default)
    enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
    highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
    show_stop_reason = true,               -- show stop reason when stopped for exceptions
    commented = false,                     -- prefix virtual text with comment string
    only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
    all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
    filter_references_pattern = '<module', -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
    -- experimental features:
    virt_text_pos = 'eol',                 -- position of virtual text, see `:h nvim_buf_set_extmark()`
    all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
    virt_text_win_col = nil                -- position the virtual text at a fixed window column (starting from the first text column) ,
                                           -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
}
end
},
{"rcarriga/nvim-dap-ui",
config = function ()
  require("dapui").setup({
    icons = { expanded = "▾", collapsed = "▸" },
    mappings = {
      -- Use a table to apply multiple mappings
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      edit = "e",
      repl = "r",
      toggle = "t",
    },
    -- Expand lines larger than the window
    -- Requires >= 0.7
    expand_lines = vim.fn.has("nvim-0.7"),
    sidebar = {
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
      size = 40,
      position = "left", -- Can be "left", "right", "top", "bottom"
    },
    tray = {
      elements = { "repl" },
      size = 10,
      position = "bottom", -- Can be "left", "right", "top", "bottom"
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
    }
  })
end
},
{"nvim-telescope/telescope-dap.nvim"},

}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
