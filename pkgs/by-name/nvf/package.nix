{ pkgs, nvf, ... }:

(nvf.lib.neovimConfiguration {
  inherit pkgs;

  modules = [
    {
      # nvf configuration
      vim = {

        theme = {
          enable = true;
          name = "catppuccin";
          style = "macchiato";
        };

        treesitter.enable = true;
        lsp.enable = true;

        # language support
        languages = {
          nix.enable = true;
          rust.enable = true;
          bash.enable = true;
        };

        # aliases
        viAlias = true;
        vimAlias = true;
      };
    }
  ];
}).neovim
