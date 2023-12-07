{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.apps.twitter;
in
{
  options.horizon.apps.twitter = with types; {
    enable = mkBoolOpt false "Whether or not to enable Twitter.";
  };

  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs.horizon; [ twitter ]; };
}
