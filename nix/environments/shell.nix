{ pkgs, lib, config, ... }:
{
    options = {
        zsh-tools.enable = lib.mkEnableOption "enables tools for Zsh shell";
    };

    config = lib.mkIf config.zsh-tools.enable {
        environment.systemPackages = with pkgs; [
            ripgrep # Better grep command
            fzf # Fuzzy finder
            zoxide # Better cd command
        ];
    };
}
