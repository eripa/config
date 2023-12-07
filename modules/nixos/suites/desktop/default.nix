{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.suites.desktop;
in
{
  options.horizon.suites.desktop = with types; {
    enable =
      mkBoolOpt false "Whether or not to enable common desktop configuration.";
  };

  config = mkIf cfg.enable {
    horizon = {
      desktop = {
        gnome = enabled;

        addons = { wallpapers = enabled; };
      };

      apps = {
        _1password = enabled;
        firefox = enabled;
        vlc = enabled;
        logseq = enabled;
        hey = enabled;
        pocketcasts = enabled;
        yt-music = enabled;
        twitter = enabled;
        gparted = enabled;
      };
    };
  };
}
