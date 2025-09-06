
{ pkgs, ... }:

{
  vim = {
    package = pkgs.neovim-unwrapped;
    theme = {
      enable = true;
      name = "catppuccin";
      style = "macchiato";
    };

    treesitter.enable = true;
    lsp.enable = true;

    autocomplete.nvim-cmp.enable = true;
    telescope.enable = true;
    statusline.lualine.enable = true;

    languages = {
      enableTreesitter = true;

      lua.enable = true;
      nix.enable = true;
      python.enable = true;
      rust.enable = true;
      zig.enable = true;
      ts.enable = true;
    };

    extraPlugins = {
    };
  };
}
