{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.cli-apps.wine;
in
{
  options.horizon.cli-apps.wine = with types; {
    enable = mkBoolOpt false "Whether or not to enable Wine.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      winePackages.unstable
      winetricks
      wine64Packages.unstable
    ];
  };
}
