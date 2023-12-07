{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.apps.ubports-installer;
in
{
  options.horizon.apps.ubports-installer = with types; {
    enable = mkBoolOpt false "Whether or not to enable the UBPorts Installer.";
  };

  config =
    mkIf cfg.enable {
      environment.systemPackages = with pkgs.horizon; [
        ubports-installer
      ];

      services.udev.packages = with pkgs.horizon; [
        ubports-installer-udev-rules
      ];
    };
}
