{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.apps.yt-music;
in
{
  options.horizon.apps.yt-music = with types; {
    enable = mkBoolOpt false "Whether or not to enable YouTube Music.";
  };

  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs.horizon; [ yt-music ]; };
}
