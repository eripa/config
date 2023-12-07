{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.apps.pocketcasts;
in
{
  options.horizon.apps.pocketcasts = with types; {
    enable = mkBoolOpt false "Whether or not to enable Pocketcasts.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs.horizon; [ pocketcasts ];
  };
}
