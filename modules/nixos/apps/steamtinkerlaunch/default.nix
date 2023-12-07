{ lib, pkgs, config, ... }:

let
  cfg = config.horizon.apps.steamtinkerlaunch;

  inherit (lib) mkIf mkEnableOption;
in
{
  options.horizon.apps.steamtinkerlaunch = {
    enable = mkEnableOption "Steam Tinker Launch";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      steamtinkerlaunch
    ];
  };
}
