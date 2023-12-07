{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.apps.gparted;
in
{
  options.horizon.apps.gparted = with types; {
    enable = mkBoolOpt false "Whether or not to enable gparted.";
  };

  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs; [ gparted ]; };
}
