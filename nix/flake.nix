{
  description = "vsgt Nix setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
        url = "github:LnL7/nix-darwin";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  {
    darwinConfigurations.workstation = nix-darwin.lib.darwinSystem rec {
      system = "aarch64-darwin";
      specialArgs = inputs // {
          inherit system;
          userType = "work";
      };
      modules = [
          ./os
          ./system/nix.nix
          ./platform
          ./apps
          ./environments
      ];
    };

    formatter.aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.alejandra;
  };
}
