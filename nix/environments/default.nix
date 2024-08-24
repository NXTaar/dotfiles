{ lib, ...}: {
    imports = [
        ./shell.nix
        ./rust.nix
    ];

    rust.enable = lib.mkDefault true;
    zsh-tools.enable = lib.mkDefault true;
}
