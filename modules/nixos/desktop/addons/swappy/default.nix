{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let cfg = config.horizon.desktop.addons.swappy;
in
{
  options.horizon.desktop.addons.swappy = with types; {
    enable =
      mkBoolOpt false "Whether to enable Swappy in the desktop environment.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ swappy ];

    horizon.home.configFile."swappy/config".source = ./config;
    horizon.home.file."Pictures/screenshots/.keep".text = "";
  };
}
