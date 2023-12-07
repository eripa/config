{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.apps.freetube;
in
{
  options.horizon.apps.freetube = with types; {
    enable = mkBoolOpt false "Whether or not to enable FreeTube.";
  };

  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs; [ freetube ]; };
}
