{ pkgs, ... }:

pkgs.stdenv.mkDerivation {
  pname = "my-echo";
  version = "0.1.0";

  src = ./.;  # Or fetch from a repo if it's external

  buildPhase = ''
    echo '#!/bin/bash' > my-echo
    echo 'echo "Custom: $@"' >> my-echo
    chmod +x my-echo
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp my-echo $out/bin/
  '';

  meta = {
    description = "My custom echo CLI";
    license = pkgs.lib.licenses.mit;
  };
}
