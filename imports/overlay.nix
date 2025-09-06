{ withSystem, ... }:

{
  flake = {
    overlays.default =
      final: prev:
      withSystem prev.stdenv.hostPlatform.system (
        { config, ... }:
        # return the package set directly
        config.packages
      );
  };
}
