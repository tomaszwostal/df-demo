{
  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-22.11;
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        packages.default = pkgs.buildEnv {
          name = "hello";
          paths = with pkgs; [
            hello
            exa
            zsh
            sudo
            shadow
          ];
        };
      }
    );
}
