{ pkgs, lib, config, ... }:
{
    options = {
        rust.enable = lib.mkEnableOption "enables Rust environment";
    };

    config = lib.mkIf config.rust.enable {
        environment.systemPackages = with pkgs; [
            rustup
        ];
    };
}
