{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let cfg = config.horizon.apps.dolphin;
in
{
  options.horizon.apps.dolphin = with types; {
    enable = mkBoolOpt false "Whether or not to enable Dolphin.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ dolphin-emu ];

    # Enable GameCube controller support.
    services.udev.packages = [ pkgs.dolphinEmu ];
  };
}
