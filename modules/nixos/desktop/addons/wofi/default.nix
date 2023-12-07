{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let cfg = config.horizon.desktop.addons.wofi;
in
{
  options.horizon.desktop.addons.wofi = with types; {
    enable =
      mkBoolOpt false "Whether to enable the Wofi in the desktop environment.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ wofi wofi-emoji ];

    # config -> .config/wofi/config
    # css -> .config/wofi/style.css
    # colors -> $XDG_CACHE_HOME/wal/colors
    # horizon.home.configFile."foot/foot.ini".source = ./foot.ini;
    horizon.home.configFile."wofi/config".source = ./config;
    horizon.home.configFile."wofi/style.css".source = ./style.css;
  };
}
