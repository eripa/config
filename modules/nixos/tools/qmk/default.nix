{ options, config, pkgs, lib, ... }:

with lib;
with lib.horizon;
let cfg = config.horizon.tools.qmk;
in
{
  options.horizon.tools.qmk = with types; {
    enable = mkBoolOpt false "Whether or not to enable QMK";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      qmk
    ];

    services.udev.packages = with pkgs; [
      qmk-udev-rules
    ];
  };
}
