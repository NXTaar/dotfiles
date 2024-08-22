{
  description = "Example Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
        url = "github:LnL7/nix-darwin";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    credentials = import ./credentials.nix;
    work = credentials.work;
    personal = credentials.personal;
  in 
  # let
  #   configuration = { pkgs, ... }: {
  #     # List packages installed in system profile. To search by name, run:
  #     # $ nix-env -qaP | grep wget
  #     environment.systemPackages =
  #       [ pkgs.vim
  #       ];
  #
  #     # Auto upgrade nix package and the daemon service.
  #     services.nix-daemon.enable = true;
  #     # nix.package = pkgs.nix;
  #
  #     # Necessary for using flakes on this system.
  #     nix.settings.experimental-features = "nix-command flakes";
  #
  #     # Create /etc/zshrc that loads the nix-darwin environment.
  #     programs.zsh.enable = true;  # default shell on catalina
  #     # programs.fish.enable = true;
  #
  #     # Set Git commit hash for darwin-version.
  #     system.configurationRevision = self.rev or self.dirtyRev or null;
  #
  #     # Used for backwards compatibility, please read the changelog before changing.
  #     # $ darwin-rebuild changelog
  #     system.stateVersion = 4;
  #
  #     # The platform the configuration will be used on.
  #     nixpkgs.hostPlatform = "x86_64-darwin";
  #   };
  # in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations.${work.hostname} = nix-darwin.lib.darwinSystem rec {
      system = "aarch64-darwin";
      specialArgs = inputs // (with credentials; with work;{
          inherit full-name;
          inherit hostname;
          inherit username;
          inherit email;
      });
      modules = [
          ./os/hosts.nix
          ./system/nix.nix
      ];
    };

    formatter.aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.alejandra;
    # Expose the package set, including overlays, for convenience.
    # darwinPackages = self.darwinConfigurations."simple".pkgs;
  };
}
