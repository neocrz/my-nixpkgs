
{ pkgs, ... }:

{
  vim = {
    theme = {
      enable = true;
      name = "catppuccin";
      style = "macchiato";
    };

    treesitter.enable = true;
    lsp.enable = true;

    languages = {
      nix.enable = true;
      lua.enable = true;
    };

    extraPlugins = {
      oil = {
        package = (pkgs.vimPlugins.oil-nvim);
        setup = "require('oil').setup()";
      };
    };
  };
}
