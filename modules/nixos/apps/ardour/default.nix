{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.apps.ardour;
in
{
  options.horizon.apps.ardour = with types; {
    enable = mkBoolOpt false "Whether or not to enable Ardour.";
  };

  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs; [ ardour ]; };
}
