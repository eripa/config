{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let cfg = config.horizon.apps.cadence;
in
{
  options.horizon.apps.cadence = with types; {
    enable = mkBoolOpt false "Whether or not to enable Cadence.";
  };

  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs; [ cadence ]; };
}
