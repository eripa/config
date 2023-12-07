{ options, config, lib, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.apps.protontricks;
in
{
  options.horizon.apps.protontricks = with types; {
    enable = mkBoolOpt false "Whether or not to enable Protontricks.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ protontricks ];
  };
}
