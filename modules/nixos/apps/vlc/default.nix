{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.apps.vlc;
in
{
  options.horizon.apps.vlc = with types; {
    enable = mkBoolOpt false "Whether or not to enable vlc.";
  };

  config = mkIf cfg.enable { environment.systemPackages = with pkgs; [ vlc ]; };
}
