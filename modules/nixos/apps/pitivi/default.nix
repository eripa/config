{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.apps.pitivi;
in
{
  options.horizon.apps.pitivi = with types; {
    enable = mkBoolOpt false "Whether or not to enable Pitivi.";
  };

  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs; [ pitivi ]; };
}
