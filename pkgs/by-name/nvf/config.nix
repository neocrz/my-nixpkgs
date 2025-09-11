
{ pkgs, ... }:

{
  vim = {
    viAlias = true;
    vimAlias = true;
    debugMode = {
      enable = false;
      level = 16;
      logFile = "/tmp/nvim.log";
    };

    spellcheck = {
      enable = true;
      # programmingWordlist.enable = true;
    };

    theme = {
      enable = true;
      name = "catppuccin";
      style = "macchiato";
      transparent = false;
    };
    
    options = {
      autoindent = false;
      shiftwidth = 0;
      tabstop = 2;
      expandtab = true;
    };

    lsp = {
      enable = true;
      formatOnSave = true;
      lspkind.enable = false;
      lightbulb.enable = false;
      trouble.enable = true;
      lspSignature.enable = true; #false;
      # otter-nvim.enable = true;
      # nvim-docs-view.enable = true;
    };

    debugger = {
      nvim-dap = {
        enable = true;
        ui.enable = true;
      };
    };

    autocomplete = {
      nvim-cmp.enable = true;
      # blink-cmp.enable = true;
    };

    telescope.enable = true;
    statusline = {
      lualine = {
        enable = true;
        theme = "catppuccin";
      };
    };

    treesitter = {
      enable = true;
      context.enable = true;
    };

    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;

      bash.enable = true;
      css.enable = true;
      clang.enable = true;
      go.enable = true;
      haskell.enable = true;
      html.enable = true;
      julia.enable = true;
      lua.enable = true;
      markdown.enable = true;
      nix.enable = true;
      ocaml.enable = true;
      python.enable = true;
      r.enable = true;
      rust.enable = true;
      sql.enable = true;
      zig.enable = true;
      typst.enable = true;
      ts.enable = true;
    };

    extraPlugins = {
    };

    visuals = {
      # nvim-scrollbar.enable = true;
      nvim-web-devicons.enable = true;
      nvim-cursorline.enable = true;
      cinnamon-nvim.enable = true;
      fidget-nvim.enable = true;

      highlight-undo.enable = true;
      indent-blankline.enable = true;
    };

    autopairs.nvim-autopairs.enable = true;
    
    snippets.luasnip.enable = true;
  
    filetree = {
      neo-tree = {
        enable = true;
      };
    };

    tabline = {
      nvimBufferline.enable = true;
    };

    binds = {
      whichKey.enable = true;
      cheatsheet.enable = true;
    };

    git = {
      enable = true;
      gitsigns.enable = true;
      gitsigns.codeActions.enable = false; # throws debug message
      # neogit.enable = true;
    };

    minimap = {
      minimap-vim.enable = false;
      # codewindow.enable = true;
    };

    dashboard = {
      dashboard-nvim.enable = false;
      # alpha.enable = true;
    };
    
    notify = {
      nvim-notify.enable = true;
    };

    projects = {
      # project-nvim.enable = true;
    };

     utility = {
      ccc.enable = false;
      vim-wakatime.enable = false;
      diffview-nvim.enable = true;
      yanky-nvim.enable = false;
      # icon-picker.enable = true;
      # surround.enable = true;
      # leetcode-nvim.enable = true;
      # multicursors.enable = true;
      # smart-splits.enable = true;
      # undotree.enable = true;
      # nvim-biscuits.enable = true;

      motion = {
        hop.enable = true;
        leap.enable = true;
        # precognition.enable = true;
      };
      images = {
        image-nvim.enable = false;
        # img-clip.enable = true;
      };
    };

    notes = {
      obsidian.enable = false; # try with true later
      neorg.enable = false;
      orgmode.enable = false;
      # mind-nvim.enable = true;
      todo-comments.enable = true;
    };

    terminal = {
      toggleterm = {
        enable = true;
        lazygit.enable = true;
      };
    };

    ui = {
      borders.enable = true;
      noice.enable = true;
      colorizer.enable = true;
      modes-nvim.enable = false;
      illuminate.enable = true;
      breadcrumbs = {
        # enable = true;
        # navbuddy.enable = true;
      };
      smartcolumn = {
        enable = true;
        setupOpts.custom_colorcolumn = {
          # `buftype = int;` for configuring column position
          nix = "110";
          ruby = "120";
          java = "130";
          go = ["90" "130"];
        };
      };
      fastaction.enable = true;
    };

    assistant = {
      chatgpt.enable = false;
      copilot = {
        enable = false;
        # cmp.enable = true;
      };
      codecompanion-nvim.enable = false;
      # avante-nvim.enable = true;
    };

    session = {
      nvim-session-manager.enable = false;
    };

    gestures = {
      gesture-nvim.enable = false;
    };

    comments = {
      comment-nvim.enable = true;
    };

    presence = {
      neocord.enable = false;
    };

  };
}
