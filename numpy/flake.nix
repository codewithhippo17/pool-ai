{
  description = "NumPy piscine exercise environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # Pinned nixpkgs that still has Python 3.8
    nixpkgs-python38.url = "github:NixOS/nixpkgs/nixos-23.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, nixpkgs-python38, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        pkgs-old = import nixpkgs-python38 { inherit system; };

        toolingPython = pkgs.python3.withPackages (ps: [
          ps.python-lsp-server
          ps.python-lsp-ruff
        ]);
      in
      {
        devShells.default = pkgs.mkShell {
          name = "numpy-piscine";

          packages = [
            pkgs-old.python38
            pkgs-old.python38Packages.virtualenv
            toolingPython
            pkgs-old.stdenv.cc.cc.lib
          ];

          shellHook = ''
            export LD_LIBRARY_PATH="${pkgs-old.stdenv.cc.cc.lib}/lib:''${LD_LIBRARY_PATH:-}"
            echo ""
            echo "=== NumPy Piscine ==="
            echo "Python 3.8: $(python3.8 --version 2>&1)"
            echo "==="
            echo ""
          '';
        };
      });
}
