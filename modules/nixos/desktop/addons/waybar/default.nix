{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let cfg = config.horizon.desktop.addons.waybar;
in
{
  options.horizon.desktop.addons.waybar = with types; {
    enable =
      mkBoolOpt false "Whether to enable Waybar in the desktop environment.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ waybar ];

    horizon.home.configFile."waybar/config".source = ./config;
    horizon.home.configFile."waybar/style.css".source = ./style.css;
  };
}
