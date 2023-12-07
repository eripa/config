{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.apps.winetricks;
in
{
  options.horizon.apps.winetricks = with types; {
    enable = mkBoolOpt false "Whether or not to enable Winetricks.";
  };

  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs; [ winetricks ]; };
}
