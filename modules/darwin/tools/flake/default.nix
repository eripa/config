{ lib, config, pkgs, ... }:

with lib;
with lib.horizon;
let
  cfg = config.horizon.tools.flake;
in
{
  options.horizon.tools.flake = {
    enable = mkEnableOption "Flake";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      snowfallorg.flake
    ];
  };
}
