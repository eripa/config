{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.apps.gimp;
in
{
  options.horizon.apps.gimp = with types; {
    enable = mkBoolOpt false "Whether or not to enable Gimp.";
  };

  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs; [ gimp ]; };
}
