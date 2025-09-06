# /my-nixpkgs/flake.nix

{
  description = "my-nixpkgs: A collection of my personal programs and configurations tailored to my specific needs.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "github:nix-systems/default";
    pkgs-by-name-for-flake-parts.url = "github:drupol/pkgs-by-name-for-flake-parts";
    nvf.url = "github:NotAShelf/nvf";
  };

  outputs =
    inputs@{ flake-parts, systems, ... }:
    flake-parts.lib.mkFlake { 
      inherit inputs; 
    } {
      systems = import systems;

      imports = [
        # Import the module directly, without calling it as a function.
        inputs.pkgs-by-name-for-flake-parts.flakeModule
        ./imports/formatter.nix
        ./imports/overlay.nix
        ./imports/pkgs.nix
        ./imports/pkgs-all.nix
        ./imports/pkgs-by-name.nix # This file will now contain the config
      ];

      perSystem =
        { config, pkgs, ... }:
        {
          devShells.default = pkgs.mkShell {
            packages = [
              config.packages.my-echo
              config.packages.nvf
              pkgs.local.example2
            ];
          };
        };
    };
}
