{
  description = "Personal website and blog for Graham Balharrie";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    utils.url = "github:numtide/flake-utils";
    hugo-theme-stack = {
      url = "github:CaiJimmy/hugo-theme-stack";
      flake = false;
    };
  };

  outputs = inputs@{ self, nixpkgs, utils, ... }:
    utils.lib.eachSystem [
      utils.lib.system.x86_64-darwin
      utils.lib.system.x86_64-linux
      utils.lib.system.aarch64-darwin
      utils.lib.system.aarch64-linux
    ]
      (system:
        let
          pkgs = import nixpkgs {
            inherit system;
          };
        in
        rec {

          packages.website = pkgs.stdenv.mkDerivation {
            name = "website";
            src = self;
            buildInputs = [ pkgs.git pkgs.nodePackages.prettier ];
            buildPhase = ''
              mkdir -p themes
              ln -s ${inputs.hugo-theme-stack} themes/hugo-theme-stack
              sed -i -e 's/enableGitInfo = true/enableGitInfo = false/' config.yaml
              ${pkgs.hugo}/bin/hugo
              ${pkgs.nodePackages.prettier}/bin/prettier -w public '!**/*.{js,css}'
            '';
            installPhase = "cp -r public $out";
          };

          defaultPackage = self.packages.${system}.website;

          apps = rec {
            hugo = utils.lib.mkApp { drv = pkgs.hugo; };
            default = hugo;
          };

          devShell =
            pkgs.mkShell { buildInputs = [ pkgs.nixpkgs-fmt pkgs.hugo ]; };
        });
}