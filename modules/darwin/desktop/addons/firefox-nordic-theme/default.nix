{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.desktop.addons.firefox-nordic-theme;
  profileDir = ".mozilla/firefox/${config.horizon.user.name}";
in
{
  options.horizon.desktop.addons.firefox-nordic-theme = with types; {
    enable = mkBoolOpt false "Whether to enable the Nordic theme for firefox.";
  };

  config = mkIf cfg.enable {
    horizon.apps.firefox = {
      extraConfig = builtins.readFile
        "${pkgs.horizon.firefox-nordic-theme}/configuration/user.js";
      userChrome = ''
        @import "${pkgs.horizon.firefox-nordic-theme}/userChrome.css";
      '';
    };
  };
}
