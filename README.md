# my-nixpkgs - My Custom Nixpkgs Overlay
A collection of my personal programs and configurations tailored to my specific needs.

This repository is structured based on the [my-own-nixpkgs](https://github.com/drupol/my-own-nixpkgs) initial template.

## Usage

The primary way to use this repository is by adding it as an input to your own flake and applying its `default` overlay. This will make all the custom packages available under:
- `pkgs.<pkg>` using the default method or
- `pkgs.neocrz.<pkg>` using the namespace.

### Step 1: Add as a Flake Input

In your `flake.nix`, add `my-nixpkgs` to your inputs. 

```nix
# flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Add as nixpkgs-neocrz
    nixpkgs-neocrz.url = "github:neocrz/my-nixpkgs";

    # ... other inputs
  };

  outputs = { self, nixpkgs, nixpkgs-neocrz, ... }@inputs: {
    # ... your flake outputs
  };
}
```

### Step 2: Apply the Overlay

You can apply the overlay in any flake-based project, such as a NixOS configuration, a Home Manager setup, or a standalone development shell.


```nix
{
  # ... inputs from Step 1

  outputs = { self, nixpkgs, nixpkgs-neocrz, ... }@inputs: {
    nixosConfigurations.my-machine = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; }; # Pass inputs to modules
      modules = [
        {
          # Apply the overlay here
          nixpkgs.overlays = [
            inputs.nixpkgs-neocrz.overlays.default
          ];
        }
        ./configuration.nix # Your main NixOS configuration
      ];
    };
  };
}
```

### Step 3: Use the Packages

Once the overlay is applied, all packages are available under `pkgs`.

```nix
# In a NixOS or Home Manager module (e.g., configuration.nix or home.nix)
{ pkgs, ... }:

{
  # Example for NixOS
  environment.systemPackages = [
    pkgs.my-echo
    pkgs.nvf
  ];

  # Example for Home Manager
  home.packages = [
    pkgs.my-echo
    pkgs.nvf
  ];
}
```

### Alternative: Using a Custom Namespace

If you want to avoid potential conflicts with other overlays, you can place all packages from this overlay under a custom namespace (e.g., `neocrz`).

1.  **Define the namespaced overlay:**

    ```nix
    # In your flake.nix
    # ...
    nixpkgs.overlays = [
      (final: prev: {
        # All packages from nixpkgs-neocrz will be under `pkgs.neocrz`
        neocrz = inputs.nixpkgs-neocrz.overlays.default final prev;
      })
    ];
    # ...
    ```

2.  **Use packages with the new path:**

    ```nix
    # In your configuration.nix or home.nix
    environment.systemPackages = [
      pkgs.neocrz.my-echo
      pkgs.neocrz.nvf
    ];
    ```

## Available Packages

-   `my-echo`: A simple custom echo script.
-   `nvf`: A personalized Neovim configuration built with [`nvf`](https://github.com/NotAShelf/nvf).
-   `example2`: An example shell application.

## Local Development

This repository includes a development shell that contains some of the custom packages. 
```sh
# Enter the development environment
nix develop

# Now you can run the custom commands
my-echo "Hello from the dev shell"
vim .
```

