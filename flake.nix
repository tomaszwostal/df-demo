{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-23.05-darwin";
  outputs = { self, nixpkgs }: {
    devShell.aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.mkShell {
      buildInputs = with nixpkgs.legacyPackages.aarch64-darwin; [
        cowsay
        ruby
      ];
    };
  };
}
# {
#   inputs.nixpkgs.url = github:nixos/nixpkgs/nixos-unstable;
#   inputs.flake-utils.url = "github:numtide/flake-utils";
#
#   outputs = { self, nixpkgs, flake-utils }:
#     flake-utils.lib.eachDefaultSystem (system:
#       let
#         pkgs = import nixpkgs { inherit system; };
#       in
#       {
#         packages.default = pkgs.buildEnv {
#           name = "hello";
#           paths = with pkgs; [
#             hello
#           ];
#         };
#       }
#     );
# }
