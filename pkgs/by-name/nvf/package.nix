{ pkgs, inputs, ... }:

(inputs.nvf.lib.neovimConfiguration {
  inherit pkgs;
  
  modules = [ ./config.nix ];
}).neovim
